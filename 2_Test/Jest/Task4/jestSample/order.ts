/* eslint-disable prettier/prettier */
export interface Order {
  orderId: number;
  price: number;
}

export class Orders {
  public getOrder(_: string): Order {
    try {
      const result: Order = { orderId: 1, price: 200 };
      return result;
    } catch (error) {
      throw new Error("Order情報取得に失敗");
    }
    //DBに保存する処理
  }
  public saveOrder(_: string): void {
    try {
      //DBに保存する処理
      return;
    } catch (error) {
      console.log(error);
      throw new Error("Order情報登録に失敗");
    }
  }
}
