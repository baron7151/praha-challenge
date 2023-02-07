\c test_db;
create role tenant_user;
grant all on all tables in schema public to "tenant_user";
grant all on all sequences in schema public to "tenant_user";

alter table tenant enable ROW LEVEL SECURITY;
create policy test_policy on tenant USING(tenant_name::text = current_user);