const hre = require("hardhat");

async function main() {

  const Inbox = await hre.ethers.getContractFactory("Inbox");
  const inbox = await Inbox.deploy();

  await inbox.deployed();

  console.log("Inbox deployed to:", inbox.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
