参考記事

・Prisma
https://www.prisma.io/docs/concepts/components/prisma-schema/relations/referential-actions#referential-action-defaults

課題 2

外部キー制約の参照アクションは下記の４つ

- RESTRICT
- NO ACTION
- CASCADE
- SET NULL

下記のケースで選ぶべき参照アクションについて

- エラーにする
  - RESTRICT,NO ACTION
- 子テーブルのレコードを Null にする
  - SET NULL
- 親テーブルの更新・削除を小テーブルに反映する
  - CASCADE

具体的なユースケースについて

- 従業員管理サービス
  - 部署が統廃合等で無くなった場合、その部署に所属している従業員が削除されてしまう。
- プロジェクトマネジメントツール
  - Assignee テーブルのレコードが削除されると、それに紐づく Issue に null がセットされてしまう。
- Prisma や TypeORM
  - Prisma

| Clause   | Optional relations | Mandatory relations |
| -------- | ------------------ | ------------------- |
| onDelete | SetNull            | Restrict            |
| onUpdate | Cascade            | Cascade             |

- TypeORM

  - (おそらく)エラーになる

- MySQL と PostgreSQL
  - Mysql では restrict と noaction は同じ
  - Postgre では、no action は制約チェックがトランザクション注の場合は、後回しになる。
