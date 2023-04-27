module.exports.add = function (...arr) {
  let sum = 0;
  if (arr.length > 30) {
    throw new Error("引数が31個以上あります。");
  }
  const hasNonNumeric = arr.some((value) => {
    return typeof value !== "number";
  });
  if (hasNonNumeric) {
    throw new Error("引数に数字以外が含まれています。");
  }
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  if (sum > 1000) {
    return "too big";
  }
  return sum;
};

module.exports.multiply = function (...arr) {
  let sum = 0;
  if (arr.length > 30) {
    throw new Error("引数が31個以上あります。");
  }
  const hasNonNumeric = arr.some((value) => {
    return typeof value !== "number";
  });
  if (hasNonNumeric) {
    throw new Error("引数に数字以外が含まれています。");
  }
  sum = arr.reduce((accumulator, currentValue) => accumulator * currentValue);
  if (sum > 1000) {
    return "big big number";
  }
  return sum;
};

module.exports.subtract = function (...arr) {
  if (arr.length > 30) {
    throw new Error("引数が31個以上あります。");
  }
  const hasNonNumeric = arr.some((value) => {
    return typeof value !== "number";
  });
  if (hasNonNumeric) {
    throw new Error("引数に数字以外が含まれています。");
  }
  let sum = arr[0];
  for (let i = 1; i < arr.length; i++) {
    sum -= arr[i];
  }
  if (sum < 0) {
    return "negative number";
  }
  return sum;
};

module.exports.divide = function (...arr) {
  if (arr.length > 30) {
    throw new Error("引数が31個以上あります。");
  }
  const hasNonNumeric = arr.some((value) => {
    return typeof value !== "number";
  });
  if (hasNonNumeric) {
    throw new Error("引数に数字以外が含まれています。");
  }
  sum = arr[0];
  for (let i = 1; i < arr.length; i++) {
    sum /= arr[i];
  }
  return sum;
};
