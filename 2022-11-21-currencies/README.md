# Clean React: Currencies Converter Exercise

## To launch:

```
npm run i
npm run dev
```

By default, Vite app will launch on http://localhost:5173/, json-server powered backend – http://127.0.0.1:3000.

Every folder from `src/pages` will be served as route. So, to see the app in action, access http://localhost:5173/seed. Create a separate one for yourself by copying `src/pages/seed`.

**Here are the steps on refactoring this component:**

<details>
<summary>Expand for spoilers:</summary>

1. Create a separate component for the currencies dropdown. Move it to a separate file, for example [in this way](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group3/CurrencySelect.jsx#L17).
2. Create a separate component encapsulating "from-" and "to-" dropdowns and the "swap" button. Move it to a separate file, take a look at [version 1](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group1/ExchangeRate.jsx#L46), or [version 2](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group3/CurrencyInputs.jsx#L29).
3. Create a separate API client; return an object with a method per endpoint, "fetchCurrencies" and "fetchRates". Move it to a separate file. Remember to validate and transform the response in there, not at the component, [find inspiration here](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group3/ExchangeRate.jsx#L35).
4. Inject this API client into components via React Context, here is [one point to look at it](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group1/index.jsx#L24), and here is [where it's used](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group1/ExchangeRate.jsx#L15).
5. "Currencies" are vital for this application; load them at the entry point (in this structure it's index.jsx), and pass them into ExchangeRate.jsx as props, [this can be used as an example](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group1/index.jsx#L17). Fetching can also be done within a custom hook, [for example in this way](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group2/ExchangeRate.jsx#L31).
6. Get rid of inline methods in the given JSX. See everything in "group3" folder.
7. Externalise all the messages in the app, get inspired by [this implementation](https://github.com/cobalthq/cobalt-code-kata/blob/7f24bca73ee63e97f2806312b98633d26b81a4d8/2022-11-21-currencies/src/pages/group3/ExchangeRate.jsx#L74).

</details>
