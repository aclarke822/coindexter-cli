[1mdiff --git a/bin/coindexter-key.js b/bin/coindexter-key.js[m
[1mindex 49e3062..0837793 100644[m
[1m--- a/bin/coindexter-key.js[m
[1m+++ b/bin/coindexter-key.js[m
[36m@@ -1,19 +1,19 @@[m
 const commander = require('commander');[m
 const key = require('../commands/key')[m
 [m
[32m+[m[32mcommander[m
[32m+[m[32m    .command('get')[m
[32m+[m[32m    .description('Get API Key')[m
[32m+[m[32m    .action(key.get);[m
[32m+[m
 commander[m
     .command('set')[m
     .description('Set API Key')[m
     .action(key.set);[m
 [m
 commander[m
[31m-    .command('show')[m
[31m-    .description('Show API Key')[m
[31m-    .action(key.show);[m
[31m-[m
[31m-commander[m
[31m-    .command('remove')[m
[31m-    .description('Remove API Key')[m
[31m-    .action(key.remove);[m
[32m+[m[32m    .command('del')[m
[32m+[m[32m    .description('Delete API Key')[m
[32m+[m[32m    .action(key.del);[m
 [m
 commander.parse(process.argv);[m
\ No newline at end of file[m
[1mdiff --git a/commands/key.js b/commands/key.js[m
[1mindex 8891235..4e34b1e 100644[m
[1m--- a/commands/key.js[m
[1m+++ b/commands/key.js[m
[36m@@ -1,12 +1,32 @@[m
[32m+[m[32mconst inquirer = require('inquirer');[m
[32m+[m[32mconst colors = require('colors');[m
[32m+[m[32mconst KeyManager = require('../lib/KeyManager');[m
[32m+[m[32mconst { isRequired } = require('../utils/validation')[m
[32m+[m
 const key = {[m
[31m-    set() {[m
[31m-        console.log("Hello from set");[m
[32m+[m[32m    get() {[m
[32m+[m[32m        console.log("Hello from get");[m
     },[m
[31m-    show() {[m
[31m-        console.log("Hello from show");[m
[32m+[m[32m    async set() {[m
[32m+[m[32m        const keyManager = new KeyManager();[m
[32m+[m[32m        const input = await inquirer.prompt([[m
[32m+[m[32m            {[m
[32m+[m[32m                type: 'input',[m
[32m+[m[32m                name: 'key',[m
[32m+[m[32m                message: 'Enter API Key'.green + ' (from https://nomics.com)',[m
[32m+[m[32m                validate: isRequired[m
[32m+[m
[32m+[m[32m            }[m
[32m+[m[32m        ]);[m
[32m+[m[41m        [m
[32m+[m[32m        const key = keyManager.setKey(input.key);[m
[32m+[m
[32m+[m[32m        if (key) {[m
[32m+[m[32m            console.log('API Key Set'.blue)[m
[32m+[m[32m        }[m
     },[m
[31m-    remove() {[m
[31m-        console.log("Hello from remove");[m
[32m+[m[32m    del() {[m
[32m+[m[32m        console.log("Hello from delete");[m
     }[m
 }[m
 [m
[1mdiff --git a/lib/KeyManager.js b/lib/KeyManager.js[m
[1mindex 4b3ba8f..5362ede 100644[m
[1m--- a/lib/KeyManager.js[m
[1m+++ b/lib/KeyManager.js[m
[36m@@ -21,7 +21,7 @@[m [mclass KeyManager {[m
         return key;[m
     }[m
 [m
[31m-    deleteKey() {[m
[32m+[m[32m    delKey() {[m
         const key = this.conf.get('apiKey');[m
 [m
         if(!key) {[m
[1mdiff --git a/utils/validation.js b/utils/validation.js[m
[1mnew file mode 100644[m
[1mindex 0000000..ba488c5[m
[1m--- /dev/null[m
[1m+++ b/utils/validation.js[m
[36m@@ -0,0 +1,4 @@[m
[32m+[m[32m// Required fields[m
[32m+[m[32mconst isRequired = input => input == '' ? 'This value is required' : true;[m
[32m+[m
[32m+[m[32mmodule.exports = { isRequired };[m
\ No newline at end of file[m
