参考記事

課題１

check 制約の問題点について

- 制約の項目を増やす場合、DB 定義を変更する必要あり。（サービス影響あり。）
  - 一方で、マスターテーブルを用意して、そのテーブルをレコードを参照キーとしておけば、マスターテーブルにレコードを追加するだけで対応可能。
- 制約の項目を変更する場合、DB 定義の変更及び該当レコードの更新が必要
  - 一方で、マスターテーブルを用意して、元テーブルの参照性整合で「ON UPDATE CASCADE」を使っておけば、マスターテーブルのレコードを更新するだけで対応可能。
