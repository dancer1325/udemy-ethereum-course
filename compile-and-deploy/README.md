# How has the project been created?
* `npm init`
    * Skipping all the steps without adding detail
* solc
    * Solidity's compiler
    * `npm show solc versions`
        * Check the solc versions in npm
        * These versions are those one's specified in the contracts under DummyContracts
    * `npm install solc@DesiredVersion --save`
        * Choose your 'DesiredVersion'
        * --save
            * Store as save dependencies
        * --save-dev
            * Store as dev dependency
* web3
  * `npm show web3 versions`
    * Check the available web3 versions in npm
  * `npm install web3@DesiredVersion --save`
    * 0.Y.Z
      * Traditional callbacks
    * 1.Y.Z
      * Appear promises / async-await
  * Ethereum JS API
* chalk
  * `npm install chalk --save`
  * Style terminal string
* mocha
  * `npm install mocha --save`
  * JS test framework
* Ganache
  * Allow simulating an Ethereum blockchain
  * OS
    * [MacOS]
      * `brew install --cask ganache` 

## How to run/compile?
* Go into scripts folder
  * `node compile.js`
    * Problems:
      * Problem1: 'Error: Cannot find module 'solc''. 
        * Solution: 
        * Note: Versions used: "chalk": "2.4.1", "solc": "0.4.24" and "web3": "1.0.0-beta.35"
* `solcjs --bin UsersContract.sol`
  * Generate the bin file of the contract
  * Problems:
    * Problem1: 'node_modules/solc/soljson.js:3 Invalid asm.js: Invalid member of stdlib'
      * Solution / Consequences: TODO:

## How to run the tests?
* `node compile.js`
  * Compile the contract
* `npm run test` / `npx mocha`
  * A test script has been created