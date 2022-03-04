from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework import permissions
from rest_framework.decorators import action
from rest_framework import status
from rest_framework.response import Response
from django.db import IntegrityError
from .serializers import CourseSerializer, LessonSerializer, CommentSerializer
from .models import Course, Lesson, Comment, Tag
from rest_framework.generics import CreateAPIView


class CourseViewSet(viewsets.ModelViewSet):
    queryset = Course.objects.filter(active=True).all()
    serializer_class = CourseSerializer
    permission_classes = [IsAuthenticated]

    @action(methods=['post'], detail=True, url_path='hide-course', url_name='hide-course')
    def hide_course(self, request, pk):
        try:
            course = Course.objects.get(pk=pk)
            course.active = False
            course.save()
        except Course.DoesNotExists:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(data=CourseSerializer(course).data, status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='show-course', url_name='show-course')
    def show_course(self, request, pk):
        try:
            course = Course.objects.get(pk=pk)
            course.active = True
            course.save()
        except Course.DoesNotExists:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(data=CourseSerializer(course).data, status=status.HTTP_200_OK)


class LessonViewSet(viewsets.ModelViewSet):
    queryset = Lesson.objects.filter(active=True).all()
    serializer_class = LessonSerializer

    @action(methods=['post'], detail=True, name='Add comment to lesson',
            url_path='add-comment-to-lesson', url_name='add-comment-to-lesson')
    def add_tag_to_lesson(self, request, pk):
        lesson = Lesson.objects.get(pk=pk)
        try:
            tags = request.data.get('tags')
            for tag in tags.split(','):
                t, _ = Tag.objects.get_or_create(name=tag)
                lesson.tags.add(t)
            lesson.save()
        except (Lesson.DoesNotExist | KeyError):
            return Response(status=status.HTTP_404_NOT_FOUND)
        lesson_serializer = LessonSerializer(lesson)
        return Response(data=lesson_serializer.data, status=status.HTTP_200_OK)


class CommentAPIView(APIView):
    def get_permissions(self):
        if self.request.method == 'GET':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]

    def get(self, request, lesson_id):
        comment = Comment.objects.filter(lesson_id=lesson_id)
        try:
            comment_serializer = CommentSerializer(comment, many=True)
        except (KeyError, Comment.DoesNotExist):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(data=comment_serializer.data, status=status.HTTP_200_OK)

    def post(self, request, lesson_id):
        content = request.data.get('content')
        if content is not None:
            try:
                c = Comment.objects.create(content=content,
                                           user=request.user,
                                           lesson_id=lesson_id)
            except IntegrityError:
                err_msg = "lesson does not exist!"
            else:
                return Response(CommentSerializer(c).data, status=status.HTTP_201_CREATED)
        else:
            err_msg = "Content is required!"
        return Response(data={'err_msg': err_msg}, status=status.HTTP_400_BAD_REQUEST)

    def put(self):
        pass

    def delete(self):
        pass

    def patch(self):
        pass
