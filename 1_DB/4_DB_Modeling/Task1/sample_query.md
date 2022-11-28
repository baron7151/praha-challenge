## ユースケースのクエリについて

ユーザのタスク一覧を取得する

```sql
select user_name, remind_text from users as A
inner join
remind_users as B
on A.user_id = B.address_user_id
inner join
reminds as C
on B.remind_id = C.remind_id
where user_name = "tarou" and done = 0;
```

ユーザが設定したタスク一覧を取得する

```sql
select user_name,remind_text from users as A
inner join
remind_users as B
on A.user_id = B.post_user_id
inner join
reminds as C
on B.remind_id = C.remind_id
where user_name = "saburou" and done = 0
group by C.remind_id;
```

タスクを完了に変更する

```sql
UPDATE reminds SET done = 1 WHERE remind_id =3;
```

過去にリマインドした日付から 1 日経過したリマインドを取得する。

```sql
UPDATE reminds set last_exec_time = DATE_ADD(last_exec_time,INTERVAL -2 DAY) where remind_id=2;
Select * from reminds where DATEDIFF(current_date(),last_exec_time) > 1;
```
