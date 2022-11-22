import React, { useState, useEffect } from "react";
import { x } from "@xstyled/emotion";
import SelectCurrencies from "./SelectCurrencies";
import { useCurrencies } from "./useCurrencies";
import t from "./i18n";

// Changes in component:
// more currencies, cryptos
// texting changes
// banning currencies
// amount could be limited
// live exchange rates
// remove the convert button
// restructuring of inputs, two-way conversion
// numerous setStates – problem,

// Concerns:
// fetching the currencies – useFetchCurrencies, – David
// selecting currencies, from-to, swap – selectCurrencies as component, // Marijana
// fetching exchange rates –
// calculating rates – extract it somehow – Mohit
// input amount, output result – extract input component
// layout –

export default () => {
  const [from, setFrom] = useState("USD");
  const [to, setTo] = useState("EUR");
  const [result, setResult] = useState(null);
  const [amount, setAmount] = useState(1000);

  const { currencies } = useCurrencies(); // TODO: make sure we don't do anything currencies-related until it's loaded

  const calculate = () => convertCurrencies({ from, to, amount }, setResult);

  return (
    <>
      {t.currencies.ammountPrompt}
      <input value={amount} onChange={(e) => setAmount(e.target.value)} />
      <x.div w="100%">
        <SelectCurrencies
          value={from}
          onChange={(e) => setFrom(e.target.value)}
          currencies={currencies}
        />

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
        <SelectCurrencies
          value={to}
          onChange={(e) => setTo(e.target.value)}
          currencies={currencies}
        />
      </x.div>
      <button type="button" title="calculate" onClick={calculate}>
        {t.currencies.convertAction}
      </button>
      <x.div>
        {t.currencies.outputLabel}
        {result || ""}
      </x.div>
    </>
  );
};

/**
 * rates change in real time so need to fetch it
 * every single time we click the Calculate button
 */
const convertCurrencies = ({ from, to, amount = 0 }, callback) => {
  if (from && to && from !== to) {
    return fetch(`http://127.0.0.1:3000/rates?from=${from}&to=${to}`)
      .then((response) => response.json())
      .then((rates) => Number(rates[0].value) * amount)
      .then(callback);
  }
};
