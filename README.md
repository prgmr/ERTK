# ERTK

REST API интерфейс.
Для реализации выбран python веб-фреймворк Flask, база данных postgresql и nginx в качестве балансировщика. Все составные части размещаются в docker-контейнерах.

Для автоматического разворачивания сервиса создан ansible playbook.
Запускать так: 
ansible-playbook ansible/playbook.yml


Запросы для тестирования интерфейса.
curl -XGET 'localhost/api/1.0/movies' - получить список всех фильмов

curl -XDELETE 'localhost/api/1.0/movies/11' - удалить фильм с id=11

curl -XPOST -H 'Content-Type: application/json' -d '{"title":"Название","description":"Описание", "actors": "Актеры"}' 'localhost/api/1.0/movies' - добавить новый фильм

curl -XPUT -H 'Content-Type: application/json' -d '{"title":"123","description":"456","actors":"789"}' 'localhost/api/1.0/movies/2' - заменить фильм с id=2
