import React, { useState, useEffect } from "react";
import { x } from "@xstyled/emotion";

/**
 * For the best experience, please spend 10-20 minutes before the exercise on the following:
 *
 * 1. Launch the app (`npm i && npm run dev`), get briefly familiar with feature and code.
 *    [app doesn't launch? Try another Node.js version; project is bootstrapped with Node.js v17.7.1.]
 * 2. We put a few simple code smells here – try to find them!
 * 3. Think about the future of this component 🤔. What requirements or additional features might come next? What engineering changes might come?
 */
export default () => {
  const [currencies, setCurrencies] = useState([]);
  const [from, setFrom] = useState("USD");
  const [to, setTo] = useState("EUR");
  const [result, setResult] = useState(null);
  const [amount, setAmount] = useState(100);

  useEffect(() => {
    fetch("http://127.0.0.1:3000/currencies") // ["USD", "EUR", "GBP"]
      .then((response) => response.json())
      .then(setCurrencies);
  }, []);

  return (
    <>
      Amount to exchange:{" "}
      <input value={amount} onChange={(e) => setAmount(e.target.value)} />
      <x.div w="100%">
        <x.select value={from} onChange={(e) => setFrom(e.target.value)}>
          {currencies.map((currency) => (
            <option key={currency} value={currency}>
              {currency}
            </option>
          ))}
        </x.select>
        <button
          type="button"
          title="swap"
          onClick={() => {
            setFrom(to);
            setTo(from);
          }}
        >
          ↔
        </button>
        <x.select value={to} onChange={(e) => setTo(e.target.value)}>
          {currencies.map((currency) => (
            <option key={currency} value={currency}>
              {currency}
            </option>
          ))}
        </x.select>
      </x.div>
      <button
        type="button"
        title="calculate"
        onClick={() => {
          if (from && to && from !== to) {
            fetch(`http://127.0.0.1:3000/rates?from=${from}&to=${to}`) // [{ from: 'USD', to: 'EUR', value: '4.2' }]
              .then((response) => response.json())
              .then((rates) => Number(rates[0].value) * amount)
              .then(setResult);
          }
        }}
      >
        Calculate
      </button>
      <x.div>Value: {result || ""}</x.div>
    </>
  );
};
