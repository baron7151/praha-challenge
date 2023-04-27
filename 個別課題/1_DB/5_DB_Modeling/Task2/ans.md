参考記事

https://qiita.com/ak-ymst/items/2e8e92f212c807bb09a1

## ユースケースのクエリについて

分析の履歴データの取り扱いについて

- 自分の意見
  - 分析用途の場合は、必ずしも DB に保存する必要はないため、リアルタイムでファイルに出力するか、DB に保存してバッチ等で出力した後、削除するなどの運用が考えられる。
- トリオの意見

履歴テーブルの別の表現について

テーブルを１つにする。

最新の記事一覧を取得する。

```sql
SELECT
  *
FROM
  articles A
WHERE
  (article_id, version) =
    (SELECT
       article_id
       , max(version)
     FROM
       articles B
     WHERE
       A.article_id = B.article_id
    GROUP BY
       article_id);
```
