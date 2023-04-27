## ユースケースのクエリについて

「channel1 で記載されたメッセージとそのユーザ名を取得する。」

```sql
    select user_name,message from messages as A
    INNER JOIN
    channels as B
    ON
    A.channel_id= B.channel_id
    INNER JOIN
    users as C
    ON
    A.user_id = C.user_id
    where channel_name = "channel1";
```

「thread_id=1 のスレッドのメッセージを取得する。」

```sql
    select message from messages as A
    where thread_id = 1
    order by created_at desc;
```

「jirou が channel3 と workspace2 から脱退する。」

```sql
    delete from channel_user where user_id=2 and channel_id=3;
    delete from workspace_user where user_id=2 and workspace_id=2;
```

「tarou が投稿したメッセージで、"test"という文字列を含むメッセージの件数をカウントする。」

```sql
    select count(*) from messages
    where user_id=1 and message like "%test%";
```
