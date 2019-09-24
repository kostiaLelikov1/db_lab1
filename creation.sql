CREATE TABLE users
(
    id           serial PRIMARY KEY,
    full_name    varchar(255)             NOT NULL,
    created_at   timestamp with time zone NOT NULL DEFAULT CURRENT_DATE,
    country_code varchar(2)               NOT NULL
);

CREATE TABLE blends
(
    id   serial PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE devices
(
    id               serial PRIMARY KEY,
    default_blend_id int REFERENCES devices (id),
    scheduler        varchar(255)
);

CREATE TABLE device_accesses
(
    user_id   int REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
    device_id int  NULL REFERENCES devices (id) ON UPDATE CASCADE,
    is_owner  bool NOT NULL DEFAULT false
);

CREATE TABLE device_actions
(
    id           serial PRIMARY KEY,
    device_id    int REFERENCES devices (id),
    blend_id     int REFERENCES blends (id),
    performed_at timestamp with time zone NULL
);
