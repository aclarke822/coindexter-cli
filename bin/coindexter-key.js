const commander = require('commander');
const key = require('../commands/key')

commander
    .command('get')
    .description('Get API Key')
    .action(key.get);

commander
    .command('set')
    .description('Set API Key')
    .action(key.set);

commander
    .command('del')
    .description('Delete API Key')
    .action(key.del);

commander.parse(process.argv);