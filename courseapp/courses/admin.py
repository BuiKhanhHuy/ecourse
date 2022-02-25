from django.contrib import admin
from django import forms
from django.urls import path
from django.template.response import TemplateResponse
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from .models import Category, Course, Lesson, Tag, User
from django.contrib.auth.models import Group
from django.db.models import Count
from django.utils.html import mark_safe


class CoursesAppAdmin(admin.AdminSite):
    site_title = 'e-course'
    site_header = 'E-course System'

    def get_urls(self):
        return [
                   path('course-stats/', self.course_stats, name='course-stats'),
               ] + super().get_urls()

    def course_stats(self, request):
        course_total = Course.objects.count()
        lesson_total_of_course = Course.objects.annotate(lesson_number=Count('lessons')) \
            .values('pk', 'subject', 'lesson_number')
        template = 'admin/course-stats.html'
        return TemplateResponse(request, template,
                                {'course_total': course_total,
                                 'lesson_total_of_course': lesson_total_of_course})


class LessonTagInline(admin.StackedInline):
    model = Lesson.tags.through


class LessonFormAdmin(forms.ModelForm):
    content = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Lesson
        fields = '__all__'


class CourseInline(admin.StackedInline):
    model = Course
    fk_name = 'category'


class UserAdmin(admin.ModelAdmin):
    list_display = ['username', 'email', 'first_name', 'last_name',
                    'date_joined', 'last_login', 'is_superuser', 'is_active']
    list_filter = ['username']
    search_fields = ['username']
    readonly_fields = ['show_avatar']

    def show_avatar(self, user):
        if user:
            return mark_safe(
                "<img src='/static/{0}' alt='{1}' width='100px'/>".format(user.avatar.name, user.username)
            )


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name']
    list_filter = ['name']
    search_fields = ['name']
    inlines = [CourseInline]


class CourseAdmin(admin.ModelAdmin):
    list_display = ['subject', 'description', 'created_date', 'updated_date',
                    'category', 'active']
    list_filter = ['subject', 'description', 'created_date', 'updated_date',
                   'category', 'active']
    search_fields = ['subject', 'description']


class LessonAdmin(admin.ModelAdmin):
    list_display = ['subject', 'created_date', 'updated_date',
                    'course', 'active']
    list_filter = ['subject', 'created_date', 'updated_date', 'course', 'active']
    search_fields = ['subject', 'course']
    inlines = [LessonTagInline]
    form = LessonFormAdmin


class TagAdmin(admin.ModelAdmin):
    pass


admin_site = CoursesAppAdmin(name='Hệ thống khóa học trực tuyến')

admin_site.register(Group)
admin_site.register(Category, CategoryAdmin)
admin_site.register(Course, CourseAdmin)
admin_site.register(Lesson, LessonAdmin)
admin_site.register(Tag, TagAdmin)
admin_site.register(User, UserAdmin)
