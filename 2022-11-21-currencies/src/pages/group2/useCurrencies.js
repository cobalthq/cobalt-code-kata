import { useState, useEffect } from "react";

export const useCurrencies = () => {
  const [currencies, setCurrencies] = useState([]);

  useEffect(() => {
    fetch("http://127.0.0.1:3000/currencies") // ["USD", "EUR", "GBP"]
      .then((response) => response.json())
      .then(setCurrencies);
  }, []);

  return { currencies };
};
