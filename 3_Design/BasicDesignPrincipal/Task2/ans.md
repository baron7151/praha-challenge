参考資料

```typescript
interface Purchase {
  userId: string;
  productId: string;
  transaction: {
    succeeded: true;
    completedAt: Date;
  };
}

interface PaymentRecordRepo {
  getPurchasesBy: (userId: string) => Purchase[];
}

class PurchaseService {
  public constructor(private paymentRecordRepo: PaymentRecordRepo) {}

  public purchase(userId: string, productId: string) {
    const allPurchases = this.paymentRecordRepo.getPurchasesBy(userId);
    const pastPurchase = allPurchases.find(
      (p) => p.productId === productId && p.transaction.succeeded
    );
    if (pastPurchase) {
      throw new Error("この商品はおひとりさま一品限定です！");
    }

    // 購入手続きに進む
  }
}
```

上記コードの問題点について　※要レビュー

- Purchase インターフェースの transaction の succeeded が true になっているので、boolean に変更する
  - true になっているもののみ必要なのであれば、PaymentRecordRepo に getSucceededPurchasesBy メソッドを新規に作成することを検討する
- 購入判定の検索を、SQL で行うことを検討する。
  - メリット
    - アプリケーション側の改修が少なくなる
  - デメリット
    - 複雑なクエリの場合、レスポンスに時間がかかる
    - リクエスト数が多い、または複雑なクエリの場合、DB の性能劣化が起きる可能性がある
