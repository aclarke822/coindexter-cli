const KeyManager = require('../lib/KeyManager');
const CryptoAPI = require('../lib/CryptoAPI');

const check = {
    async price(cmd) {
        try {
            keyManager = new KeyManager();
            const key = keyManager.getKey();

            const api = new CryptoAPI(key);

            const priceOutput = await api.getPriceOutput(cmd.coin, cmd.cur);

            console.log(priceOutput);
        } catch (err) {
            console.error(err.message.red);
        }
    }
}

module.exports = check;