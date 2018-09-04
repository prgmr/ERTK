# ERTK

REST API интерфейс.
Для реализации выбран python веб-фреймворк Flask, база данных postgresql и nginx в качестве балансировщика. Все составные части размещаются в docker-контейнерах.

Для автоматического разворачивания сервиса создан ansible playbook.
Запускать так: 
ansible-playbook ansible/playbook.yml

Структура проекта:
ERTK
├── ansible
│   └── playbook.yml
├── app
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
├── docker-compose.yml
├── nginx
│   ├── docker-compose
│   │   ├── Dockerfile
│   │   └── nginx.conf
│   ├── Dockerfile
│   ├── nginx.conf
│   └── templates
│       └── nginx.conf.j2
├── README.md
├── storage
│   └── pg_ertk_db_movies.sql
└── vagrant
    └── Vagrantfile


Запросы для тестирования интерфейса.
curl -XGET 'localhost/api/1.0/movies' - получить список всех фильмов

curl -XDELETE 'localhost/api/1.0/movies/11' - удалить фильм с id=11

curl -XPOST -H 'Content-Type: application/json' -d '{"title":"Название","description":"Описание", "actors": "Актеры"}' 'localhost/api/1.0/movies' - добавить новый фильм

curl -XPUT -H 'Content-Type: application/json' -d '{"title":"123","description":"456","actors":"789"}' 'localhost/api/1.0/movies/2' - заменить фильм с id=2
