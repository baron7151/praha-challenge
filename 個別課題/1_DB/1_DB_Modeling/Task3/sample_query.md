## ユースケースのクエリについて

分析担当者が一人当たりの売上金額を計算する。

```sql
select round(SALES / USER_NUMBER, 0) as TANKA from (
    select count(distinct customer_id) as USER_NUMBER, sum(quantity*price) as SALES from orders as A
    INNER JOIN
    order_details as B
    ON
    A.order_id = B.order_id
    INNER JOIN
    products as C
    ON
    B.product_id = C.product_id) as D;
```
