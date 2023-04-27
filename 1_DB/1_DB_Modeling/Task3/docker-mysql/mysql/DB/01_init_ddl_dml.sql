CREATE DATABASE IF NOT EXISTS `sushi`;

USE `sushi`;

create table IF not exists tax
(
  tax_id INT(20) AUTO_INCREMENT,
  tax    float,
  tax_div INT(20),
  tax_start_date datetime,
  tax_end_date datetime,
  PRIMARY KEY (`tax_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `customers`
(
 `customer_id`         INT(20) AUTO_INCREMENT,
 `name`                varchar(255),
 `tel`                 varchar(255),
 PRIMARY KEY (`customer_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `orders`
(
 `order_id`         INT(20) AUTO_INCREMENT,
 `order_date`       Datetime,
 `customer_id`      INT(20),
 `tax_div`          INT(20),
 `is_to_go`         boolean,
 PRIMARY KEY (`order_id`),
 FOREIGN KEY(`customer_id`) REFERENCES customers(`customer_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `products`
(
 `product_id`         INT(20) AUTO_INCREMENT,
 `product_name`       varchar(255),
 `price`              INT(20),
 `category`           varchar(255),
 PRIMARY KEY (`product_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

create table IF not exists `order_details`
(
 `order_detail_id`  INT(20) AUTO_INCREMENT,
 `order_id`         INT(20),
 `product_id`       INT(20),
 `quantity`         INT(5),
 `is_wasabi`        boolean,
 `syari_size`       INT(1),
  PRIMARY KEY (`order_detail_id`),
  FOREIGN KEY(`order_id`) REFERENCES orders(`order_id`),
  FOREIGN KEY(`product_id`) REFERENCES products(`product_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

insert into tax(tax_div,tax,tax_start_date,tax_end_date) values(1,0.03,'1989-04-01 00:00:00','1997-03-31 23:59:59');
insert into tax(tax_div,tax,tax_start_date,tax_end_date) values(1,0.05,'1997-04-01 00:00:00','2014-03-31 23:59:59');
insert into tax(tax_div,tax,tax_start_date,tax_end_date) values(1,0.08,'2014-04-01 00:00:00','2019-09-30 23:59:59');
insert into tax(tax_div,tax,tax_start_date,tax_end_date) values(1,0.1,'2019-10-01 00:00:00','2099-12-31 23:59:59');
insert into tax(tax_div,tax,tax_start_date,tax_end_date) values(2,0,'1989-04-01 00:00:00','2019-09-30 23:59:59');
insert into tax(tax_div,tax,tax_start_date,tax_end_date) values(2,0.08,'2019-10-01 00:00:00','2099-12-31 23:59:59');

insert into customers (name,tel) values ('野村太郎','+81 090-0000-0000');
insert into customers (name,tel) values ('野村次郎','+81 090-0000-0001');
insert into customers (name,tel) values ('野村三郎','+81 090-0000-0002');

insert into orders (order_date,customer_id,tax_div,is_to_go) values ('2022-11-10 20:01:00',1,1,0);
insert into orders (order_date,customer_id,tax_div,is_to_go) values ('2022-11-11 16:01:00',2,2,1);
insert into orders (order_date,customer_id,tax_div,is_to_go) values ('2019-08-12 10:01:00',3,1,0);

insert into products (price,product_name,category) values (180,'えび','お好みすし');
insert into products (price,product_name,category) values (360,'いくら','お好みすし');
insert into products (price,product_name,category) values (400,'ずわいがに','お好みすし');
insert into products (price,product_name,category) values (260,'あじ','お好みすし');

insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (1,1,2,0,0);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (1,2,1,1,1);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (2,2,3,1,1);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (1,3,1,0,0);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (3,1,1,0,0);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (3,2,2,0,0);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (3,3,1,0,1);
insert into order_details (order_id,product_id,quantity,is_wasabi,syari_size) values (3,4,3,0,1);
