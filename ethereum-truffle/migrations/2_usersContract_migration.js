let UsersContract = artifacts.require("./UsersContract.sol");       // It picks the compiled artifacts

module.exports = function(deployer) {
    deployer.deploy(UsersContract);
}