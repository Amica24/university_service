# University_service
### Описание проекта

Проект "University_service" представляет собой веб-сервис для организации учебного процесса в ВУЗе.
Запросы к API осуществлены на основе Django REST Framework.

Основные функции веб-сервиса:

```
Отчет администратора содержит в себе информацию о направлениях(список направлений и их дисциплин и данные кураторов) 
и о группах(отсортированный список студентов, данные о составе групп(кол-во мужчин и женщин, количество свободных мест в группе)).
```

### Как запустить проект:

Клонировать репозиторий и перейти в него в командной строке:

```
git clone git@github.com:Amica24/university_service.git
```

```
cd university_service
```

Запустить проект:

```
docker-compose up -d --build
```
Выполните команды:
```
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser
```
Команда для восстановления дампа базы данных:
```
docker exec -t db psql -c -U postgres < dump.json
```

### Примеры запросов к API:

Запросы к API начинаются с `http://127.0.0.1:8000/api/`


**/tasks/**

* Отправление задачи на составление отчета адмиинистратора.
* Права доступа: Админиистратор.

Пример ответа при удачном выполнении запроса:
```
{
    "task_id": "b5b36d5c-24b7-4325-ad8e-cdb729f030ac"
}
```

**/tasks/<task_id>/

* Узнать статус задачи и получить отчет адмиинистратора.
* Права доступа: Админиистратор.

Пример ответа при удачном выполнении запроса:

```
{
    "task_id": "a6a383e9-9b63-4f2d-a596-dc516821e0af",
    "task_status": "SUCCESS",
    "task_result": {
        "fields_of_study": [
            {
                "id": 1,
                "name": "Фундаментальная и прикладная физика",
                "academic_disciplines": [
                    "Физика",
                    "Математика",
                    "Механика"
                ],
                "handler": {
                    "email": "isaac@gmail.com",
                    "first_name": "Исаак",
                    "last_name": "Ньютон"
                }
            },
        ],
        "groups": [
            {
                "id": 1,
                "number": "X-450005",
                "students": [
                    {
                        "id": 4,
                        "email": "paster@gmail.com",
                        "first_name": "Луи",
                        "last_name": "Пастер",
                        "sex": "М"
                    },
                    {
                        "id": 5,
                        "email": "curie@gmail.com",
                        "first_name": "Мария",
                        "last_name": "Кюри",
                        "sex": "Ж"
                    },
                    {
                        "id": 6,
                        "email": "mendeleev@yandex.ru",
                        "first_name": "Дмитирий",
                        "last_name": "Менделеев",
                        "sex": "М"
                    }
                ],
                "male": 2,
                "female": 1,
                "places_left": 17
            }
        ]
    }
}

```
GET-запрос для получения списка всех направлениий подготовки на
http://127.0.0.1:8000/api/fields_of_study/

Пример ответа при удачном выполнении запроса с пагинацией:

```
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 1,
            "name": "Фундаментальная и прикладная физика",
            "academic_disciplines": [
                "Физика",
                "Математика",
                "Механика"
            ],
            "handler": {
                "email": "isaac@gmail.com",
                "first_name": "Исаак",
                "last_name": "Ньютон"
            }
        }
    ]
}

```

GET-запрос для получения информации о cтуденте
http://127.0.0.1:8000/api/students/1/


Пример ответа при удачном выполнении запроса:


```
{
    "id": 1,
    "email": "tesla@gmail.com",
    "first_name": "Никола",
    "last_name": "Тесла",
    "sex": "М"
}
```
## Документация Swagger

Выше приведены лишь некоторые примеры запросов. Все доступные эндпоинты, примеры
запросов и ответов доступны после запуска сервера по [адресу](http://127.0.0.1:8000/swagger/).