from rest_framework import serializers
from .models import (Category, Course, Lesson,
                     Tag, Comment, User, Rating,
                     View)


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']


class CourseSerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField(source='image')

    def get_image(self, course):
        request = self.context['request']
        if course.image.name.startswith('static/'):
            path = "/%s" % course.image.name
        else:
            path = '/static/%s' % course.image.name
        return request.build_absolute_uri(path)

    class Meta:
        model = Course
        fields = ['id', 'subject', 'image', 'created_date', 'category_id']


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id', 'name']


class LessonSerializer(serializers.ModelSerializer):
    tags = TagSerializer(many=True)
    image = serializers.SerializerMethodField(source='image')

    def get_image(self, lesson):
        request = self.context['request']
        if lesson.image.name.startswith('static/'):
            path = "/%s" % lesson.image.name
        else:
            path = '/static/%s' % lesson.image.name
        return request.build_absolute_uri(path)

    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image', 'course_id', 'created_date', 'updated_date', 'tags']


class LessonDetailSerializer(LessonSerializer):
    class Meta:
        model = LessonSerializer.Meta.model
        fields = LessonSerializer.Meta.fields + ['content']


class UserCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username']


class UserSerializer(serializers.ModelSerializer):
    avatar_path = serializers.SerializerMethodField(source='avatar')

    def get_avatar_path(self, user):
        request = self.context['request']

        if user.avatar and not user.avatar.name.startswith('/static'):
            path = '/static/%s' % user.avatar.name
            return request.build_absolute_uri(path)

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        user.set_password(user.password)
        user.save()
        return user

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'password', 'email', 'avatar', 'avatar_path']
        extra_kwargs = {
            'password': {
                'write_only': True,
            },
            'avatar': {
                'write_only': True,
            },
            'avatar_path': {
                'read_only': True
            }
        }


class BaseCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['id', 'content']


class CommentSerializer(BaseCommentSerializer):
    user = UserCommentSerializer()

    class Meta:
        model = BaseCommentSerializer.Meta.model
        fields = BaseCommentSerializer.Meta.fields + ['created_date', 'updated_date', 'user']


class RatingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rating
        fields = ['rating']


class ViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = View
        fields = ['view']
