from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField


class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatars/%Y/%m/', null=True)


class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    class Meta:
        abstract = True


class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Course(BaseModel):
    subject = models.CharField(max_length=100)
    description = models.CharField(max_length=255, null=True)
    image = models.ImageField(null=True, upload_to="courses/%Y/%m/%d/")
    category = models.ForeignKey('Category', null=True,
                                 related_name='courses',
                                 on_delete=models.SET_NULL)

    def __str__(self):
        return self.subject


class Lesson(BaseModel):
    subject = models.CharField(max_length=255)
    content = RichTextField()
    course = models.ForeignKey('Course', null=True,
                               related_name='lessons',
                               on_delete=models.CASCADE)
    tags = models.ManyToManyField('Tag', blank=True,
                                  related_name='lessons')
    commenters = models.ManyToManyField('User', through='Comment',
                                        related_name='lessons_comment')
    actors = models.ManyToManyField('User', through='Action',
                                    related_name='lesson_action')
    raters = models.ManyToManyField('User', through='Rating',
                                    related_name='lessons_rating')

    def __str__(self):
        return self.subject


class Tag(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


class Comment(models.Model):
    content = models.TextField()
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    user = models.ForeignKey('User', null=True,
                             on_delete=models.CASCADE)
    lesson = models.ForeignKey('Lesson', null=True,
                               on_delete=models.CASCADE)


class BaseAction(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    user = models.ForeignKey('User', null=True,
                             on_delete=models.CASCADE)
    lesson = models.ForeignKey('Lesson', null=True,
                               on_delete=models.CASCADE)

    class Meta:
        abstract = True


class Action(BaseAction):
    active = models.BooleanField(default=True)


class Rating(BaseAction):
    rating = models.DecimalField(default=5, max_digits=2, decimal_places=1)


class View(models.Model):
    create_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    view = models.BigIntegerField(default=0)
    lesson = models.OneToOneField('Lesson', related_name='view', on_delete=models.CASCADE)
