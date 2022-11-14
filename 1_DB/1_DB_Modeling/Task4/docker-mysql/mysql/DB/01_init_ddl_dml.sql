CREATE DATABASE IF NOT EXISTS `sushi`;

USE `sushi`;

create table IF not exists `orders`
(
 `order_id`         INT(20) AUTO_INCREMENT,
 `order_date`       Datetime,
 `customer_id`      INT(20),
 PRIMARY KEY (`order_id`)
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

insert into orders (order_date,customer_id) values ('2022-11-10 20:01:00',112233);
insert into orders (order_date,customer_id) values ('2022-11-11 16:01:00',112234);
insert into orders (order_date,customer_id) values ('2022-11-12 10:01:00',112235);

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
