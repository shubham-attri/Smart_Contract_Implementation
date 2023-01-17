// Help Truffle find `TruffleTutorial.sol` in the `/contracts` directory
const TruffleTutorial = artifacts.require("smartcontract");

module.exports = function(deployer) {
    // Command Truffle to deploy the Smart Contract
    deployer.deploy(smartcontract);
};