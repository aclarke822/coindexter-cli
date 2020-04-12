#!/usr/bin/env node
const commander = require('commander');
const packageJson = require('../package.json');

commander
    .version(packageJson.version)
    .command('key', "Manage API Key -- https://nomics.com")
    .parse(process.argv);

console.log('Hello from coindexter');