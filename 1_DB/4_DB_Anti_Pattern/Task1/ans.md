参考記事

https://qiita.com/fktnkit/items/57033c10b41b5747dbea

課題１

自己参照モデルのデメリットについて

- 非葉レコードの物理削除が複雑
  - 削除対象レコードに子要素があるため、子要素の親を変更する必要がある。
- 階層が深い要素の取得が難しい。
  - 深くなるにつれて join の回数が増える。
