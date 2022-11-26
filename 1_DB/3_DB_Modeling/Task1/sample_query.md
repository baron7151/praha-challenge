## 課題１のユースケースのクエリについて

「設計フォルダ」配下のフォルダを表示する。

```sql
SELECT children.*
FROM directories AS parents LEFT OUTER JOIN directories children
  ON children.lft > parents.lft AND children.lft < parents.rgt
WHERE
   parents.directory_id=3;
```

「詳細設計フォルダにフォルダ名「定例資料」を追加して、ドキュメント「定例資料 1」を追加する。」

なお、追加するフォルダの座標は以下の式で算出する。

```
追加ノードの左端座標=(plft*2+prgt)/3 ― ⓐ
追加ノードの右端座標=(plft+prgt*2)/3 ― ⓑ
```

```sql
insert into directories(directory_name,lft,rgt)
SELECT "定例資料",(lft*2+rgt)/3,(lft+rgt*2)/3 FROM directories WHERE directory_id=6;
```

```sql
SELECT * from directories where directory_name="定例資料";
```

```sql
insert into documents(doc_text,user_id,directory_id) values("定例資料1です",2,10);
```
