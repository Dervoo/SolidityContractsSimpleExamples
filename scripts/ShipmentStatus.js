const hre = require("hardhat");

async function main() {

  const ShipmentStatus = await hre.ethers.getContractFactory("ShipmentStatus");
  const shipmentstatus = await ShipmentStatus.deploy();

  await shipmentstatus.deployed();

  console.log("ShipmentStatus deployed to:", shipmentstatus.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
