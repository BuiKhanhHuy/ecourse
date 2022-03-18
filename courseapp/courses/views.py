from rest_framework import viewsets, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import action
from rest_framework import permissions
from django.http import Http404
from django.db.models import F
from .models import (Category, Course, Lesson, Comment,
                     User, Tag, Action, Rating, View)
from .serializers import (CategorySerializer, CourseSerializer,
                          LessonSerializer, LessonDetailSerializer,
                          CommentSerializer, BaseCommentSerializer,
                          UserSerializer, UserDetailSerializer,
                          RatingSerializer, ViewSerializer)
from .paginator import CoursePagination


class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects
    serializer_class = CategorySerializer


class CourseViewSet(viewsets.ViewSet, generics.ListAPIView):
    serializer_class = CourseSerializer
    pagination_class = CoursePagination

    def get_queryset(self):
        course = Course.objects.filter(active=True)

        category_id = self.request.query_params.get('category_id')
        if category_id is not None:
            course = course.filter(category_id=category_id)

        q = self.request.query_params.get('q')
        if q is not None:
            course = course.filter(subject__icontains=q)

        return course

    @action(methods=['get'], detail=True, url_path='lessons', url_name='lessons')
    def lessons(self, request, pk):
        course = Course.objects.get(pk=pk)
        lessons = course.lessons

        q = request.query_params.get('q')
        if q is not None:
            lessons = lessons.filter(subject__icontains=q)
        return Response(data=LessonSerializer(lessons, many=True).data, status=status.HTTP_200_OK)


class LessonViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = Lesson.objects.filter(active=True)
    serializer_class = LessonDetailSerializer

    def get_permissions(self):
        if self.action in ['add_comment', 'like_action', 'rating']:
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['get'], detail=True, url_path='comments', url_name='comments')
    def comments(self, request, pk):
        comments = Comment.objects.filter(lesson=self.get_object())
        return Response(data=CommentSerializer(comments, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='add-comments', url_name='add-comments')
    def add_comment(self, request, pk):
        try:
            lesson = self.get_object()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            content = request.data.get('content')
            if content is not None:
                comment = Comment.objects.create(lesson=lesson, user=request.user, content=content)
                return Response(data=BaseCommentSerializer(comment).data, status=status.HTTP_201_CREATED)
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, url_path='tags', url_name='tags')
    def add_tags(self, request, pk):
        try:
            lesson = self.get_object()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            tags = request.data.get("tags")
            if tags is not None:
                for tag in tags:
                    tag_obj, _ = Tag.objects.get_or_create(name=tag)
                    lesson.tags.add(tag_obj)
                lesson.save()
                return Response(data=LessonDetailSerializer(lesson).data, status=status.HTTP_201_CREATED)
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, url_path='like', url_name='like')
    def like_action(self, request, pk):
        try:
            act, create = Action.objects.get_or_create(lesson=self.get_object(), user=request.user)
            if create is False:
                if act.active is True:
                    act.active = False
                else:
                    act.active = True
                act.save()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            return Response(status=status.HTTP_200_OK)

    @action(methods=['put'], detail=True, url_path='rating', url_name='rating')
    def rating(self, request, pk):
        try:
            rating = request.data.get('rating')
            if rating is not None:
                ra, _ = Rating.objects.get_or_create(lesson=self.get_object(),
                                                     user=request.user)
                ra.rating = rating
                ra.save()
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST)
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            return Response(data=RatingSerializer(ra).data,
                            status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='view', url_name='view')
    def view(self, request, pk):
        try:
            vie, _ = View.objects.get_or_create(lesson=self.get_object())
            vie.view = F('view') + 1
            vie.save()
            vie.refresh_from_db()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            return Response(data=ViewSerializer(vie).data, status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer


class UserApiView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user_serializer = UserDetailSerializer(request.user, context={'request': request})
        return Response(data=user_serializer.data, status=status.HTTP_200_OK)

    def put(self, request):
        pass


class CommentViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Comment.objects
    serializer_class = BaseCommentSerializer
    permission_classes = [permissions.IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        try:
            if request.user == self.get_object().user:
                Comment.objects.get(pk=self.get_object().pk).delete()
            else:
                return Response(status=status.HTTP_403_FORBIDDEN)
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            return Response(status=status.HTTP_204_NO_CONTENT)

    def update(self, request, *args, **kwargs):
        try:
            if request.user == self.get_object().user:
                content = request.data.get('content')
                if content is not None:
                    comment = Comment.objects.get(pk=self.get_object().pk)
                    comment.content = content
                    comment.save()
                else:
                    return Response(status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response(status=status.HTTP_403_FORBIDDEN)
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            return Response(data=BaseCommentSerializer(comment).data,
                            status=status.HTTP_200_OK)
