## 修正方針について

documents テーブルに並び順を管理するカラムを追加して、ドキュメントの並び順を管理できるようにする。

## ユースケースのクエリについて

「機能 1」フォルダのドキュメントを並び順で取得する。

```sql
select * from documents
where directory_id =7
order by  document_order asc;
```

「機能１」フォルダにドキュメントを追加して、一番上に配置する。

```sql
update documents set document_order = document_order + 1 where directory_id = 7;
insert into documents(doc_text,user_id,directory_id,document_order) values("ソースコードまとめ",3,7,1);

```

### trello の並び替え時の実装確認

並び替え時のパラメータを確認すると、pos というパラメータで並び順を制御している模様。並び替え先の上と下カードの間になるように pos を決定しており、不動小数点になることを確認。
