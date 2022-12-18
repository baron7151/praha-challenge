アンチパターンに陥る例について

- 共有ファイルサービスで、フォルダに関する権限とファイルに関する権限を管理したい。
  - authorization、folder、file テーブルがそれぞれできる。
  - authorization テーブルで、type や belongs_to_id カラムができる。
- 車販売システムで、普通自動車に関する評価と軽自動車に関する評価を管理できるようにしたい。
  - rate,ordinary_car,small_car テーブルが出来て、rate テーブルで type や belongs_to_id カラムができる。
