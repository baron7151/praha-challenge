参考記事

https://qiita.com/dai329/items/1db8fbe37f43a465d801

課題 2

テーブル設計の改良点について

- 共通の親テーブルを作成して、外部参照制約できるようにする。

sample query

book_id=1 のコメントを取得する。

```sql
select * from book as A
left outer join manga as B
on A.book_id = B.book_id
left outer join novel as C
on A.book_id = C.book_id
left outer join comment as D
on A.book_id = D.book_id
where D.book_id =1;
```

新しい小説とコメントを追加する。

```sql
insert into book (book_id) values (4);
insert into manga (book_id,name) values (4,"manga2");
insert into comment (book_id,text) values (4,"この漫画は星1です。");

```
