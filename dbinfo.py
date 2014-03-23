from flask import render_template
import os
import psycopg2
import urlparse

urlparse.uses_netloc.append("postgres")
url = urlparse.urlparse(os.environ["DATABASE_URL"])

def connect():
    conn = psycopg2.connect(
        database=url.path[1:],
        user=url.username,
        password=url.password,
        host=url.hostname,
        port=url.port
    )

    return conn

def run(boardname):
    # TODO: this should never be done
    board = boardname + "_posts"
    posts = []

    with connect() as connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM " + board + ";")
            for record in cursor:
                posts.append(record)

    return render_template(
            'dump.html',
            page_title=board + " contents",
            board_name=boardname,
            posts=posts)

