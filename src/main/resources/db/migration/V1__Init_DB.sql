create sequence usr_sequence start 4 increment 1;

create table usr
(
    id              int8         not null,
    activation_code varchar(255),
    active          boolean      not null,
    email           varchar(255),
    new_email       varchar(255),
    password        varchar(255) not null,
    username        varchar(255) not null,
    name            varchar(255) not null,
    surname         varchar(255) not null,
    avatar          varchar(255) not null,
    profile_address varchar(255) not null unique,
    primary key (id)
);

create table message
(
    id           serial8 not null,
    text         text,
    message_time timestamp,
    to_user      int8    not null,
    from_user    int8    not null,
    primary key (id),
    foreign key (to_user) references usr,
    foreign key (from_user) references usr
);

create table user_role
(
    user_id int8 not null,
    roles   varchar(255),
    foreign key (user_id) references usr
);