class Human {
  private id: UserId;
  private bloodType: BloodType;
  private birthDate: BirthDate;
  private name: Name;

  constructor(
    id: UserId,
    bloodType: BloodType,
    birthDate: BirthDate,
    name: Name
  ) {
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

    return this.id.equals(other.id);
  }
}

class UserId {
  private value: string;
  constructor(value: string) {
    if (value === null || value === undefined) {
      throw new Error("error!");
    }
    const regex = /^[0-9a-zA-Z]*$/; //半角英数字のみ許容
    if (regex.test(value)) {
      this.value = value;
    } else {
      throw new Error("idに半角英数字を記入してください。");
    }
  }

  public equals(other: UserId): boolean {
    return this.value === other.value;
  }
}

class BloodType {
  private value: string;
  constructor(value: string) {
    if (value === null || value === undefined) {
      throw new Error("error!");
    }
    if (value !== "a" && value !== "b" && value !== "o" && value !== "ab") {
      throw new Error("血液型に不正な値が入力されました。");
    }
    this.value = value;
  }
}

class BirthDate {
  private value: Date;
  constructor(value: Date) {
    if (value === null || value === undefined) {
      throw new Error("error!");
    }
    // 今日の日付を取得
    const today = new Date();
    // 20年前の日付を計算
    const twentyYearsAgo = new Date();
    twentyYearsAgo.setFullYear(today.getFullYear() - 20);
    if (value < twentyYearsAgo) {
      this.value = value;
    } else {
      throw new Error("２０歳未満の生年月日が入力されています。");
    }
  }
}

class Name {
  private value: string;
  constructor(value: string) {
    if (value === null || value === undefined) {
      throw new Error("error!");
    }
    if (value.length >= 20) {
      throw new Error("名前が２０文字以上です。");
    }
    this.value = value;
  }
}
