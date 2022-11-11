from django.contrib import admin

from .models import (
    FieldOfStudy, Group, AcademicDiscipline, Student, FieldDiscipline
)


class DisciplinesOfField(admin.TabularInline):
    model = FieldDiscipline
    extra = 1


@admin.register(FieldOfStudy)
class RecipeAdmin(admin.ModelAdmin):
    list_display = ('name', 'handler')
    search_fields = ('name', 'handler')
    inlines = [DisciplinesOfField]


admin.site.register(AcademicDiscipline)
admin.site.register(Group)
admin.site.register(Student)
admin.site.register(FieldDiscipline)
