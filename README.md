# Converse in blockchain developer with Ethereum
* Notes based on the course with this name

## Structure
* DummyContracts
  * Content of Section 4, 5
  * Coded and tested in Remix
* compile-and-deploy
  * Content of Section 6

    
## How to run?
* Remix online IDE
    * https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.4.24+commit.e67f0147.js&language=Solidity
    * Place your .sol file there
    * Left panel options
        * Compile
        * Deploy
            * Environment
                * Must fit with the pragma solidity first line
            * Account
                * You need one to deploy a contract
                * It can be changed and invoke a contract's function simulating that another account is using a contract's method
            * Value
                * Money to use to be sent when the function is used
                * Currency
                    * There are different options
                    * 1 ether = 1 * 10 ^18 wei
        * Debug
* Locally
    * Set up
        * NodeJs
            * +8
        * NPM
            * +5
        * C / C++ compilations tools
            * Some necessary modules are coded in these languages
            * [Ubuntu]
                * `sudo apt-get update`
                * `sudo apt-get install build-essential`
            * [Windows]
                * Already prepared using VSC, and dowloading the extension https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
                    * It installs
                        * Visual Studio Build Tools
                        * Python 2.7
            * [MAC]
                * Something necessary?

## Short cuts
* Open the terminal and navigate to the path in which you have created / cloned / ... this project
* `code .`
    * Open VSC with the code present in this path

## Questions / TODO:
* Why web3 library isn't found in the browser console in Remix?
    * `window.ethereum`
        * No result found. why?
        * https://docs.metamask.io/guide/ethereum-provider.html#table-of-contents

## Note
* Plugins suggested
    * [VSC]
        * 'Solidity'
    * [JetBrains]
        * 'Solidity'
* Settings
  * [VSC]
    * .vscode
      * File to specify the workspace setting
      * `solidity.compileUsingRemoteVersion` 
        * Each time project is compiled --> VSC will try to download the solc's version indicated
        * Version indicated will appear in settings, workspace, solidity configuration, compile using remote version
