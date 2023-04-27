参考記事

https://shiro-secret-base.com/?p=898#i-2

課題 2

テーブル設計の改良点について

- 閉包テーブルを使って、テーブルを再設計する。

sample query

message_id=4 の子要素のコメントを取得する。

```sql
select * from message as A
inner join tree_path as B
on A.message_id = B.descendant
where B.ancestor =4;
```

message_id=4 を親とする message_id=7 を追加する。

```sql
insert into message(comment) values("高いから食べたくない。");
INSERT INTO tree_path(ancestor, descendant)
  SELECT t.ancestor, 7
  FROM tree_path as t
  WHERE t.descendant = 4;
INSERT INTO tree_path(ancestor, descendant) VALUES (7,7);
```

message_id=4 を削除する。

```sql
DELETE FROM tree_path
WHERE descendant = 4;
DELETE FROM tree_path
WHERE ancestor = 4;
Delete from message
where message_id =4;
```
