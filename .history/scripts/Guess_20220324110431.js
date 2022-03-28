const hre = require("hardhat");

async function main() {

  const Quess = await hre.ethers.getContractFactory("Quess");
  const quess = await Quess.deploy();

  await quess.deployed();

  console.log("Quess deployed to:", quess.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
