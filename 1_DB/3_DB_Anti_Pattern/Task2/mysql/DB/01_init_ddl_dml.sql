CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `book`
(
 book_id          INT(20) AUTO_INCREMENT,
 PRIMARY KEY (book_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `manga`
(
 id          INT(20) AUTO_INCREMENT,
 book_id     INT(20),
 name        varchar(255),
 PRIMARY KEY (id),
 foreign KEY (book_id) references book(book_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `novel`
(
 id          INT(20) AUTO_INCREMENT,
 book_id     INT(20),
 name        varchar(255),
 PRIMARY KEY (id),
 foreign KEY (book_id) references book(book_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `comment`
(
 id          INT(20) AUTO_INCREMENT,
 book_id     INT(20),
 text        varchar(255),
 PRIMARY KEY (id),
 foreign KEY (book_id) references book(book_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into book (book_id) values (1);
insert into book (book_id) values (2);
insert into book (book_id) values (3);

insert into manga (book_id,name) values (1,"manga1");

insert into novel (book_id,name) values (2,"novel1");
insert into novel (book_id,name) values (3,"novel2");


insert into comment (book_id,text) values (1,"この漫画は星3です。");
insert into comment (book_id,text) values (1,"この漫画は星4です。");
insert into comment (book_id,text) values (2,"この小説は星4です。");
insert into comment (book_id,text) values (3,"この小説は星1です。");