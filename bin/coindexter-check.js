const commander = require('commander');
const check = require('../commands/check')

commander
    .command('price')
    .description('Check price of coins')
    .option('--coin <type>', 'Add specific coin types in CSV format', 'BTC,ETH,XRP')
    .option('--cur <currency>', 'Change the currency', 'USD')
    .action(cmd => check.price(cmd));

commander.parse(process.argv);