import React, { useState, useEffect } from "react";
import { x } from "@xstyled/emotion";

export default () => {
  const [currencies, setCurrencies] = useState([]);
  const [isCurrenciesLoading, setIsCurrenciesLoading] = useState(false);
  const [from, setFrom] = useState("USD");
  const [to, setTo] = useState("EUR");
  const [result, setResult] = useState(null);
  const [isRateLoading, setIsRateLoading] = useState(false);
  const [amount, setAmount] = useState(100);

  useEffect(() => {
    setIsCurrenciesLoading(true);
    fetch("http://localhost:3000/currencies")
      .then((response) => response.json())
      .then(setCurrencies)
      .finally(() => setIsCurrenciesLoading(false));
  }, []);

  if (isCurrenciesLoading) {
    return "Loading...";
  }

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
            setIsRateLoading(true);
            fetch(`http://localhost:3000/rates?from=${from}&to=${to}`)
              .then((response) => response.json())
              .then((rates) => Number(rates[0].value) * amount)
              .then(setResult)
              .finally(() => setIsRateLoading(false));
          }
        }}
      >
        {isRateLoading ? "Loading" : "Calculate"}
      </button>
      <x.div>Value: {result || ""}</x.div>
    </>
  );
};
