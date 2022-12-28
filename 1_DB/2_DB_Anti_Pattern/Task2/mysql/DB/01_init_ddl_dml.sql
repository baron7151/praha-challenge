CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `posts`
(
 post_id          INT(20) AUTO_INCREMENT,
 text            varchar(255),
 PRIMARY KEY (post_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `tags`
(
 tag_id          INT(20) AUTO_INCREMENT,
 tag       varchar(255),
 post_id   INT(20),
 PRIMARY KEY (tag_id),
 FOREIGN KEY (post_id) references posts(post_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into posts (text) values ('post1');
insert into posts (text) values ('post2');
insert into tags (tag,post_id) values ('tag1',1);
insert into tags (tag,post_id) values ('tag2',2);
insert into tags (tag,post_id) values ('tag3',2);
insert into tags (tag,post_id) values ('tag4',2);
insert into tags (tag,post_id) values ('tag5',2);
