CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `message`
(
 message_id          INT(20) AUTO_INCREMENT,
 comment            varchar(255),
 PRIMARY KEY (message_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `tree_path`
(
 id           INT(20) AUTO_INCREMENT,
 ancestor     INT(20),
 descendant   INT(20),
 PRIMARY KEY (id),
 foreign KEY (ancestor) references message(message_id),
 foreign KEY (descendant) references message(message_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into message (comment) values ("今日何食べた");
insert into message (comment) values ("焼肉");
insert into message (comment) values ("いいね");
insert into message (comment) values ("高級寿司");
insert into message (comment) values ("うらやましい");
insert into message (comment) values ("自分も食べたい");

insert into tree_path(ancestor,descendant) values(1,1);
insert into tree_path(ancestor,descendant) values(1,2);
insert into tree_path(ancestor,descendant) values(1,3);
insert into tree_path(ancestor,descendant) values(1,4);
insert into tree_path(ancestor,descendant) values(1,5);
insert into tree_path(ancestor,descendant) values(1,6);
insert into tree_path(ancestor,descendant) values(2,2);
insert into tree_path(ancestor,descendant) values(2,3);
insert into tree_path(ancestor,descendant) values(3,3);
insert into tree_path(ancestor,descendant) values(4,4);
insert into tree_path(ancestor,descendant) values(4,5);
insert into tree_path(ancestor,descendant) values(4,6);
insert into tree_path(ancestor,descendant) values(5,5);
insert into tree_path(ancestor,descendant) values(6,6);