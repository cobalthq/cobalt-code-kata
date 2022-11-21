const t =
  (strings, ...keys) =>
  (values = {}) =>
    keys.reduce(
      (acc, key, i) => [...acc, values[key], strings[i + 1]],
      [strings[0]]
    );

const DICTIONARY = {
  en: {
    amountPrompt: t`Amount to exchange: `,
    convertAction: t`Calculate!!`,
    resultOutput: t`Value: ${"result"}`,
  },
  ua: {
    amountPrompt: t`Сума для обміну:`,
    convertAction: t`Обчислити!!`,
    resultOutput: t`ПідсумокValue: ${"result"}`,
  },
};

export default (language) =>
  (key, values = {}) =>
    DICTIONARY[language][key] ? DICTIONARY[language][key](values) : key;
