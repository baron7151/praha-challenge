/* eslint-disable */
import { rejects } from "assert";
import { NameApiService } from "./nameApiService";
import { DatabaseMock } from "./util";

export const sumOfArray = (numbers: number[]): number => {
  return numbers.reduce((a: number, b: number): number => a + b);
};

export const asyncSumOfArray = (numbers: number[]): Promise<number> => {
  return new Promise((resolve): void => {
    resolve(sumOfArray(numbers));
  });
};

export class sometimesZero {
  constructor(private database: DatabaseMock) {}

  asyncSumOfArraySometimesZero = (numbers: number[]): Promise<number> => {
    return new Promise((resolve): void => {
      try {
        //const database = new DatabaseMock(); // fixme: この関数をテストするには、DatabaseMockの使い方を変える必要がありそう！ヒント：依存性の注入
        this.database.save(numbers);
        resolve(sumOfArray(numbers));
      } catch (error) {
        resolve(0);
      }
    });
  };
}

export class FirstName {
  constructor(private apiService: NameApiService) {}

  getFirstNameThrowIfLong = async (maxNameLength: number): Promise<string> => {
    //const nameApiService = new NameApiService(); // fixme: この関数をテストするには、NameApiServiceの使い方を変える必要がありそう！ヒント：依存性の注入

    const firstName = await this.apiService.getFirstName();

    if (firstName.length > maxNameLength) {
      throw new Error("first_name too long");
    }
    return firstName;
  };
}
