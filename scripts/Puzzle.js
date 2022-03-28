const hre = require("hardhat");

async function main() {

  const Puzzle = await hre.ethers.getContractFactory("Puzzle");
  const puzzle = await Puzzle.deploy();

  await puzzle.deployed();

  console.log("Puzzle deployed to:", puzzle.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
