from django.contrib.auth import get_user_model
from django.db import models

User = get_user_model()

CHOICES = (
        ('М', 'Мужчина'),
        ('Ж', 'Женщина'),
    )


class AcademicDiscipline(models.Model):
    name = models.TextField()

    def __str__(self):
        return self.name


class FieldOfStudy(models.Model):
    name = models.TextField()
    academic_disciplines = models.ManyToManyField(
        AcademicDiscipline,
        through='FieldDiscipline',
        verbose_name='Дисциплина'
    )
    handler = models.ForeignKey(
        User, on_delete=models.CASCADE,
        related_name='field_of_study'
    )

    def __str__(self):
        return self.name


class Group(models.Model):
    number = models.TextField()

    def __str__(self):
        return self.number


class Student(models.Model):
    first_name = models.CharField(
        max_length=150,
        blank=True,
        verbose_name='Имя'
    )
    last_name = models.CharField(
        max_length=150,
        blank=True,
        verbose_name='Фамилия'
    )
    email = models.EmailField(
        max_length=254,
        unique=True,
        verbose_name='Электронная почта'
    )
    sex = models.CharField(max_length=10, choices=CHOICES)
    field_of_study = models.ForeignKey(
        FieldOfStudy, on_delete=models.CASCADE,
        related_name='students'
    )
    group = models.ForeignKey(
        Group, on_delete=models.CASCADE,
        related_name='students'
    )

    class Meta:
        ordering = ['id']

    def __str__(self):
        return f'{self.first_name} {self.last_name}'


class FieldDiscipline(models.Model):
    field_of_study = models.ForeignKey(
        FieldOfStudy,
        verbose_name='Направление подготовки',
        on_delete=models.CASCADE,
    )
    academic_discipline = models.ForeignKey(
        AcademicDiscipline,
        verbose_name='Дисциплина',
        on_delete=models.CASCADE,
    )

    class Meta:
        verbose_name = 'Дисциплина направления подготовки'
        verbose_name_plural = 'Дисциплины направлений подготовки'
        constraints = [
            models.UniqueConstraint(
                fields=['field_of_study', 'academic_discipline'],
                name='unique_student_discipline'
            ),
        ]

    def __str__(self):
        return f'{self.field_of_study} {self.academic_discipline}'
