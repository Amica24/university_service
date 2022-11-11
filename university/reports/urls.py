from django.urls import include, path
from rest_framework.routers import SimpleRouter

from .views import (
    FieldOfStudyViewSet, AcademicDisciplineViewSet, GroupViewSet,
    StudentViewSet, run_task, get_status
)

router = SimpleRouter()

router.register(
    'fields_of_study', FieldOfStudyViewSet, basename='fields_of_study'
)
router.register(
    'academic_disciplines', AcademicDisciplineViewSet, basename='academic_disciplines'
)
router.register(
    'groups', GroupViewSet, basename='groups'
)
router.register(
    'students', StudentViewSet, basename='students'
)

urlpatterns = [
    path('', include(router.urls)),
    path('tasks/<task_id>/', get_status, name='get_status'),
    path('tasks/', run_task, name='run_task')
]
