const hre = require("hardhat");

async function main() {

  const Emotions = await hre.ethers.getContractFactory("Emotions");
  const emotions = await Emotions.deploy();

  await emotions.deployed();

  console.log("Emotions deployed to:", emotions.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
