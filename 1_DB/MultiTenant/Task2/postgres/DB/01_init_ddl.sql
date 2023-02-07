CREATE DATABASE test_db;

\c test_db;

--CREATE SCHEMA test_schema;

--SET search_path = test_schema;

create table tenant
(
 tenant_id    SERIAL NOT NULL,
 tenant_name  varchar(255),
 PRIMARY KEY (tenant_id)
);