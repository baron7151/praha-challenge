/* eslint-disable */
// todo: ここに単体テストを書いてみましょう！
import {
  sumOfArray,
  asyncSumOfArray,
  sometimesZero,
  FirstName,
} from "../functions";
import { DatabaseMock } from "../util";
import { NameApiService } from "../nameApiService";

test("test sumOfArray", () => {
  const result = sumOfArray([0, 1, 2]);
  expect(result).toBe(3);
});

test("test sumOfArray", () => {
  console.log(sumOfArray([]));
  expect(sumOfArray([])).toBe(0);
});

/*
test("文字列配列を渡したら、ビルド時にエラーになるので、テストが実行されない", () => {
  expect(() => sumOfArray(["aaa", "bbb"])).toThrow();
});
*/

test("test asyncSumOfArray", () => {
  return asyncSumOfArray([0, 1, 2]).then((result) => {
    expect(result).toBe(3);
  });
});

test("sometimesZero()", async () => {
  const { DatabaseMock: MockedDatabaseMock } = jest.requireActual("../util");

  const mockedDatabase1: DatabaseMock = new MockedDatabaseMock();
  mockedDatabase1.save = jest.fn().mockImplementation();
  const sp1 = new sometimesZero(mockedDatabase1);
  await expect(sp1.asyncSumOfArraySometimesZero([0, 1, 2, 3])).resolves.toEqual(
    6
  );

  const mockedDatabase2: DatabaseMock = new MockedDatabaseMock();
  mockedDatabase2.save = jest.fn().mockImplementation(() => {
    throw new Error("fail!");
  });
  const sp2 = new sometimesZero(mockedDatabase2);
  await expect(sp2.asyncSumOfArraySometimesZero([0, 1, 2])).resolves.toEqual(0);
});

test("getFirstNameThrowIfLong()", async () => {
  // jest.requireActual(...) => { nameApiService: ... } が返って来ます。
  // 名前を区別するために分割代入でNameApiServiceをMockedNameApiServiceとして取り出します
  const { NameApiService: MockedNameApiService } = jest.requireActual(
    "../nameApiService"
  );
  // MockedNameApiServiceを使ってNameApiServiceのインスタンスを作ります
  const mockedNameApiService: NameApiService = new MockedNameApiService();
  // NameApiServiceのgetFirstNameメソッドのみモックにします
  mockedNameApiService.getFirstName = jest.fn().mockImplementation(async () => {
    return Promise.resolve("Kento");
  });
  // getFirstNameメソッドのみモックにしたmockedNameApiServiceを注入します
  const name = new FirstName(mockedNameApiService);

  await expect(name.getFirstNameThrowIfLong(5)).resolves.toEqual("Kento");
  await expect(name.getFirstNameThrowIfLong(3)).rejects.toThrowError(
    "first_name too long"
  );
});
