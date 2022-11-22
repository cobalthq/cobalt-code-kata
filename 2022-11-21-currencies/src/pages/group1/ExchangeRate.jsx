import React, { useState } from "react";
import { x } from "@xstyled/emotion";
import { useDeps } from "./index";

export default ({ currencies }) => {
  // TODO: pass currencies through Context
  const [{ from, to }, setSelectedCurrencies] = useState({
    from: "USD",
    to: "EUR",
  });

  const [result, setResult] = useState(null);
  const [amount, setAmount] = useState(100);

  const { ratesProvider } = useDeps();

  const convert = () => {
    // TODO: pass amount as arg
    if (from && to && from !== to) {
      ratesProvider
        .convert(from, to)
        .then((rate) => rate * amount)
        .then(setResult);
    }
  };

  return (
    <>
      Amount to exchange:{" "}
      <input value={amount} onChange={(e) => setAmount(e.target.value)} />
      <x.div w="100%">
        <CurrenciesPicker
          currencies={currencies}
          selected={{ from, to }}
          onCurrenciesSelected={setSelectedCurrencies}
        />
      </x.div>
      <button type="button" title="calculate" onClick={convert}>
        Calculate
      </button>
      <x.div>Value: {result || ""}</x.div>
    </>
  );
};

const CurrenciesPicker = ({ currencies, selected, onCurrenciesSelected }) => {
  const from = selected.from;
  const to = selected.to;

  const setFrom = (value) =>
    onCurrenciesSelected({
      ...selected,
      from: value,
    });
  const setTo = (value) => {
    onCurrenciesSelected({
      ...selected,
      to: value,
    });
  };

  return (
    <>
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
    </>
  );
};
