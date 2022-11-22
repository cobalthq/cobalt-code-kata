import React, { useState, useEffect } from "react";
import { x } from "@xstyled/emotion";
import CurrencyInputs from "./CurrencyInputs";
import i18n from "./i18n";

// Inline handlers in JSX
// Calculate button handler
// Selectors of currencies, copypaste
// Hardcoded texts
// input doesn't have a type

// Engineering changes:
// fetch requests can change – URL, versioning, format etc.
//   the whole API access, urls, error handling

// Requirements changes:
// Adding new currencies
// Localising currencies format
// Mobile version, dark mode
// Get rid of the calculate button
// input values validation

// Concerns:
// input values – to/from – making custom select components for currencies, Taylor
// input values – amount
// Samya – HTTP requests – communicating with host – Add some "http client" for our API, add error handler, check the data format that came from BE
// [Missing error handling on client side]
//    parsing JSON data in order to fill in the form
// fetches currencies – can be a custom hook – Josh
// fetches rates – ..., + ensure the data format, that the data exists
// ^^ both these things can be a part of consistent API client -- Edan
// Calculates the result
//

const httpAPI = (path, checkResultCallback) => {
  const baseURL = "http://127.0.0.1:3000/";

  fetch(`${baseURL}${path}`)
    .then((response) => response.json())
    .then(checkResultCallback)
    .catch(function () {
      console.log("error");
    });
};

const messages = i18n("en");

export default () => {
  const [currencies, setCurrencies] = useState([]);
  const [from, setFrom] = useState("USD");
  const [to, setTo] = useState("EUR");
  const [result, setResult] = useState(null);
  const [amount, setAmount] = useState(100);

  useEffect(() => {
    httpAPI("currencies", setCurrencies);
  }, []);

  const calculateResult = (from, to) => {
    if (from && to && from !== to) {
      httpAPI(`rates?from=${from}&to=${to}`, (rates) =>
        setResult(Number(rates[0].value) * amount)
      );
    }
  };

  const onChangeCurrency = (name, value) => {
    if (name === "from") setFrom(value);
    if (name === "to") setTo(value);
  };

  return (
    <>
      {messages("amountPrompt")}
      <input
        type="number"
        value={amount}
        onChange={(e) => setAmount(e.target.value)}
      />
      <CurrencyInputs
        from={from}
        to={to}
        onChange={onChangeCurrency}
        currencies={currencies}
      />
      <button
        type="button"
        title="calculate"
        onClick={() => calculateResult(from, to)}
      >
        {messages("convertAction")}
      </button>
      <x.div>{messages("resultOutput", { result })}</x.div>
    </>
  );
};
