INSERT INTO boards VALUES('testboard', 'Testing, testing');

INSERT INTO users VALUES(0, 0, 'Anonymous', E'\\x00');

CREATE TABLE testboard_posts (
    id SERIAL PRIMARY KEY,
    parent integer,
    poster_ip inet NOT NULL,
    poster_uid integer REFERENCES users(id),
    posted_at timestamp NOT NULL,
    content text,
    image_url text
);

INSERT INTO testboard_posts VALUES(
    DEFAULT,
    0,
    '127.0.0.1',
    0,
    CURRENT_TIMESTAMP,
    'Hello world!',
    NULL
);

INSERT INTO testboard_posts VALUES(
    DEFAULT,
    1,
    '192.168.13.37',
    0,
    CURRENT_TIMESTAMP,
    '>capitalization in first post',
    NULL
);
