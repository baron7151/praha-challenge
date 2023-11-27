### 課題 3

- おそいクエリの例

```sql
SELECT * FROM employees
WHERE employees.emp_no IN (
    SELECT emp_no FROM dept_emp
        WHERE dept_no IN (
            SELECT dept_no FROM departments WHERE dept_name NOT Like '%Development%'
        )
        AND emp_no IN (
            SELECT emp_no FROM salaries WHERE salary > (
                SELECT AVG(salary) * 1.2 FROM salaries
            )
        )
        AND emp_no IN (
            SELECT emp_no FROM titles WHERE (title = "Senior Engineer" AND from_date > '2000-01-01') OR (title = "Engineer" AND from_date > '1990-01-01') OR (title = "Technique Leader" AND from_date > "1995-01-01")
        )
    )  order by emp_no desc;
```

```
+----+-------------+-------------+------------+--------+-----------------+---------+---------+----------------------------+------+----------+---------------------------------------------------------------+
| id | select_type | table       | partitions | type   | possible_keys   | key     | key_len | ref                        | rows | filtered | Extra                                                         |
+----+-------------+-------------+------------+--------+-----------------+---------+---------+----------------------------+------+----------+---------------------------------------------------------------+
|  1 | PRIMARY     | salaries    | NULL       | ALL    | PRIMARY         | NULL    | NULL    | NULL                       |    1 |   100.00 | Using where; Using temporary; Using filesort; Start temporary |
|  1 | PRIMARY     | titles      | NULL       | ref    | PRIMARY         | PRIMARY | 4       | employees.salaries.emp_no  |    1 |   100.00 | Using where; Using index                                      |
|  1 | PRIMARY     | employees   | NULL       | eq_ref | PRIMARY         | PRIMARY | 4       | employees.salaries.emp_no  |    1 |   100.00 | NULL                                                          |
|  1 | PRIMARY     | dept_emp    | NULL       | ref    | PRIMARY,dept_no | PRIMARY | 4       | employees.salaries.emp_no  |    1 |   100.00 | Using index                                                   |
|  1 | PRIMARY     | departments | NULL       | eq_ref | PRIMARY         | PRIMARY | 4       | employees.dept_emp.dept_no |    1 |    88.89 | Using where; End temporary                                    |
|  5 | SUBQUERY    | salaries    | NULL       | ALL    | NULL            | NULL    | NULL    | NULL                       |    1 |   100.00 | NULL                                                          |
+----+-------------+-------------+------------+--------+-----------------+---------+---------+----------------------------+------+----------+---------------------------------------------------------------+
6 rows in set, 1 warning (0.00 sec)
```

-

### 課題 4

- 複合インデックスとは

複数のテーブルのカラムを組み合わせて１つのインデックスとするもの。
複合インデックスの条件で検索すると、それぞれカラムにインデックスを設定した時に比べて、
より早く検索結果を得られることができる。

- 作成した複合インデックスの条件が悪い理由

複合インデックスは、２列目以降の条件で単一で検索した場合は、インデックスが効かないため、フルスキャンされてしまう。
そのため、first_name と last_name の複合インデックス条件を逆にするべきである。
