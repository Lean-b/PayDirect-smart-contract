const { ethers } = require("hardhat");

async function main() {

  const PayDirect = await ethers.deployContract("PayDirect");
  PayDirect.waitForDeployment();

  const [deployer] = await ethers.getSigners();
  const payDirectAddress = await PayDirect.getAddress();

  console.log(" ");
  console.log("PayDirect address: ",payDirectAddress);
  console.log(" ");
  console.log("-------------------------------------------------------------------");
  console.log(" ");
  console.log("Deploying contracts with the account:", deployer.address);
  console.log(" ");
}



main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
