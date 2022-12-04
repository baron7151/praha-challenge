- 追加仕様について

「はな」や「わだつみ」などのセットメニューのネタを含めて、毎月寿司ネタが何個売れているのか入れているのか知りたい。

- トリオの追加仕様について
  消費税の変更

> 消費税のマスターテーブルを用意し、期間ごとに消費税を適用する。また、orders テーブルに持ち帰りフラグを追加して、軽減税率を適用できるようにする。

・通常の消費税（10%）で計算する。

```sql
select B.order_id, B.order_date,sum((C.quantity * D.price) * (1+round((select avg(tax) from tax as A where A.tax_start_date < B.order_date and A.tax_end_date > B.order_date And A.tax_div = B.tax_div),2))) as total_price
from orders as B
inner join order_details as C
on B.order_id = C.order_id
inner join products as D
on C.product_id = D.product_id
where B.order_id = 1
group by order_id;
```

・軽減税率（8%）で計算する。

```sql
select B.is_to_go,B.order_id, B.order_date,sum((C.quantity * D.price) * (1+round((select avg(tax) from tax as A where A.tax_start_date < B.order_date and A.tax_end_date > B.order_date And A.tax_div = B.tax_div),2))) as total_price
from orders as B
inner join order_details as C
on B.order_id = C.order_id
inner join products as D
on C.product_id = D.product_id
where B.order_id = 2
group by order_id;

```

```sql
select B.is_to_go,B.order_id, B.order_date,C.quantity,D.price,
(select tax from tax as A where A.tax_start_date < B.order_date and A.tax_end_date > B.order_date And A.tax_div = B.tax_div) as tax
from orders as B
inner join order_details as C
on B.order_id = C.order_id
inner join products as D
on C.product_id = D.product_id
where B.order_id = 2;
```
