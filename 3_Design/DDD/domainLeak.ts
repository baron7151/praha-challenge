class User {
  public contract: string;
  public name: string;
  constructor(contract, name) {
    this.contract = contract;
    this.name = name;
  }
}

class App1 {
  viewCard(user: User) {
    if (user.contract == "A") {
      //cardを表示
    }
  }
}

class App2 {
  givePoint(user: User) {
    if (user.contract == "B") {
      //ポイント付与
    }
  }
}

class App3 {
  viewMenu(user: User) {
    if (user.contract == "A" || "B") {
      //menu1表示
    } else if (user.contract == "D") {
      //menu2表示
    }
  }
}
