課題１

- デッドロックを説明してください

  - 並行に実行されているスレッド A が資源 a を、スレッド B が資源 b をそれぞれ占有して処理を開始し、処理の途中で A が b を、B が a を必要とした場合、A は B が b を解放するまで待とうとするが、同時に B は A が a を解放するのを待とうとする。互いに相手の終了待ちとなってしまい、いつまでも処理が進まなくなってしまう。このような状態をデッドロックという。

- 実際に世の中でデッドロックが発生した事例を 1 つ調べて、その原因と解決方法を紹介してください

事例：https://japan.zdnet.com/article/35080846/

上記事例では、以下２つの処理 A,B が並列された実行された状態であり、処理 A1 と処理 B2 が終わった後、
それぞれのリソースが占有された状態で後続の処理が実行されたため、デッドロックが発生しまった。

処理 A：①（キャッシュを利用）→④（ディスクを利用）
処理 B：②（ディスクを利用）→③（キャッシュを利用）

解決方法
リソースを占有する時間は最小限とし、必要なくなればロックを解除するようにする。
上記の場合は、処理 A1 と処理 B2 が終わった段階で、リソースのロック解除するようにする。

- それぞれの ISOLATION LEVEL について説明してみてください。それぞれの差分、それによってどんな問題が生じる可能性があるでしょうか？

ISOLATION LEVEL とは？
ISOLATION LEVEL は、複数のトランザクションで変更が行われ、クエリーが同時に実行される場合に、パフォーマンスと信頼性、一貫性および結果の再現性のバランスを微調整する設定です。
SQL:1992 では 4 つのトランザクション分離レベルが記載されている。

- READ UNCOMMITTED
  - 最も独立性が低い分離レベルで、トランザクション実行中に他のトランザクションが引き起こすあらゆる更新・変更の影響を受ける。ファントムリード、ノンリピータブルリードに加え、処理途上や不完全な状態のデータを読み込んでしまう「ダーティリード」現象が生じる可能性がある。処理を妨げるロックなどは最小限に抑えられるため最も高速に動作する。
- READ COMMITTED
  - 3 番目に独立性が高い分離レベルで、トランザクション実行中に他のトランザクションがコミットした変更の影響を受ける。ファントムリードに加え、何度も同じデータを読み込むと他のトランザクションによる更新で値が変わってしまう「ノンリピータブルリード」現象が生じることがある。多くの著名 RDBMS のデフォルトの分離レベルである。
- REPEATABLE READ
  - 2 番目に独立性が高い分離レベルで、他のトランザクションによるデータ更新の影響を受けず、トランザクション実行中は何度繰り返し対象データを読み取っても同じ値が返ってくる。しかし、他のトランザクションによるレコードの追加・削除の影響は受けるため、「ファントムリード」と呼ばれる現象が生じることがある。
- SERIALIZABLE

  - 最も独立性（安全性）が高い分離レベルで、トランザクションを順番に実行（直列化）したのと同じように、他のトランザクションのデータ更新の影響をまったく受けない。アクセスが競合すると「先客」のトランザクションの終了を待たなければならないため性能は最も低い。

- 行レベルのロック、テーブルレベルのロックの違いを説明してください

  - 行ロック：対象レコードをロックする
  - テーブルロック：１テーブルをロックする。

- 悲観ロックと楽観ロック（あるいは悲観的排他制御と楽観的排他制御）の違いを説明してください

  - 楽観ロックは、ロック対象のレコードの同時更新がほとんどない前提で行う排他制御。データに対してロックは行わずに、更新対象のデータがデータ取得時と同じ状態であることを確認してから更新することで、
    データの整合性を保証する方式。
  - 悲観ロックは、他者が同じデータに頻繁に変更を加えるであろう、という悲観的な前提の排他制御。更新対象のデータを取得する際にロックをかけることで、他のトランザクションから更新されないようにする方式。

- 共有ロックと排他ロックの違いを説明してください

  - 共有ロック：読み取り可、更新不可のロック状態
  - 排他ロック：読み取り、更新ともに不可のロック状態

- select....for update は共有ロックでしょうか排他ロックでしょうか？

  - 排他ロックになる。LOCK IN SHARE MODE を利用すると共有ロックになる。

