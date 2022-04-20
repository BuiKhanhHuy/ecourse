from django.urls import path, include
from .admin import admin_site
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(prefix='categories', viewset=views.CategoryViewSet, basename='category')
router.register(prefix='courses', viewset=views.CourseViewSet, basename='course')
router.register(prefix='lessons', viewset=views.LessonViewSet, basename='lessons')
router.register(prefix='users', viewset=views.UserViewSet, basename='user')
router.register(prefix='comments', viewset=views.CommentViewSet, basename='comment')

urlpatterns = [
    path('', include(router.urls)),
    path('user/', views.UserAPIView.as_view(), name='get_user'),
    path('oauth2-info/', views.Oauth2Info.as_view(), name='info-auth'),
    path('admin/', admin_site.urls, name='admin'),
]
