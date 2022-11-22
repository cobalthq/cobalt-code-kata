import "./../../App.css";

import React, { createContext, useEffect, useState } from "react";
import ExchangeRate from "./ExchangeRate";
import { useContext } from "react";
import { RatesProvider } from "./RatesProvider";

const ratesProvider = new RatesProvider({
  fetch(from, to) {
    return fetch(`http://localhost:3000/rates?from=${from}&to=${to}`);
  },
});

function App() {
  const [currencies, setCurrencies] = useState([]); // TODO: add 'isLoading' state, not render if it's not ready

  useEffect(() => {
    fetch("http://localhost:3000/currencies") // ["USD", "EUR", "GBP"]
      .then((response) => response.json())
      .then(setCurrencies);
  }, []);

  return (
    <DependenciesProvider ratesProvider={ratesProvider}>
      <div className="App">
        <ExchangeRate currencies={currencies} />
      </div>
    </DependenciesProvider>
  );
}

export default App;

const DepsContext = createContext({});

export const useDeps = () => useContext(DepsContext);

export const DependenciesProvider = ({ children, ...services }) => (
  <DepsContext.Provider value={services}>{children}</DepsContext.Provider>
);
