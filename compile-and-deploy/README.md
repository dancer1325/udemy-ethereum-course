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