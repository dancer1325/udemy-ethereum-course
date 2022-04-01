# How has the project been created?
* `truffle init`
  * Create the initial scaffolding for Truffle projects
    * 'contracts' folder
      * Code of the contracts
    * 'migrations' folder
      * Contracts to deploy
      * Naming is important
        * 'number_....'
  * Problems:
    * Problem1: [Windows] If you try to execute 'truffle' commands, it will launch truffle.js file created by default
      * Solution1: Delete truffle.js file
      * Solution2: Execute `truffle.cmd`
* Copy and paste the 'UsersContract.sol' created under 'compile-and-deploy' folder

# How to run the project? 
* `truffle compile`
  * Launch it and root's path. Automatically navigates to contracts folder
  * Compile the contracts
    * Created into the build folder
* `truffle version`
  * Return all the versions of the technologies involved in it
    * Truffle itself
    * Ganache
    * Solidity
    * Node
    * Web3.js
* `truffle deploy` / `truffle deploy --network development`
  * Also compiles the contracts
  * Deploy the contracts specified under migrations folder
  * If you don't specify the network --> It will pick the only one
  * `truffle deploy --reset`
    * Reset the networks values linked to each contract deployed
    * Uses
      * Simulated local blockchain in memory. Example: Ganache
        * Each time we close / reset Ganache instance, it starts from the scratch, but it can go against the networks in the compile file
* `truffle networks`
  * Indicate what's deployed in each network
* `truffle console` / `truffle console --network NameOfTheNet`
  * Go into the command console of the network
  * It contains web3 library into
    * `web3.version` 
      * Returns the web3's version
    * `web3.eth.getAccounts([callback])`
      * Returns a promise or callback
        * web3's version: < 1.0
          * callbacks
        * web3's version: ^ 1.0
          * promises
    * `web3.eth.getAccounts().then(function(acc){accounts=acc})`
      * Store in the variable accounts
      * `accounts`
        * Return the accounts
    * `web3.eth.getBalance(accounts[0])`
      * Get the account's balance in wei
    * `web3.utils.fromWei(unitInString)` / `web3.utils.fromWei(unitInString, 'unit')`
      * If unit isn't specified --> By default it's ether
    * `web3.eth.sendTransaction({from: accounts[0], to: accounts[1], value: web3.utils.toWei('15', 'ether')})`
      * Send a transaction to the network from one account to another
    * `web3.eth.getTransaction('0x8ae8537789a6ea0208ac3c5aa7d2ab875f5cb2124d7a6593e334a2736914d8c1')`
      * Get the transaction based on the hash
        * transactionIndex: 0
          * Ganache creates 1 block / transaction
        * input: '0x0'
          * Data sent via the transaction
    * `web3.eth.getTransactionReceipt('0x8ae8537789a6ea0208ac3c5aa7d2ab875f5cb2124d7a6593e334a2736914d8c1')`
      * status: '0x1'
        * Transaction mined and executed correctly
  * `NameOfAContracContainedIntoTheNet`
    * Returns the contract's information
  * `NameOfAContracContainedIntoTheNet.address`
    * Returns the contract's address
  * `NameOfAContracContainedIntoTheNet.deployed()`
    * Deploy the contract
  * `NameOfAContracContainedIntoTheNet.deployed().then(c => instance = c)`
    * Assign the contract's instance created
    * Example
      * `Migrations.deployed().then(c => instance=c)`
      * `UsersContract.deployed().then(c => usersContract=c)`
  * `InstanceOfTheContract.attribute.call()`
    * Read the property received
    * Example
      * `instance.last_completed_migration.call()`
      * `usersContract.join("Alfredo", "Toledano")` 
        * Invoke the method directly
      * `usersContract.getUser(accounts[0])`
        * Retrieve the user linked to the account
