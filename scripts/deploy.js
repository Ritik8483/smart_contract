const hre  = require("hardhat");  //This imports the Hardhat Runtime Environment (hre) module. It provides access to various Hardhat utilities and libraries for working with Ethereum contracts and blockchain-related tasks.

const main = async () => {    //The contract factory is a JavaScript representation of the Solidity smart contract, which allows you to create contract instances.
  const Transactions = await hre?.ethers.getContractFactory("Transactions");    //This line uses the Hardhat ethers module to get the contract factory for the "Transactions" smart contract.
  const trans = await Transactions?.deploy();   //This deploys an instance of the "Transactions" smart contract using the contract factory 
  await trans?.deployed();    //It ensures that the contract is deployed and ready to be interacted
  console.log("Transactions deployed to: ", trans?.address);
};

const runMain = async () => {
  try {
    await main();   //executing the deployment logic within main()
    process.exit(0);    //If everything executes successfully, this line exits the script with a status code of 0, indicating success.
  } catch (error) {
    console.error(error);
    process.exit(1);    //status code of 1, indicating an error
  }
};

runMain();


//JavaScript code is used to deploy a smart contract to the Ethereum blockchain using the Hardhat development environment. 