from celery import shared_task

from .models import FieldOfStudy, Group
from .serializers import (
    FieldOfStudyGetSerializer, GroupSerializer
)


@shared_task()
def get_report():
    fields_queryset = FieldOfStudy.objects.all()
    fields_serializer = FieldOfStudyGetSerializer(fields_queryset, many=True)
    group_queryset = Group.objects.all()
    group_serializer = GroupSerializer(group_queryset, many=True)
    result = {
        'fields_of_study': fields_serializer.data,
        'groups': group_serializer.data
    }
    return result
