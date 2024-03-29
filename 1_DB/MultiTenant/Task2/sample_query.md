参考記事

https://aws.amazon.com/jp/blogs/news/multi-tenant-data-isolation-with-postgresql-row-level-security/

課題 2

マルチテナント実装方式のメリットデメリット

- DB 分割
  - メリット：関連法規に対応すること可能。障害発生時の影響を極小化。可用性をテナントごとに設定可能
  - デメリット：高コスト、メンテナンス効率悪い
- スキーマ分割
  - メリット：DB 分割よりテナント作成が容易。DB 分割よりコスト削減
  - デメリット：ノイジーネイバーによるパフォーマンス劣化、キャッシュ上限のパフォーマンス劣化、障害発生時の影響大
- 行分割
  - メリット：メンテナンス容易、テナントごとのポリシー管理不要
  - デメリット：対応する場合アプリ改修必要、別テナント情報が表示されるリスク、ノイジーネイバー、障害発生時の影響大

RLS の実装方法について

- DB 接続ユーザまたはロールでアクセスできるリソースを制御する

- 初期化
  代理ロールを作成して、全てのテーブルへのアクセス権を付与
  テナント制御するテーブルで RLS 有効化

- テナント追加時
  RLS のポリシーの条件と一致するロールを作成して、代理ロールの権限を付与する。

```sql
create role "tenant1";
grant "tenant_user" to "tenant1";
```

- 接続時
  SET ROLE で対応するテナントのロールをセット

```sql
set role "tenant1";
select * from tenant;
```
