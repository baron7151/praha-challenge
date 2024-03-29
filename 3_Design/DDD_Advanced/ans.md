参考
https://zenn.dev/praha/articles/5c05ab671fb7ab

- アクセス制御ロジックの実装箇所について

基本的にはプレゼンテーション層に記載する。
アクセス制御がビジネスロジックと密結合している場合は、ドメイン層に記載することもある。

- ユーザをログイン状態にする処理の実装箇所について
  （外部の認証基盤を使う場合）
  インフラ層にログイン処理を記載する。（外部サービスとのやり取りの中で認証処理を行うため）
  （アプリケーション自体にログイン処理を記載する場合）
  アプリケーション層にログイン処理を記載する。（ユースケースに認証処理を記載することになるため）

- 「emailAddress」や「firebaseUserId」を User エンティティに追加することについて。

ドメイン層のロジックで認証に関する情報を取り扱うことはないため、認証に関するエンティティを作ってそこに属性を追加したほうが良い。

- 複数集約の整合性を保つ処理について

ドメインサービスまたはアプリケーションサービスに処理を記載することを検討する。ただしドメインサービスで他の集約に関する処理について記載することは違和感があるため、ドメインサービスでは対象のドメインに関する処理について記載を行い、他の集約に関して考慮する必要ある処理についてはアプリケーション層に記載する。

（複数の集約を強い整合性を保つ必要あるのか？）
アプリケーションの特性次第である。高い信頼性が求められるサービスにおいては強い整合性を保つべきだし、最悪データの不整合が生じても問題ない場合は、結果整合でも問題ない。

- 文字数の上限を超えた際にエラーを throw することに関して、どのような問題が起き得ると思いますか？

Post クラスをインスタンス化しているクラスで、文字数上限を超えた際のエラーハンドリングを適切に実装していないと、予期しないクラッシュを引き起こすことになる。

- エラーを throw する以外の設計パターンについて

エラーコードを返して、呼び出し元でエラーコードに従ってエラー処理をする。
エラーオブジェクトを返して、オブジェクトに含むエラーコードやメッセージを従って、エラー処理をする。
エラー処理コールバック関数を利用して、エラーハンドリングをカスタマイズする。
Result 型を用いて、success と failuer の型を定義して、成功した場合は success を、失敗した場合は failuer を返却するようにすることで、呼び出し元のエラーハンドリングが容易になる。
