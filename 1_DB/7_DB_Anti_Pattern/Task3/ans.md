物理削除の懸念点について

- EC サイトの Order 削除の例
  - 注文完了後に Order が削除された場合、商品到着後の注文履歴の確認やカスタマーサポートの業務に支障が出る恐れがある。
  - 注文自体が削除されてしまうと、注文が本当に取り消しできているのか、顧客から問い合わせが来る可能性がある。
- 進捗管理サービスのユーザ削除
  - 退会したユーザが復活するユースケースの対応ができなくなる。
  - 退会したユーザからの問い合わせに対応できなくなる。
- 過去事例
  - 認証基盤で退会したユーザを物理削除するようにした。
    - 退会したユーザを参照するユースケースがないことを確認した上で仕様を決めたので、妥当な判断であった。
  - ポイント管理系サービスで一定期間経過後、退会したユーザを物理削除するようにした。
    - 退会したユーザに関する業務を確認した上で、使用を確定した。