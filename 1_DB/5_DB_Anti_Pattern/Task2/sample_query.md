参考記事

課題 2

テーブル設計の改良点について

- 複数回電話を行うユースケースを想定して、called_memo テーブルを用意した。
- 複数回ミーティングを行うことを想定して、meeting テーブルを用意した。
- 商談がキャンセルされることを想定して、closed_history テーブルを用意した。

sample query

商談 id=1 の電話メモを取得する。

```sql
SELECT *
FROM Called_memo
WHERE called_id = (SELECT called_id FROM Business_met WHERE id = 1);
```

商談 id=1 をキャンセル状態にする。

```sql
UPDATE Business_met
    SET closed = False WHERE id=1;

SELECT *
FROM Closed_history
WHERE closed_history_id = (SELECT closed_history_id FROM Business_met WHERE id = 1);

UPDATE Closed_history SET canceld = True, canceled_at = "2022-01-12 16:00:00" where id =2;

insert into Closed_history (closed_history_id,closed_at,canceld,canceled_at) values(1,null,0,null);
```

新規商談を開始した。

```sql

insert into Closed_history (closed_history_id,closed_at,canceld,canceled_at) select max(closed_history_id)+1,null,0,null from Closed_history;

insert into Meeting (meeting_id,met_at) select max(meeting_id)+1,null from Meeting;

insert into Called_memo (called_id,memo) select max(called_id)+1,null from Called_memo;

insert into Business_met(customer_id,sales_id,called,called_id,metOnce,meeting_id,closed,closed_history_id) values(3,3,False,4,False,4,False,4);
```

電話をした。

```sql
UPDATE Business_met
    SET called = True WHERE id=4;

update Called_memo
set memo="testtest"
where called_id=(select called_id from Business_met where id =4);
```
