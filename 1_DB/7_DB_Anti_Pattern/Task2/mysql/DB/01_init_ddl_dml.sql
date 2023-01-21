CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `student_master`
(
 status         varchar(255),
 PRIMARY KEY (status)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `student`
(
 id           INT(20) AUTO_INCREMENT,
 name         varchar(255),
 status       varchar(255),
 PRIMARY KEY (id),
CONSTRAINT `fk_status` FOREIGN KEY  (status)  references student_master(status) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into student_master(status) values("studying");
insert into student_master(status) values("graduated");
insert into student_master(status) values("suspended");

insert into student(name,status) values("ichiro","studying");
insert into student(name,status) values("jiro","graduated");
insert into student(name,status) values("saburo","suspended");
