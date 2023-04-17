参考資料
https://little-hands.hatenablog.com/entry/2017/12/07/bouded-context-implementation
https://rakusui.org/cqs/
https://zenn.dev/praha/articles/92c6494570a4dc

# 課題 2

## 境界づけられたコンテキストの説明

- 境界づけられたコンテキストについて

下記の画像のような様々なビジネスドメインを、１つの統一されたモデルを構築するのは難しい。

![境界づけられたコンテキスト1](https://cdn-ak.f.st-hatena.com/images/fotolife/l/little_hands/20171128/20171128074424.png)

そのため、ビジネス（コンテキスト）単位でシステムを分割して、それぞれの中でモデル化を行う。

![境界づけられたコンテキスト2](https://cdn-ak.f.st-hatena.com/images/fotolife/l/little_hands/20171128/20171128084349.png)

コンテキスト同士の関係性を示したコンテキストマッピングは以下の通りです。

![境界づけられたコンテキスト2](https://cdn-ak.f.st-hatena.com/images/fotolife/l/little_hands/20171128/20171128090052.png)

## human クラスの実装

- human クラスを作る。

```typescript
class Human {
  private id: UserId;
  private bloodType: BloodType;
  private birthDate: Date;
  private name: Name;

  constructor(id: UserId, bloodType: BloodType, birthDate: Date, name: Name) {
    this.id = id;
    this.bloodType = bloodType;
    this.birthDate = birthDate;
    this.name = name;
  }

  changeName(name: Name) {
    return new Human(this.id, this.bloodType, this.birthDate, name);
  }

  equals(other: Human): boolean {
    if (other === null || other === undefined) {
      return false;
    }

    if (!(other instanceof Human)) {
      return false;
    }

    return this.id.equals(other.id); //UserIdにequalsメソッドではなく、getterを用意したほうがいいかも
  }
}

class UserId {
  private id: string;
  constructor(id: string) {
    if (id === null || id === undefined) {
      throw new Error("error!");
    }
    /* validation check logic */
    this.id = id;
  }

  public equals(other: UserId): boolean {
    return this.id === other.id;
  }
}

class BloodType {
  private bloodType: string;
  constructor(bloodType: string) {
    if (bloodType === null || bloodType === undefined) {
      throw new Error("error!");
    }
    if (
      bloodType !== "A" &&
      bloodType !== "B" &&
      bloodType !== "O" &&
      bloodType !== "AB"
    ) {
      throw new Error("不正な値が入力されました。");
    }
    this.bloodType = bloodType;
  }
}

class Name {
  private name: string;
  constructor(name: string) {
    if (name === null || name === undefined) {
      throw new Error("error!");
    }
    /* validation check logic */
    this.name = name;
  }
}
```

- 新人のコードがダメな理由について

  - 他のクラスで、Human クラスと同じプロパティを利用する場合、Human クラスで実装しているバリデーションチェックのロジックを実装する必要がある。
    - プロパティのバリデーションチェックロジックを変更する必要が出た場合、プロパティを利用しているクラスを全て変更しなければならなくなるため、変更容易性の低下を招いている。(DRY の原則に反する)
    - 値オブジェクトとして、値オブジェクトでバリデーションチェックのロジックを実装することで、変更が生じた場合の修正を容易にすることができる。

- 値オブジェクトを使って、修正した後のコードは[こちら](./humanEntity.ts)。

# 課題 3

## ドメイン知識が漏れる

- 説明

  - ドメインロジックがドメイン層以外（アプリケーション層）以外のあちこちに実装されている状態。ドメインモデル貧血症に陥っていたり、カプセル化ができていないともいえる。

- サンプルコード
  - コードは[こちら](./domainLeak.ts)。

# 課題 4

## クイズ

- DDD において、DTO はどのようなケースで利用されていることを想定しているのか。
-
