const hre  = require("hardhat");

const main = async () => {
  const Transactions = await hre?.ethers.getContractFactory("Transactions");
  const trans = await Transactions?.deploy();
  await trans?.deployed();
  console.log("Transactions deployed to: ", trans?.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
