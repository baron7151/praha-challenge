- 常連顧客を特定する SQL

```SQL
SELECT C.CustomerID,count(C.CustomerID) AS 'OrderCount' FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE OrderDate BETWEEN "1996-01-01" AND "1996-12-31"
GROUP BY C.CustomerID HAVING OrderCount >= 3 ORDER BY OrderCount DESC;
```

- 最も注文した顧客
  65,63,20

- 過去最大の OrderDetail

```SQL
SELECT O.OrderID,COUNT(OD.OrderDetailID) AS 'OrderDetailCount' FROM Orders AS O
INNER JOIN OrderDetails AS OD
ON O.OrderID = OD.OrderID
GROUP BY O.OrderID ORDER BY OrderDetailCount DESC;
```

- 紐づいた数
  5

- お世話になった運送会社

```SQL
SELECT O.ShipperID,S.ShipperName,COUNT(O.ShipperID) AS 'ShipperCount'  FROM Orders AS O
INNER JOIN Shippers AS S
ON O.ShipperID = S.ShipperID
GROUP BY O.ShipperID ORDER BY ShipperCount DESC;
```

- 一番お世話になった運送会社
  United Package

- 重要な市場

```SQL
select C.Country, ROUND(SUM(P.Price * OD.Quantity)) AS 'Sales' from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join OrderDetails as OD
on O.OrderID = OD.OrderID
inner join Products as P
on OD.ProductID = P.ProductID
group by Country order by Sales desc;
```

- 国ごと年ごとの売上

```SQL
select C.Country,strftime('%Y',OrderDate) as 'OrderYear', ROUND(SUM(P.Price * OD.Quantity)) AS 'Sales' from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join OrderDetails as OD
on O.OrderID = OD.OrderID
inner join Products as P
on OD.ProductID = P.ProductID
group by C.Country,OrderYear order by Sales desc;
```

- 福利厚生
