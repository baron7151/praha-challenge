CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `users`
(
 user_id          INT(20) AUTO_INCREMENT,
 user_name        varchar(255),
 email            varchar(255),
 PRIMARY KEY (user_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;



insert into users (user_name,email) values ('tarou','test1@example.com');
insert into users (user_name,email) values ('jirou','test2@example.com');
insert into users (user_name,email) values ('saburou','test3@example.com');