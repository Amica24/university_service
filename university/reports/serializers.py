from rest_framework import serializers

from .models import (
    Student, FieldOfStudy, AcademicDiscipline, User, Group
)

MAX_NUMBER_OF_STUDENTS = 20


class HandlerCreateProfileSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=False)

    class Meta:
        model = User
        fields = (
            'email',
            'first_name',
            'last_name',
        )
        read_only_fields = ('id',)


class StudentCreateSerializer(serializers.ModelSerializer):
    field_of_study = serializers.PrimaryKeyRelatedField(queryset=FieldOfStudy.objects.all())
    group = serializers.PrimaryKeyRelatedField(queryset=Group.objects.all())

    class Meta:
        model = Student
        fields = (
            'id',
            'email',
            'first_name',
            'last_name',
            'sex',
            'field_of_study',
            'group'
        )
        read_only_fields = ('id',)

    def validate(self, data):
        group = self.initial_data.get('group')
        number_of_students = Group.objects.filter(number=group)
        if len(number_of_students) == 20:
            raise serializers.ValidationError(
                'Колиичество студентов в группе не может превышать 20'
            )


class StudentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Student
        fields = (
            'id',
            'email',
            'first_name',
            'last_name',
            'sex'
        )


class GroupCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Group
        fields = (
            'id',
            'number'
        )
    read_only_fields = ('id',)


class GroupSerializer(serializers.ModelSerializer):
    students = serializers.SerializerMethodField()
    male = serializers.SerializerMethodField()
    female = serializers.SerializerMethodField()
    places_left = serializers.SerializerMethodField()

    class Meta:
        model = Group
        fields = (
            'id',
            'number',
            'students',
            'male',
            'female',
            'places_left'

        )

    def get_students(self, obj):
        students = Student.objects.filter(group=obj)
        return StudentSerializer(students, many=True).data

    def get_male(self, obj):
        number_of_male = Student.objects.filter(group=obj, sex='М')
        return len(number_of_male)

    def get_female(self, obj):
        number_of_female = Student.objects.filter(group=obj, sex='Ж')
        return len(number_of_female)

    def get_places_left(self, obj):
        places_left = obj.students.all()
        return MAX_NUMBER_OF_STUDENTS - len(places_left)


class AcademicDisciplineSerializer(serializers.ModelSerializer):

    class Meta:
        model = AcademicDiscipline
        fields = (
            'id',
            'name'
        )
    read_only_fields = ('id',)


class FieldOfStudyCreateSerializer(serializers.ModelSerializer):
    academic_disciplines = AcademicDisciplineSerializer(many=True)
    handler = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())

    class Meta:
        model = FieldOfStudy
        fields = (
            'id',
            'name',
            'academic_disciplines',
            'handler'
        )
        read_only_fields = ('id',)


class FieldOfStudyGetSerializer(serializers.ModelSerializer):
    academic_disciplines = serializers.SlugRelatedField(
        many=True,
        read_only=True,
        slug_field='name'
     )
    handler = HandlerCreateProfileSerializer(read_only=True)

    class Meta:
        model = FieldOfStudy
        fields = (
            'id',
            'name',
            'academic_disciplines',
            'handler'
        )
        read_only_fields = ('id',)
