#!/usr/bin/env node
const commander = require('commander');
const pkg = require('../package.json');

commander
    .version(pkg.version)
    .command('key', "Manage API Key -- https://nomics.com")
    .parse(process.argv);

console.log('Hello from coindexter');


//console.log(process.argv[2]);