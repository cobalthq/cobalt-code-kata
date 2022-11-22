import { x } from "@xstyled/emotion";

const SelectCurrencies = ({ value, onChange, currencies }) => {
  return (
    <x.select value={value} onChange={onChange}>
      {currencies.map((currency) => (
        <option key={currency} value={currency}>
          {currency}
        </option>
      ))}
    </x.select>
  );
};
export default SelectCurrencies;
