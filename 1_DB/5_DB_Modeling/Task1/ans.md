参考記事

https://qiita.com/ak-ymst/items/2e8e92f212c807bb09a1

## ユースケースのクエリについて

Sample query

課題 1

記事の更新を行う。

```sql
insert into article_histories(article_id,article_title,article_text,version) select article_id,article_title,article_text,version from articles where article_id = 1;

UPDATE articles
    SET article_text = repeat('article1_version4_tarou', 30),version=4
    WHERE article_id = 1;
```

過去の記事履歴から戻しを行う。

```sql
UPDATE articles as A
     ,(SELECT article_histories.article_title
             ,article_histories.article_text
             ,article_histories.version
        FROM  article_histories
        WHERE article_histories.article_id =1 and article_histories.version=3
    ) B
SET A.article_title = B.article_title,A.article_text = B.article_text,A.version = B.version
WHERE A.article_id = 1;

delete from article_histories where article_id =1 and version >= 3;
```

過去の記事の履歴を一覧で確認する。

```sql
select article_title,article_text,version from article_histories where article_id = 1;
```
