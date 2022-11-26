CREATE DATABASE IF NOT EXISTS `doc`;

USE `doc`;

create table IF not exists `users`
(
 user_id          INT(20) AUTO_INCREMENT,
 user_name        varchar(255),
 PRIMARY KEY (user_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


create table IF not exists `directories`
(
 directory_id  INT(20) AUTO_INCREMENT,
 directory_name varchar(255),
 lft           DOUBLE,
 rgt           DOUBLE,
 PRIMARY KEY (directory_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `documents`
(
 document_id     INT(20) AUTO_INCREMENT,
 doc_text        varchar(255),
 user_id         INT(20),
 directory_id    INT(20),
 created_at      datetime not null default current_timestamp,
 updated_at      datetime not null  default current_timestamp on update current_timestamp,
 PRIMARY KEY (document_id),
 FOREIGN KEY (user_id) REFERENCES users(user_id),
 FOREIGN KEY (directory_id) REFERENCES directories(directory_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


insert into users (user_name) values ('tarou');
insert into users (user_name) values ('jirou');
insert into users (user_name) values ('saburou');

insert into directories(directory_name,lft,rgt) values("ルートフォルダ",0,30);
insert into directories(directory_name,lft,rgt) values("要件定義",1,10);
insert into directories(directory_name,lft,rgt) values("設計",11,20);
insert into directories(directory_name,lft,rgt) values("実装",21,30);
insert into directories(directory_name,lft,rgt) values("基本設計",12,15);
insert into directories(directory_name,lft,rgt) values("詳細設計",16,19);
insert into directories(directory_name,lft,rgt) values("アプリ",22,25);
insert into directories(directory_name,lft,rgt) values("機能1",23,24);

insert into documents(doc_text,user_id,directory_id) values("要件定義書です。",1,1);
insert into documents(doc_text,user_id,directory_id) values("画面設計書です。",2,4);
insert into documents(doc_text,user_id,directory_id) values("DB設計書です。",2,4);
insert into documents(doc_text,user_id,directory_id) values("アプリ詳細設計書です。",2,5);
insert into documents(doc_text,user_id,directory_id) values("機能1ソースコードです。",3,7);
insert into documents(doc_text,user_id,directory_id) values("機能2ソースコードです。",3,7);