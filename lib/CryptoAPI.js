const axios = require('axios');
const colors = require('colors');

class CryptoAPI {
    constructor(apiKey) {
        this.apiKey = apiKey;
        this.baseUrl = 'https://api.nomics.com/v1/currencies/ticker';
    }

    async getPriceData(coinOpt, curOpt) {
        try {
            const res = await axios.get(`${baseUrl}?${this.apiKey}&ids=${coinOpt}&convert=${curOpt}`);
        } catch (err) {
            console.error(err.message)
        }

    }
}