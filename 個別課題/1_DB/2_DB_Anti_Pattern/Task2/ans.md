カンマ区切りのカラム変更のためのスキーマ設計について

- posts テーブルに tags テーブルを従属されるようにして、１対多でレコードを紐づける。

sample query

post `post2`に含まれる tag を列挙する。

```sql
select B.tag from posts as A
inner join tags as B
on A.post_id = B.post_id
where A.text = "post2";
```

`post3`とそれに紐づく tag6 と tag7 を追加する。

```sql
insert into posts (text) values ('post3');
insert into tags (tag,post_id) values ('tag4',3);
insert into tags (tag,post_id) values ('tag5',3);
```
