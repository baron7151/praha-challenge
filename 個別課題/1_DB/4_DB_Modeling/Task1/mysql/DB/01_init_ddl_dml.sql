CREATE DATABASE IF NOT EXISTS `remind`;

USE `remind`;

create table IF not exists `users`
(
 user_id          INT(20) AUTO_INCREMENT,
 user_name        varchar(255),
 PRIMARY KEY (user_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `reminds`
(
 remind_id       INT(20) AUTO_INCREMENT,
 remind_text     varchar(255),
 channel_id      varchar(255),
 duration        varchar(255),
 created_at      datetime not null default current_timestamp,
 updated_at      datetime not null  default current_timestamp on update current_timestamp,
 last_exec_time  datetime not null default current_timestamp,
 done            boolean,
 PRIMARY KEY (remind_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `remind_users`
(
 id               INT(20) AUTO_INCREMENT,
 post_user_id     INT(20),
 address_user_id  INT(20),
 remind_id       INT(20),
 PRIMARY KEY (id),
 foreign key (post_user_id) references users(user_id),
 foreign key (address_user_id) references users(user_id),
 foreign key (remind_id) references reminds(remind_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


insert into users (user_name) values ('tarou');
insert into users (user_name) values ('jirou');
insert into users (user_name) values ('saburou');

insert into reminds(remind_text,duration,channel_id,done) values("saburoからtarouへのリマインド1H","1H",123,0);
insert into reminds(remind_text,duration,channel_id,done) values("saburoからjirouへのリマインド1D","1D",123,0);
insert into reminds(remind_text,duration,channel_id,done) values("saburouからtarouとjirouへのリマインド1W","1W",123,0);

insert into remind_users(post_user_id,address_user_id,remind_id) values (3,1,1);
insert into remind_users(post_user_id,address_user_id,remind_id) values (3,2,2);
insert into remind_users(post_user_id,address_user_id,remind_id) values (3,1,3);
insert into remind_users(post_user_id,address_user_id,remind_id) values (3,2,3);