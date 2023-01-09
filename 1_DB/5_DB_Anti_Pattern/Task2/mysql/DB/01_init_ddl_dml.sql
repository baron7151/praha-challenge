CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `New_customer`
(
 customer_id    INT(20) AUTO_INCREMENT,
 name           varchar(255),
 corp           varchar(255),
 Tel            varchar(50),
 PRIMARY KEY (customer_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `Sales`
(
 sales_id           INT(20) AUTO_INCREMENT,
 name         varchar(255),
 PRIMARY KEY (sales_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `Called_memo`
(
 id           INT(20) AUTO_INCREMENT,
 called_id    INT(20),
 memo         varchar(255),
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create index called_id_index on Called_memo(called_id);

create table IF not exists `Meeting`
(
 id           INT(20) AUTO_INCREMENT,
 meeting_id   INT(20),
 met_at       datetime,
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create index meeting_id_index on Meeting(meeting_id);

create table IF not exists `Closed_history`
(
 id           INT(20) AUTO_INCREMENT,
 closed_history_id    INT(20),
 closed_at    datetime,
 canceld      boolean,
 canceled_at  datetime,
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create index closed_history_id_index on Closed_history(closed_history_id);

create table IF not exists `Business_met`
(
 id           INT(20) AUTO_INCREMENT,
 customer_id  INT(20),
 sales_id     INT(20),
 called       boolean,
 called_id    INT(20),
 metOnce      boolean,
 meeting_id   INT(20),
 closed       boolean,
 closed_history_id INT(20),
 PRIMARY KEY (id),
 foreign KEY (customer_id) references New_customer(customer_id),
 foreign KEY (sales_id) references Sales(sales_id),
 foreign KEY (called_id) references Called_memo(called_id),
 foreign KEY (meeting_id) references Meeting(meeting_id),
 foreign KEY (closed_history_id) references Closed_history(closed_history_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into New_customer (name,corp,tel) values ("taro","taro shouji","09011111111");
insert into New_customer (name,corp,tel) values ("jiro","jiro heavy industry","09011112222");
insert into New_customer (name,corp,tel) values ("saburo","saburo bank","09011113333");

insert into Sales (name) values ("shiro");
insert into Sales (name) values ("goro");
insert into Sales (name) values ("rokuro");

insert into Called_memo (called_id,memo) values (1,"shiroからtaroへの１回目の電話");
insert into Called_memo (called_id,memo) values (1,"shiroからtaroへの２回目の電話");
insert into Called_memo (called_id,memo) values (2,"goroからjiroへの１回目の電話");
insert into Called_memo (called_id,memo) values (3,"rokuroからtaroへの１回目の電話");

insert into Meeting (meeting_id,met_at) values (1,"2022-01-05 16:00:00");
insert into Meeting (meeting_id,met_at) values (1,"2022-01-10 16:00:00");
insert into Meeting (meeting_id,met_at) values (2,"2022-01-20 14:00:00");
insert into Meeting (meeting_id,met_at) values (3,null);

insert into Closed_history(closed_history_id,closed_at,canceld,canceled_at) values(1,"2022-01-07 16:00:00",1,"2022-01-08 16:00:00");
insert into Closed_history(closed_history_id,closed_at,canceld,canceled_at) values(1,"2022-01-11 16:00:00",0,null);
insert into Closed_history(closed_history_id,closed_at,canceld,canceled_at) values(2,"2022-01-21 16:00:00",0,null);
insert into Closed_history(closed_history_id,closed_at,canceld,canceled_at) values(3,null,0,null);

insert into Business_met(customer_id,sales_id,called,called_id,metOnce,meeting_id,closed,closed_history_id) values(1,1,True,1,True,1,True,1);
insert into Business_met(customer_id,sales_id,called,called_id,metOnce,meeting_id,closed,closed_history_id) values(2,2,True,2,True,2,True,2);
insert into Business_met(customer_id,sales_id,called,called_id,metOnce,meeting_id,closed,closed_history_id) values(1,3,True,3,False,3,False,3);