from rest_framework import serializers
from .models import (Category, Course, Lesson,
                     Tag, Comment, User, Rating,
                     View)


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = ['id', 'subject', 'created_date', 'category_id']


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id', 'name']


class LessonSerializer(serializers.ModelSerializer):
    tags = TagSerializer(many=True)

    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'course_id', 'created_date', 'updated_date', 'tags']


class LessonDetailSerializer(LessonSerializer):
    class Meta:
        model = LessonSerializer.Meta.model
        fields = LessonSerializer.Meta.fields + ['content']


class UserCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username']


class UserSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        user = User.userects.create_user(**validated_data)
        user.set_password(user.password)
        user.save()
        return user

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'date_joined']


class UserDetailSerializer(serializers.ModelSerializer):
    avatar = serializers.SerializerMethodField(source='avatar')

    def get_avatar(self, user):
        request = self.context['request']
        if user.avatar.name.startswith('static/'):
            path = "/%s" % user.avatar.name
        else:
            path = '/static/%s' % user.avatar
        return request.build_absolute_uri(path)

    class Meta:
        model = User
        fields = ['avatar', 'first_name', 'last_name', 'username', 'password', 'email']


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
