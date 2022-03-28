const hre = require("hardhat");

async function main() {

  const Guess = await hre.ethers.getContractFactory("Guess");
  const Guess = await Guess.deploy();

  await guess.deployed();

  console.log("Guess deployed to:", guess.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
