CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `posts`
(
 id          INT(20) AUTO_INCREMENT,
 text            varchar(255),
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `tags`
(
 id          INT(20) AUTO_INCREMENT,
 tag       varchar(255),
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `post_tags`
(
 id               INT(20) AUTO_INCREMENT,
 post_id          INT(20),
 tag_id          INT(20),
 PRIMARY KEY (id),
 FOREIGN KEY (post_id) references posts(id),
 foreign KEY (tag_id) references tags(id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;



insert into posts (text) values ('text1');
insert into posts (text) values ('text2');
insert into tags (tag) values ('tag1');
insert into tags (tag) values ('tag2');
insert into tags (tag) values ('tag3');
insert into tags (tag) values ('tag4');
insert into tags (tag) values ('tag5');
insert into post_tags (post_id,tag_id) values (1,1);
insert into post_tags (post_id,tag_id) values (1,2);
insert into post_tags (post_id,tag_id) values (2,3);
insert into post_tags (post_id,tag_id) values (2,4);
insert into post_tags (post_id,tag_id) values (2,5);
