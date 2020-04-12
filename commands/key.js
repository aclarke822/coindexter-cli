const inquirer = require('inquirer');
const colors = require('colors');
const KeyManager = require('../lib/KeyManager');
const { isRequired } = require('../utils/validation')

const key = {
    get() {
        try {
            const keyManager = new KeyManager();
            const key = keyManager.getKey();
            
            console.log("Current API Key: ", key.yellow);

            return key;
        } catch (err) {
            console.log(err.message.red);
        }
    },
    async set() {
        const keyManager = new KeyManager();
        const input = await inquirer.prompt([
            {
                type: 'input',
                name: 'key',
                message: 'Enter API Key'.green + ' (from https://nomics.com)',
                validate: isRequired

            }
        ]);
        
        const key = keyManager.setKey(input.key);

        if (key) {
            console.log('API Key Set'.blue);
        }
    },
    del() {
        try {
            const keyManager = new KeyManager();
            keyManager.delKey();
            
            console.log("Key deleted".blue);

            return;
        } catch (err) {
            console.log(err.message.red);
        }
    }
}

module.exports = key;