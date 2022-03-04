from django.urls import path, include
from .admin import admin_site
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(prefix='courses', viewset=views.CourseViewSet, basename='api-course')
router.register(prefix='lessons', viewset=views.LessonViewSet, basename='api-lesson')


urlpatterns = [
    path('courses/', include(router.urls)),
    path('admin/', admin_site.urls, name='admin'),
    path('lessons/<int:lesson_id>/comments/', views.CommentAPIView.as_view(), name='comment')
]
