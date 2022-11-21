import React from "react";
import { x } from "@xstyled/emotion";

export default function CurrencySelect({ onChange, options, value }) {
  const handleChange = (event) => onChange(event.target.value);

  return (
    <x.select onChange={handleChange} value={value}>
      {options.map((option) => (
        <option key={option} value={option}>
          {option}
        </option>
      ))}
    </x.select>
  );
}
