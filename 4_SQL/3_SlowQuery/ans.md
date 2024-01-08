## 課題 1

```
SET GLOBAL slow_query_log = 'ON'; # slow query ON
SET GLOBAL long_query_time = 0.1;
SHOW GLOBAL variables LIKE 'slow_query_log';
```

・0.1 秒より長いクエリ

```
# Time: 2023-11-27T16:08:32.078911Z
# User@Host: root[root] @ localhost []  Id:     7
# Query_time: 0.208465  Lock_time: 0.000605 Rows_sent: 1  Rows_examined: 331603
use employees;
SET timestamp=1701101312;
select count(*) from dept_emp;

# Time: 2023-11-27T16:14:17.172259Z
# User@Host: root[root] @ localhost []  Id:     7
# Query_time: 0.637312  Lock_time: 0.000739 Rows_sent: 1  Rows_examined: 2844047
SET timestamp=1701101657;
select AVG(salary) from salaries;

# Time: 2023-11-27T16:17:01.763108Z
# User@Host: root[root] @ localhost []  Id:     7
# Query_time: 0.568507  Lock_time: 0.000883 Rows_sent: 1  Rows_examined: 933211
SET timestamp=1701101821;
select count(*) from dept_emp inner join titles  Using(emp_no);
```

・0.1 秒より短いクエリ

```
mysql> select count(*) from titles;
+----------+
| count(*) |
+----------+
|   443308 |
+----------+
1 row in set (0.08 sec)

mysql> select count(*) from departments;
+----------+
| count(*) |
+----------+
|        9 |
+----------+
1 row in set (0.00 sec)

mysql> select * from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
9 rows in set (0.01 sec)
```

## 課題 2

mysqldumpslow コマンドで以下のクエリを特定する方法

- 最も頻度高くスロークエリに現れるクエリ
  - mysqldumpslow -s c /path/to/slow-query.log
- 実行時間が最も長いクエリ
  - mysqldumpslow -s t /path/to/slow-query.log
- ロック時間が最も長いクエリ
  - mysqldumpslow -s l /path/to/slow-query.log

## 課題 4

- limit 1

  - limit 句までに得られたデータセットに対して最後の 1 行だけに絞り込むように指定しているだけのため、データセットを得るクエリがテーブル結合やサブクエリなど使っていて複雑だった場合、limit 1 だとしても遅くなる。

- JOIN Where JOIN ON の違い

JOIN 条件を ON 句で指定すると、SQL エンジンはその条件自体で最適な実行計画を見つけ出す。
JOIN 条件を Where 句を指定すると、SQL エンジンはテーブルの統計情報をもとに最適な実行計画を選択する。統計情報が古いと実行に影響を及ぼすことがある。

## 課題 5

- オフセットページネーションとカーソルページネーション
  - オフセットページネーションは offset 句のクエリを使って実現するページネーション
  - 必要なページにたどり着くまでに、最初からそこまでの全ての行を数える必要があるため、後のページになればなるほど応答が遅くなる。（offset 分スキャンが必要なるため。）
- カーソルページネーション
  - offset 句の代わりに比較オペレータと where 句を使って実現するページネーション
  - 後のページでも応答が遅くなることはない。（where 条件に対してインデックスを貼っている場合に限る）
  - where 句で使うカラムの値は必ずユニークでなければならない
  - どのページにどのデータが来るのか予想できないため、前や次ページはできない。
  - 無限スクロールに適したページング

## 課題 6

本番環境で運用している DB でスロークエリを監視・分析したい場合は、どのようなツールを利用すれば良いでしょうか。
