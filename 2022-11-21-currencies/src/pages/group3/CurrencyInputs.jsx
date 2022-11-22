import React from "react";
import CurrencySelect from "./CurrencySelect";
import { x } from "@xstyled/emotion";

export default function CurrencyInputs({ currencies, from, onChange, to }) {
  const onChangeFrom = (value) => onChange("from", value);

  const onChangeTo = (value) => onChange("to", value);

  const handleSwap = () => {
    onChangeFrom(to);
    onChangeTo(from);
  };

  return (
    <x.div w="100%">
      <CurrencySelect
        value={from}
        options={currencies}
        onChange={onChangeFrom}
      />
      <button type="button" title="swap" onClick={handleSwap}>
        ↔
      </button>
      <CurrencySelect onChange={onChangeTo} options={currencies} value={to} />
    </x.div>
  );
}
