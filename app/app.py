#!/bin/env python3

import postgresql
import flask
import json

app = flask.Flask(__name__)

# disables JSON pretty-printing in flask.jsonify
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = False
app.config['JSON_AS_ASCII'] = False

def db_conn():
    return postgresql.open('pq://postgres:12345@ertk_storage/ertk')


def to_json(data):
    return json.dumps(data, ensure_ascii=False) + "\n"


def resp(code, data):
    return flask.Response(
        status=code,
        mimetype="application/json",
        response=to_json(data)
    )


def movie_validate():
    errors = []
    json = flask.request.get_json()
    if json is None:
        errors.append(
            "No JSON sent. Did you forget to set Content-Type header" +
            " to application/json?")
        return (None, errors)

    for field_name in ['title', 'description', 'actors']:
        if type(json.get(field_name)) is not str:
            errors.append(
                "Field '{}' is missing or is not a string".format(
          field_name))

    return (json, errors)


def affected_num_to_code(cnt):
    code = 200
    if cnt == 0:
        code = 404
    return code


@app.route('/')
def root():
    return flask.redirect('/api/1.0/movies')

# e.g. failed to parse json
@app.errorhandler(400)
def page_not_found(e):
    return resp(400, {})


@app.errorhandler(404)
def page_not_found(e):
    return resp(400, {})


@app.errorhandler(405)
def page_not_found(e):
    return resp(405, {})


@app.route('/api/1.0/movies', methods=['GET'])
def get_movies():
    with db_conn() as db:
        tuples = db.query("SELECT id, title, description, actors FROM movies")
        movies = []
        for (id, title, description, actors) in tuples:
            movies.append({"id": id, "title": title, "description": description, "actors": actors})
        return resp(200, {"movies": movies})


@app.route('/api/1.0/movies', methods=['POST'])
def post_movie():
    (json, errors) = movie_validate()
    if errors:  # list is not empty
        return resp(400, {"errors": errors})

    with db_conn() as db:
        insert = db.prepare(
            "INSERT INTO movies (title, description, actors) VALUES ($1, $2, $3) " +
            "RETURNING id")
        [(movie_id,)] = insert(json['title'], json['description'], json['actors'])
        return resp(200, {"movie_id": movie_id})


@app.route('/api/1.0/movies/<int:movie_id>', methods=['PUT'])
def put_movie(movie_id):
    (json, errors) = movie_validate()
    if errors:  # list is not empty
        return resp(400, {"errors": errors})

    with db_conn() as db:
        update = db.prepare(
            "UPDATE movies SET title = $2, description = $3, actors = $4 WHERE id = $1")
        (_, cnt) = update(movie_id, json['title'], json['description'], json['actors'])
        return resp(affected_num_to_code(cnt), {})


@app.route('/api/1.0/movies/<int:movie_id>', methods=['DELETE'])
def delete_movie(movie_id):
    with db_conn() as db:
        delete = db.prepare("DELETE FROM movies WHERE id = $1")
        (_, cnt) = delete(movie_id)
        return resp(affected_num_to_code(cnt), {})

if __name__ == '__main__':
    app.debug = True  # enables auto reload during development
    app.run(host='0.0.0.0')