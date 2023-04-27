CREATE DATABASE IF NOT EXISTS `article`;

USE `article`;

create table IF not exists `users`
(
 user_id          INT(20) AUTO_INCREMENT,
 user_name        varchar(255),
 PRIMARY KEY (user_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `articles`
(
 article_id       INT(20) AUTO_INCREMENT,
 article_title    varchar(255),
 article_text     MEDIUMTEXT,
 created_at      datetime not null default current_timestamp,
 updated_at      datetime not null  default current_timestamp on update current_timestamp,
 user_id         INT(20),
 version         INT(5),
 PRIMARY KEY (article_id),
 foreign KEY (user_id) references users(user_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `article_histories`
(
 id               INT(20) AUTO_INCREMENT,
 article_id       INT(20),
 article_title    varchar(255),
 article_text     MEDIUMTEXT,
 created_at       datetime not null default current_timestamp,
 version          INT(5),
 PRIMARY KEY (id),
 foreign KEY (article_id) references articles(article_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


insert into users (user_name) values ('tarou');
insert into users (user_name) values ('jirou');
insert into users (user_name) values ('saburou');

insert into articles(article_title,article_text,version,user_id) values('title1',repeat('article1_version3_tarou', 30),3,1);
insert into articles(article_title,article_text,version,user_id) values('title2',repeat('article2_version1_jirou', 30),1,1);

insert into article_histories(article_id,article_title,article_text,version) values(1,'title1',repeat('article1_version1_tarou', 30),1);
insert into article_histories(article_id,article_title,article_text,version) values(1,'title1',repeat('article1_version2_tarou', 30),2);