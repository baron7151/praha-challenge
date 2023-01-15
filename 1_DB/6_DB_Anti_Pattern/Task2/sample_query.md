参考記事

課題 2

テーブル設計の改良点について

sample query

status「inHospital」を追加

```sql
insert into student_master(status) values("inHospital");
insert into student(name,status) values("shiro","aaaa");
```

status「inHospital」を「coronaSuspended」に変更

```sql
update student_master set status = "coronaSuspended" where status = "inHospital";
```

status 「coronaSuspended」を削除

```sql
delete from student_master where status = "coronaSuspended";
```
