const KeyManager = require('../lib/KeyManager');
const NomicsAPI = require('../lib/NomicsAPI');

const check = {
    async price(cmd) {
        try {
            keyManager = new KeyManager();
            const key = keyManager.getKey();

            const api = new NomicsAPI(key);

            const priceOutput = await api.getPriceOutput(cmd.coin, cmd.cur);

            console.log(priceOutput);
        } catch (err) {
            console.error(err.message.red);
        }
    }
}

module.exports = check;