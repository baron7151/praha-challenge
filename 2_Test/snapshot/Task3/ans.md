参考：
https://jestjs.io/ja/docs/snapshot-testing

- snapshot テストクイズ
  - Jest の公式ドキュメントでは、snapshot テストは冪等性のあるようにテストを書くように推奨されています。一方で日付などがテスト対象に埋め込まれている場合、そのまま実行すると冪等性が担保されなくなってしまいます。このようなケースでは、テストコードをどのように書くべきでしょうか。
  - スナップショットテストの結果は、git で管理する必要があるのか。