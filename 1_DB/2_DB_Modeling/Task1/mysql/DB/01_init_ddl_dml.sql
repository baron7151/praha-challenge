CREATE DATABASE IF NOT EXISTS `chat`;

USE `chat`;

create table IF not exists `users`
(
 `user_id`             INT(20) AUTO_INCREMENT,
 `user_name`           varchar(255),
 PRIMARY KEY (`user_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `workspaces`
(
 `workspace_id`         INT(20) AUTO_INCREMENT,
 `workspace_name`       varchar(255),
 PRIMARY KEY (`workspace_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `channels`
(
 `channel_id`         INT(20) AUTO_INCREMENT,
 `channel_name`       varchar(255),
 `workspace_id`       INT(20),
 PRIMARY KEY (`channel_id`),
 FOREIGN KEY (`workspace_id`) REFERENCES workspaces(`workspace_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `threads`
(
 `thread_id`         INT(20) AUTO_INCREMENT,
 `channel_id`        INT(20),
 PRIMARY KEY (`thread_id`),
 FOREIGN KEY (`channel_id`) REFERENCES channels(`channel_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `messages`
(
 `message_id`       INT(20) AUTO_INCREMENT,
 `message`          varchar(255),
 `channel_id`       INT(20),
 `thread_id`        INT(20),
 `workspace_id`     INT(20),
 `user_id`          INT(20),
 `created_at`       datetime not null default current_timestamp,
 `updated_at`       datetime not null  default current_timestamp on update current_timestamp,
  PRIMARY KEY (`message_id`),
  FOREIGN KEY(`channel_id`) REFERENCES channels(`channel_id`),
  FOREIGN KEY(`thread_id`) REFERENCES threads(`thread_id`),
  FOREIGN KEY(`workspace_id`) REFERENCES workspaces(`workspace_id`),
  FOREIGN KEY(`user_id`) REFERENCES users(`user_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `channel_user`
(
  `id`         INT(20) AUTO_INCREMENT,
  `user_id`    INT(20),
  `channel_id` INT(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`user_id`),
  FOREIGN KEY (`channel_id`) REFERENCES channels(`channel_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `workspace_user`
(
  `id`         INT(20) AUTO_INCREMENT,
  `user_id`    INT(20),
  `workspace_id` INT(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`user_id`),
  FOREIGN KEY (`workspace_id`) REFERENCES workspaces(`workspace_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


insert into users (user_name) values ('tarou');
insert into users (user_name) values ('jirou');
insert into users (user_name) values ('saburou');

insert into workspaces (workspace_name) values ('workspace1');
insert into workspaces (workspace_name) values ('workspcace2');

insert into channels (channel_name,workspace_id) values ('channel1',1);
insert into channels (channel_name,workspace_id) values ('channel2',1);
insert into channels (channel_name,workspace_id) values ('channel3',2);


insert into channel_user (user_id,channel_id) values (1,1);
insert into channel_user (user_id,channel_id) values (1,2);
insert into channel_user (user_id,channel_id) values (2,1);

insert into workspace_user (user_id,workspace_id) values (1,1);
insert into workspace_user (user_id,workspace_id) values (1,2);
insert into workspace_user (user_id,workspace_id) values (2,1);

insert into threads(channel_id) values (1);
insert into threads(channel_id) values (3);


insert into messages (message,channel_id,workspace_id,user_id) values ("tarou test1",1,1,1);
insert into messages (message,channel_id,workspace_id,user_id) values ("tarou test2",1,1,1);
insert into messages (message,channel_id,workspace_id,user_id,thread_id) values ("tarou test3",1,1,1,1);
insert into messages (message,channel_id,workspace_id,user_id,thread_id) values ("tarou test4",1,1,1,1);
insert into messages (message,channel_id,workspace_id,user_id) values ("tarou test5",2,1,1);
insert into messages (message,channel_id,workspace_id,user_id) values ("tarou test6",2,1,1);
insert into messages (message,channel_id,workspace_id,user_id) values ("jirou test1",3,2,2);
insert into messages (message,channel_id,workspace_id,user_id) values ("jirou test2",3,2,2);
insert into messages (message,channel_id,workspace_id,user_id,thread_id) values ("jirou test3",3,2,2,2);
insert into messages (message,channel_id,workspace_id,user_id,thread_id) values ("jirou test4",3,2,2,2);

