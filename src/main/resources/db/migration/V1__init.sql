create table tasks
(
    id       bigserial primary key,
    title    varchar(255),
    comment  varchar(1000),
    status   varchar(255),
    priority varchar(255)
);


insert into tasks(title, comment, status, priority)
values ('Task1', 'Сделать 1 задачу хорошо', 'Запланирована', 'Средний'),
       ('Task2', 'Сделать 2 задачу отлично', 'Запланирована', 'Высокий'),
       ('Task3', 'Сделать 3 задачу великолепно', 'Запланирована', 'Критичный');

create table users
(
    id       bigserial primary key,
    name     varchar(255),
    password varchar(255)

);

insert into users(name, password)
values ('Bob', 'bob'),
       ('Nick', 'nick');

create table roles
(
    id    bigserial primary key,
    title varchar(255)
);
insert into roles(title)
values ('ROLE_USER'),
       ('ROLE_ADMIN');

create table users_roles
(
    user_id  bigint not null references users (id),
    roles_id bigint not null references roles (id),
    primary key (user_id, roles_id)
);

insert into users_roles(user_id, roles_id)
VALUES (1, 1),
       (2, 2),
       (1, 2);

create table users_tasks
(
    user_id           bigint not null references users (id),
    role_id           bigint not null references roles (id),
    task_create_id    bigint references tasks (id),
    task_completed_id bigint references tasks (id),
    primary key (user_id, role_id, task_create_id, task_completed_id)
);

insert into users_tasks(user_id, role_id, task_create_id, task_completed_id)
VALUES (1, 1, 1, 1),
       (2,2, 2, 2),
       (1,2 , 2, 2);
