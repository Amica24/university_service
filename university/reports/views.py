from celery.result import AsyncResult
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework import permissions, viewsets

from .models import FieldOfStudy, Group, AcademicDiscipline, Student
from .serializers import (
    FieldOfStudyCreateSerializer, FieldOfStudyGetSerializer, GroupCreateSerializer, GroupSerializer,
    AcademicDisciplineSerializer, StudentSerializer, StudentCreateSerializer
)
from .tasks import get_report


class FieldOfStudyViewSet(viewsets.ModelViewSet):
    queryset = FieldOfStudy.objects.all()
    permission_classes = [
        permissions.IsAdminUser
    ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return FieldOfStudyGetSerializer
        return FieldOfStudyCreateSerializer

    def perform_create(self, serializer):
        serializer.save()


class AcademicDisciplineViewSet(viewsets.ModelViewSet):
    queryset = AcademicDiscipline.objects.all()
    serializer_class = AcademicDisciplineSerializer
    permission_classes = [
        permissions.IsAdminUser
    ]

    def perform_create(self, serializer):
        serializer.save()


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    permission_classes = [
        permissions.IsAuthenticatedOrReadOnly
    ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return GroupSerializer
        return GroupCreateSerializer

    def perform_create(self, serializer):
        serializer.save()


class StudentViewSet(viewsets.ModelViewSet):
    queryset = Student.objects.all()
    permission_classes = [
        permissions.IsAuthenticatedOrReadOnly
    ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return StudentSerializer
        return StudentCreateSerializer

    def perform_create(self, serializer):
        serializer.save()


@csrf_exempt
def run_task(request):
    if request.user.is_superuser:
        raise PermissionError('Формирование отчета доступно только для администратора')
    if request.method == 'POST':
        task = get_report.delay()
        return JsonResponse({"task_id": task.id}, status=202)


@csrf_exempt
def get_status(request, task_id):
    task_result = AsyncResult(task_id)
    result = {
        "task_id": task_id,
        "task_status": task_result.status,
        "task_result": task_result.result
    }
    return JsonResponse(result, status=200)
