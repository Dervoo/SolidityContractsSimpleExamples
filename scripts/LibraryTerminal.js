const hre = require("hardhat");

async function main() {

  const LibraryTerminal = await hre.ethers.getContractFactory("LibraryTerminal");
  const libraryterminal = await LibraryTerminal.deploy();

  await libraryterminal.deployed();

  console.log("LibraryTerminal deployed to:", libraryterminal.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
