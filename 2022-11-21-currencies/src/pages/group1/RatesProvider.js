export class RatesProvider {
  constructor(ratesFetcher) {
    this.ratesFetcher = ratesFetcher;
  }

  convert(from, to) {
    return this.ratesFetcher
      .fetch(from, to)
      .then((response) => response.json())
      .then((rates) => Number(rates[0].value));
  }
}
