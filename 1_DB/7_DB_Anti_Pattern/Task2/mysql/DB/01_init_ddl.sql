CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `student_histories`
(
 id           INT(20) AUTO_INCREMENT,
 name         varchar(255),
 status       varchar(255),
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `students`
(
 id           INT(20) AUTO_INCREMENT,
 name         varchar(255),
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create trigger delete_trigger after delete on students for each row insert into student_histories(name, status) values(OLD.name, 'Deleted');


