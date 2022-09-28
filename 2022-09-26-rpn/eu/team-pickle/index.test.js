const { reversePol } = require("./index");

test("addition", () => {
  expect(reversePol("20 5 +")).toEqual(25);
});

test("multiplication", () => {
  expect(reversePol("20 5 *")).toEqual(100);
});

test("subtraction", () => {
  expect(reversePol("42 4 - 6 -")).toEqual(32);
});

test("division", () => {
  expect(reversePol("124 2 / 2 /")).toEqual(31);
});

test("big operation", () => {
  expect(reversePol("3 5 8 * 7 + *")).toEqual(141);
});

test("courtesy edge cases", () => {
  expect(reversePol("")).toEqual("The input string is too short");
});

test("shit input", () => {
  expect(reversePol("8 * 2 + 1")).toEqual(
    "Wrong input format. Input should be like 4 2 +"
  );
});
