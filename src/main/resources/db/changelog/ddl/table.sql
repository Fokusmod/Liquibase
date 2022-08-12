--liquibase formatted sql

--changeset fokusmod:create_tables
create table categories
(
    id    serial primary key,
    title text not null
);


create table products
(
    id          serial primary key,
    title       text    not null,
    price       integer not null,
    category_id integer references categories (id)
);


create table roles
(
    id    serial primary key,
    title text not null
);

create table users
(
    id           serial primary key,
    name         text not null,
    surname      text,
    email        text,
    phone_number text,
    role_id      integer references roles (id)
);


create table carts
(
    user_id    integer references users (id) primary key,
    product_id integer references products (id)
);


create table orders
(
    user_id    integer references users (id) primary key,
    product_id integer references products (id)
);

create table delivers
(
    id   serial primary key,
    type text not null
);

create table status
(
    id    serial primary key,
    title text not null
);

create table delivery
(
    id         serial primary key,
    deliver_id integer references delivers (id),
    order_id   integer references orders (user_id),
    status_id  integer references status (id)
);
