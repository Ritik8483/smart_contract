require('@nomiclabs/hardhat-waffle');
//hardhat-waffle is commonly used for testing Ethereum smart contracts
module.exports = {    //The object contains properties that define how Hardhat behaves and interacts with the Ethereum network.
  solidity: '0.8.1',
  networks: {
    sepolia: {
      url: 'https://eth-sepolia.g.alchemy.com/v2/yNF6jmjoL349mj_CmznpaseJMuvG_i1Z',     //Alchemy is a service that provides Ethereum nodes and infrastructure.
      accounts: ['429e5438078f99c07fefb922b7c9b207b684f157f9e9c28f159dc210f58ec8f0'],
    },
  },
};