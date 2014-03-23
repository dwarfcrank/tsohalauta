CREATE TABLE boards (
    name text UNIQUE,
    description text NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    type integer NOT NULL,
    username text NOT NULL,
    password_hash bytea
);

CREATE TABLE bans (
    id SERIAL PRIMARY KEY,
    board_name text NOT NULL,
    banned_ip inet NOT NULL,
    reason text NOT NULL,
    duration interval NOT NULL
);
