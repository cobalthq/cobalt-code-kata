function reversePol(input) {
  const tokens = input.split(" ");
  const ops = "+-/*";
  let stack = [];

  if (!input || tokens.length < 3) {
    return "The input string is too short";
  }

  for (let index = 0; index < tokens.length; index++) {
    const element = tokens[index];

    if (ops.includes(element)) {
      let b = parseInt(stack.pop(), 10);
      let a = parseInt(stack.pop(), 10);

      if (isNaN(a) || isNaN(b)) {
        return "Wrong input format. Input should be like 4 2 +";
      }

      if (element === "+") {
        stack.push(a + b);
      } else if (element === "-") {
        stack.push(a - b);
      } else if (element === "*") {
        stack.push(a * b);
      } else if (element === "/") {
        stack.push(a / b);
      }
    } else {
      stack.push(element);
    }
  }
  return parseInt(stack[0]);
}

module.exports = {
  reversePol,
};
