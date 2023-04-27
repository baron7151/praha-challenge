カンマ区切りのカラム変更のためのスキーマ設計について

- 交差テーブルで、post と tag の多対多のレコードを保持する。

sample query

post `text2`に tag4 が含まれているか確認する。

```sql
select * from posts as A
inner join post_tags as B
on A.id = B.post_id
inner join tags as C
on B.tag_id = C.id
where A.text = "text2" and C.tag = "tag4";
```

post `"text2"の"tag4"を削除する

```sql
DELETE  A
FROM    post_tags AS A
            INNER JOIN tags AS B
                ON A.tag_id = B.id
WHERE   B.tag = 'tag4';

delete from tags where tag = "tag4";
```
