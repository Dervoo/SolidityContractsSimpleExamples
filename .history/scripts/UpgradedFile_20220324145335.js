const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const UpgradedFile= await ethers.getContractFactory("UpgradedFile");
    const upgradedfile= await upgrades.deployProxy(UpgradedFile, []);
    await upgradedfile.deployed();
    console.log("UpgradedFile deployed to:", UpgradedFile.address);
  }
  
  main();