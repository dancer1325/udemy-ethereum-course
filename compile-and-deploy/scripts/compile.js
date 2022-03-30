const path = require('path');               // NodeJs's module
const fs = require('fs');                   // NodeJs's module
const solc = require('solc');               // [External library] Solidity compiler
const chalk = require('chalk');             // [External library] Style terminal string


const contractPath = path.resolve(__dirname, "../contracts", "UsersContract.sol");      // ..  Because it's considering that we run the file here
const source = fs.readFileSync(contractPath, 'utf8');

// Check if the file is read properly
// console.log(source);

// 1) For solidity ^0.4.24;
// const {interface, bytecode} = solc.compile(source, 1).contracts[':UsersContract'];        // Compile the code. We also apply destructuring
// console.log(chalk.green(interface));
// console.log(chalk.blue(bytecode));

// 2) For solidity ^0.8.6;
var input = {
    language: 'Solidity',
    sources: {
        ['UsersContract.sol']: {
            content: source
        }
    },
    settings: {
        outputSelection: {
            '*': {
                '*': ['*']
            }
        }
    }
};
const output = JSON.parse(solc.compile(JSON.stringify(input)));
console.log(output);                // Display all the compile response. Interesting to track the solution and errors

const contractInFile = output.contracts['UsersContract.sol'];     // Extract an element from the array
console.log(chalk.black(contractInFile));

const usersContract = contractInFile['UsersContract'];
console.log(usersContract);                        // abi structure and rest of contract's attributes can be seen here

const { abi, evm , name} = usersContract;         // Extract ABI (Application Binary Interface) and evm (Ethereum Virtual Machine --> ByteCode living there)
// console.log(chalk.green(abi));                       // Returns a set of Object
// console.log(chalk.green(JSON.parse(abi[0])));       //TODO: How to extract abi parsed.
console.log(chalk.blue(evm.bytecode.object));
console.log(chalk.yellow(name));

// Export it, to use in test file
module.exports = usersContract;
