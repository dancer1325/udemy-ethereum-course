const assert = require('assert');               // NodeJs's module
const AssertionError = require('assert').AssertionError;
const Web3 = require('web3');                   // [External library] Ethereum JS API. First letter capitalized, because it's a constructor

const provider = new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545");  // Communication with the server. Locally it's Ganache server IP
const web3 = new Web3(provider);

// require allows using, since you are exporting something from that path
// 1) For solidity ^0.4.24;
// const { interface, bytecode } = require('../scripts/compile');
// 2) For solidity ^0.8.6;
const { abi, evm } = require('../scripts/compile');

let accounts;
let usersContract;

// Comes from mocha
beforeEach(async () => {
    accounts = await web3.eth.getAccounts();
    // usersContract = await new web3.eth.Contract(JSON.parse(interface))      // Create a new contract
    // usersContract = await new web3.eth.Contract(JSON.stringify(abi))               // Create a new contract. 1) For solidity ^0.4.24;
    usersContract = await new web3.eth.Contract(abi)               // Create a new contract
        // .deploy({ data: bytecode })                                    // Deploy the contract. 1) For solidity ^0.4.24;
        // .deploy({ data: evm })                                    // Deploy the contract
        // .deploy({ data: JSON.stringify(evm) })               // Problem: The data field must be HEX encoded data
        // .deploy({ data: evm.bytecode.toString() })           // Problem: The data field must be HEX encoded data
        // .deploy({ data: JSON.stringify(evm.bytecode) })      // Problem: The data field must be HEX encoded data
        .deploy({ data: evm.bytecode.object })          // Required from latest versions
        .send({ from: accounts[0], gas: '1000000', gasPrice: '30000000000000' });                  // Send the transaction
});

describe('The UsersContract', async () => {

    it('should deploy', () => {
        console.log(usersContract.options.address);
        assert.ok(usersContract.options.address);
    });

    it('should join a user', async () => {
        let name = "Carlos";
        let surname = "Landeras";

        await usersContract.methods.join(name, surname)
            .send({ from: accounts[0], gas: '500000' });
    });

    it('should retrieve a user', async () => {
        let name = "Carlos";
        let surname = "Landeras";

        await usersContract.methods.join(name, surname)
            .send({ from: accounts[0], gas: '500000' });

        let user = await usersContract.methods.getUser(accounts[0]).call();

        assert.equal(name, user[0]);
        assert.equal(surname, user[1]);
    });

    it('should not allow joining an account twice', async () => {

        await usersContract.methods.join("Pedro", "Lopez")
            .send({ from: accounts[1], gas: '500000' });

        try {
            await usersContract.methods.join("Ana", "Gomez")
                .send({ from: accounts[1], gas: '500000' });
            assert.fail('same account cant join twice');
        }
        catch (e) {
            if (e instanceof AssertionError) {
                assert.fail(e.message);
            }
        }
    });

    it('should not allow retrieving a not registered user', async () => {

        try {
            await usersContract.methods.getUser(accounts[0]).call();
            assert.fail('user should not be registered');
        }
        catch (e) {
            if (e instanceof AssertionError) {
                assert.fail(e.message);
            }
        }
    });

    it('should retrieve total registered users', async () => {

        await usersContract.methods.join("Ana", "Gomez")
            .send({ from: accounts[0], gas: '500000' });

        await usersContract.methods.join("Mario", "Bros")
            .send({ from: accounts[1], gas: '500000' });

        let total = await usersContract.methods.totalUsers().call();        
        assert.equal(total, 2);        
    });

});

