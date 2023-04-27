CREATE DATABASE IF NOT EXISTS `test`;

USE `test`;

create table IF not exists `product`
(
 id             INT(20) AUTO_INCREMENT,
 product_code   varchar(100),
 product_name   varchar(100),
 product_code_name varchar(200) AS (CONCAT(product_code, '=', product_name)),
 PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into product(product_code,product_name) values("A101","ネジ");
insert into product(product_code,product_name) values("C201","椅子");
insert into product(product_code,product_name) values("F191","ソファー");

