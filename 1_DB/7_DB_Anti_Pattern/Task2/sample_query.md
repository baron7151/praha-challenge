参考記事
https://www.slideshare.net/t_wada/ronsakucasual

課題 2

テーブル設計の改良点について

- 履歴テーブルを作成して、対象テーブルからレコードが削除された場合、自動的に履歴テーブルにデータを保存するようにする。

```sql
delete from students where id =2;
```
