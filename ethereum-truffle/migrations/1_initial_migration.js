var Migrations = artifacts.require("./Migrations.sol");       // It picks the compiled artifacts

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
