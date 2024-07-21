## 課題 1

- Cookie とは？
  - サーバがユーザーのブラウザに情報を保存したい場合、HTTP レスポンスのヘッダに「Set-cookie」というフィールドを利用して、情報を送信する。ブラウザがこの HTTP レスポンスを受信すると、「Set-cookie」ヘッダに指定された情報をクッキーとして保存する。保存されたクッキーは、その後の HTTP リクエストで自動的にサーバに送信される。このとき、ブラウザは HTTP リクエストのヘッダに「Cookie」というフィールドを追加し、保存されたクッキー情報を含める。
- 異なるドメインでも Cookie は送信されるのか？
  - 送信されない。Cookie のルールで異なるドメインへ送信されることはない。
- ドメインが同じでポート番号が異なる場合は送信されるのか？
  - 送信される。Cookie の送信はポート番号には依存しないため。
- サブドメインが異なる場合は Cookie は送信されるのか。
  - Cookie のドメインフィールドの設置値次第。domain=.hoge.com で発行さしている場合は、www.hoge.comやwww.api.hoge.comにも送信される。
- Javascirpt からクッキーの値を取得されるのを防ぐことはできるか。
  - 可能。HttpOnly 属性を設定すれば、Javascript からクッキーの値が取得できなくなる。
- Https の時だけ Cookie を送信するようにできるか？
  - 可能。Secure 属性を設定すれば Https 通信の時だけクッキーを送るようにできる。
- Cookie に Expires を設定するとどうなるか？
  - Cookie が発行してから Expires に設定した期間が経過すると、Cookie が削除される。
- Same Site 属性とは？
  - 別ドメインへの Cookie の送信を制御する属性で、３つの属性がある。
    - Strict
      - 別ドメインのアプリへの全てのリクエストで Cookie を送ることができない。
    - Lax
      - 別ドメインのアプリに対しては、GET リクエスト時のみ Cookie 送信可能。（POST などでは送信不可）
    - none
      - 別ドメメインの異なるアプリ間でも制限なく Cookie を送ることができる。
- クッキーに格納しない方が良い情報は？
  - 機密性が高い以下のような情報は Cookie に格納しない方が良い
    - パスワード
    - 個人情報（氏名・生年月日・住所など）
    - クレジットカード番号
- クッキーとローカルストレージ
  - クッキーはクライアントとサーバ間で共有する必要がある情報を格納する目的で使います。一方でローカルストレージは、サーバとの間で共有が不要なデータや大量のデータを保存する目的で使います。
- Stack Overflow
  - 攻撃者が掲示板のコメント欄を利用して、クッキーを不正に送信させるための Javascript をサーバに送り、Javascript の埋め込みを行う。
  - ユーザが掲示板を閲覧した際に、Javascript が実行されて、クッキーが不正に送信される
  - 攻撃者が不正に送信された Cookie を悪用する。

## 課題 2

<details>
 <summary>Q:Cookieのデフォルトの有効期限は？</summary>
A:ブラウザが閉じられるまで。

 </details>

 <details>
 <summary>Q:Cookieの最大のサイズは？</summary>
A:4KB

 </details>