import { Orders, Order } from "./order";
import { PayApiService } from "./payApiService";

export class PayCredits {
  // eslint-disable-next-line @typescript-eslint/explicit-member-accessibility, @typescript-eslint/no-parameter-properties
  constructor(private order: Orders, private payApi: PayApiService) {}

  public getOrder(transactionId: string): Order {
    try {
      const result: Order = this.order.getOrder(transactionId);
      const orderId = result.orderId;
      const price = result.price;
      return { orderId, price };
    } catch (error) {
      console.log(error);
      return { orderId: 0, price: 0 };
    }
  }

  public payOrder = async (orderId: number, price: number): Promise<string> => {
    try {
      const data = await this.payApi.postPayApi(price);
      return data.code;
    } catch (error) {
      console.log(error);
      return "";
    }
  };

  public saveOrder = (code: string): void => {
    try {
      this.order.saveOrder(code);
      return;
    } catch (error) {
      console.log(error);
      throw new Error("決済に処理失敗");
    }
  };
}
