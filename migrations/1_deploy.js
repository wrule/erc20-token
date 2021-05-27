const TestCoin = artifacts.require('TestCoin');

module.exports = (deployer) => {
  deployer.deploy(TestCoin);
};
