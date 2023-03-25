const calc = require("./script");

describe("add function", () => {
  it("3個の引数を受け取る。", () => {
    result = calc.add(3, 10, 3);
    expect(result).toBe(16);
  });
  it("30個の引数を受け取る。", () => {
    const arr = new Array(30).fill(1);
    result = calc.add(...arr);
    expect(result).toBe(30);
  });

  it("31個の引数を受け取る。", () => {
    const arr = new Array(31).fill(1);
    expect(() => {
      calc.add(...arr);
    }).toThrow("引数が31個以上あります。");
  });
  it("引数が数字以外の場合はエラー。", () => {
    expect(() => {
      calc.add(1, "bbbb");
    }).toThrow("引数に数字以外が含まれています");
  });
  it("計算結果が 1000 を超える場合は合計ではなく「too big」と文字列が返る", () => {
    result = calc.add(1000, 10, 3);
    expect(result).toBe("too big");
  });
});

describe("multiply function", () => {
  it("3個の引数を受け取る。", () => {
    result = calc.multiply(3, 10, 3);
    expect(result).toBe(90);
  });

  it("30個の引数を受け取る。", () => {
    const arr = new Array(30).fill(1);
    result = calc.multiply(...arr);
    expect(result).toBe(1);
  });

  it("31個の引数を受け取る。", () => {
    const arr = new Array(31).fill(1);
    expect(() => {
      calc.multiply(...arr);
    }).toThrow("引数が31個以上あります。");
  });

  it("引数が数字以外の場合はエラー。", () => {
    expect(() => {
      calc.multiply(1, "bbbb");
    }).toThrow("引数に数字以外が含まれています");
  });

  it("計算結果が 1000 を超える場合は合計ではなく「big big number」と文字列が返る", () => {
    result = calc.multiply(1000, 10, 3);
    expect(result).toBe("big big number");
  });
});

describe("subtract function", () => {
  it("3個の引数を受け取る。", () => {
    result = calc.subtract(100, 10, 3);
    expect(result).toBe(87);
  });

  it("30個の引数を受け取る。", () => {
    const arr = new Array(30).fill(1);
    arr[0] = 50;
    result = calc.subtract(...arr);
    expect(result).toBe(21);
  });

  it("31個の引数を受け取る。", () => {
    const arr = new Array(31).fill(1);
    expect(() => {
      calc.subtract(...arr);
    }).toThrow("引数が31個以上あります。");
  });

  it("引数が数字以外の場合はエラー。", () => {
    expect(() => {
      calc.subtract(1, "bbbb");
    }).toThrow("引数に数字以外が含まれています");
  });

  it("計算結果がマイナスの場合は合計ではなく「negative number」と文字列が返る", () => {
    result = calc.subtract(10, 10, 3);
    expect(result).toBe("negative number");
  });
});

describe("subtract function", () => {
  it("3個の引数を受け取る。", () => {
    result = calc.divide(100, 10, 2);
    expect(result).toBe(5);
  });

  it("30個の引数を受け取る。", () => {
    const arr = new Array(30).fill(1);
    result = calc.divide(...arr);
    expect(result).toBe(1);
  });

  it("31個の引数を受け取る。", () => {
    const arr = new Array(31).fill(1);
    expect(() => {
      calc.divide(...arr);
    }).toThrow("引数が31個以上あります。");
  });

  it("引数が数字以外の場合はエラー。", () => {
    expect(() => {
      calc.divide(1, "bbbb");
    }).toThrow("引数に数字以外が含まれています");
  });
});
