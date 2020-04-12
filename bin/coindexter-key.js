const commander = require('commander');
const key = require('../commands/key')

commander
    .command('set')
    .description('Set API Key')
    .action(key.set);

commander
    .command('show')
    .description('Show API Key')
    .action(key.show);

commander
    .command('remove')
    .description('Remove API Key')
    .action(key.remove);

commander.parse(process.argv);