参考記事

課題 2

テーブル設計の改良点について

sample query

商品コード「A101」の product_code と product_name を「=」で連結した結果を取得。
]

```sql
select product_code_name from product where product_code='A101';
```

商品コード「A101」を「A102」に変更

```sql
update product set product_code = "A102" where product_code = "A101";
select * from product where product_code="A102";
```
