import axios from "axios";

interface PayApi {
  result: boolean;
  code: string;
}

export class PayApiService {
  public async postPayApi(_: number): Promise<PayApi> {
    try {
      //API呼び出す処理
      return { result: true, code: "1qaz2wsx" };
    } catch (error) {
      throw new Error("API呼び出し失敗");
    }
  }
}
