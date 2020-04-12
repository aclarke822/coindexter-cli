const commander = require('commander');

commander
    .command('price')
    .description('Check price of coins')
    .action(() => console.log('Hello from price'));

commander.parse(process.argv);