from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField


class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m/', null=True)


class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Course(BaseModel):
    subject = models.CharField(max_length=100)
    description = models.CharField(max_length=255, null=True)
    active = models.BooleanField(default=True)
    category = models.ForeignKey('Category', null=True,
                                 related_name='courses',
                                 on_delete=models.SET_NULL)

    def __str__(self):
        return self.subject


class Lesson(BaseModel):
    active = models.BooleanField(default=True)
    subject = models.CharField(max_length=255)
    content = RichTextField()
    course = models.ForeignKey('Course', null=True,
                               related_name='lessons',
                               on_delete=models.SET_NULL)
    tags = models.ManyToManyField('Tag', blank=True,
                                  related_name='lessons')
    commenters = models.ManyToManyField('User', through='Comment',
                                        related_name='lessons_comment')
    raters = models.ManyToManyField('User', through='Rating',
                                    related_name='lessons_rating')

    def __str__(self):
        return self.subject


class Tag(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Comment(BaseModel):
    content = models.TextField()
    user = models.ForeignKey('User', null=True,
                             on_delete=models.SET_NULL)
    lesson = models.ForeignKey('Lesson', null=True,
                               on_delete=models.SET_NULL)


class Rating(BaseModel):
    rating = models.DecimalField(max_digits=2, decimal_places=1)
    user = models.ForeignKey('User', null=True,
                             on_delete=models.SET_NULL)
    lesson = models.ForeignKey('Lesson', null=True,
                               on_delete=models.SET_NULL)