- fuzzy(non-repeatable)-read と phantom-read は何が違うのでしょうか？
  - non-repeatable：他トランザクション(T2)がコミットにより対象レコードを更新した場合、1 トランザクション(T1)中で Read するレコードデータが異なってしまう現象を指します。
  - phantom-read：他トランザクション(T2)がコミットにより新規レコード追加(または削除)をした場合、1 トランザクション(T1)中で Read するテーブルデータが異なってしまう現象を指します。

課題 2

Mysql のトランザクション分離レベルを変更する。

```sql
SELECT @@GLOBAL.tx_isolation, @@tx_isolation; --mysql デフォルトレベルは「REPEATABLE-READ」
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
```

dirty read > COMMIT されていないトランザクションでの変更を他トランザクションが Read することができてしまう現象のことを指します。

| STEP | T1                                                        | T2                                                                    | 説明                                              |
| ---- | --------------------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------- |
| 1    | select dept_name from departments where dept_no = "d001"; |                                                                       | T1 は"Marketing"                                  |
| 2    |                                                           | UPDATE departments SET dept_name = 'Hogehoge' where dept_no = "d001"; | T2 で"Hogehoge"に更新                             |
| 3    | select dept_name from departments where dept_no = "d001"; |                                                                       | T1 は"Hogehoge"で Read される(ダーティリード現象) |
| 4    |                                                           | rollback;                                                             |                                                   |

Non-repeatable read > 他トランザクション(T2)がコミットにより対象レコードを更新した場合、1 トランザクション(T1)中で Read するレコードデータが異なってしまう現象を指します。

| STEP | T1                                                        | T2                                                                    | 説明                                                |
| ---- | --------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------- |
| 1    | select dept_name from departments where dept_no = "d001"; |                                                                       | T1 は"Marketing"                                    |
| 2    |                                                           | UPDATE departments SET dept_name = 'Hogehoge' where dept_no = "d001"; | T2 で"Hogehoge"に更新                               |
| 3    |                                                           | commit;                                                               |                                                     |
| 4    | select dept_name from departments where dept_no = "d001"; |                                                                       | T1 は"Hogehoge"で Read される(Non-repeatable reads) |

Phantom read > 他トランザクション(T2)がコミットにより新規レコード追加(または削除)をした場合、1 トランザクション(T1)中で Read するテーブルデータが異なってしまう現象を指します。

| STEP | T1                                 | T2                                                                      | 説明                            |
| ---- | ---------------------------------- | ----------------------------------------------------------------------- | ------------------------------- |
| 1    | select count(\*) from departments; |                                                                         | T1 は 9 件ヒット                |
| 2    |                                    | INSERT INTO departments(dept_no,dept_name) VALUES ('d010', 'fugafuga'); | T2 でレコードを追加             |
| 3    |                                    | commit;                                                                 |                                 |
| 4    | select count(\*) from departments; |                                                                         | T1 は 10 件ヒット(Phantom read) |

映画チケットのトランザクション処理について

```
seat = getEmptyMovieSeat(movieId) // DB からチケット情報を取得

if seat.isPurchased
-> throw('その席は既に購入されていますよ!')

// (まだ席が購入されていない場合の処理に進む)
seat.isPurchased = true

save seat //チケットのバージョンを確認する。

make payment // 外部 API を用いて決裁を行う
```

// 1 行目からここに至るまでに他のトランザクションで席が買われるかも!
// どうすればそれを楽観ロックで防げるのだろうか...?

- 1 つの Parent に紐づく Child は 5 つまで

他トランザクションで新たにレコードが INSERT される可能性があるため、トランザクション分離レベルを SERIALIZABLE にする。

トランザクションクイズ

Q:トランザクション処理の目的について教えてください。

<details><summary>A</summary><div>

データベースにおいて、データの一貫性を保ちつつ、複数の操作をまとめて実行することです。

</div></details>

Q: ACID の A は何を指しているでしょうか。

<details><summary>A</summary><div>

Atomicity”（原子性/不可分性）とは、トランザクションに含まれる個々の手順が「すべて実行される」か「一つも実行されない」のどちらかの状態になるという性質である。

</div></details>
