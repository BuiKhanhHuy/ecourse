from rest_framework import serializers
from .models import Category, Course, Lesson, Tag, Comment, User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'email', 'avatar']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        data = validated_data.copy()
        print(data)
        user = User(**data)
        user.set_password(user.password)
        user.save()
        return user


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = ['id', 'subject', 'description', 'created_date',
                  'updated_date', 'active', 'category']


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id', 'name']


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['user_id', 'lesson_id', 'content']


class LessonSerializer(serializers.ModelSerializer):
    tags = TagSerializer(many=True)

    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'content', 'created_date', 'updated_date', 'active', 'course', 'tags']
