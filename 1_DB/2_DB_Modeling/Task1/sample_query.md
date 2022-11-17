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
