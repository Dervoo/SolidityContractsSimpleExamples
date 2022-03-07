// import * as dotenv from "dotenv";

require("@nomiclabs/hardhat-waffle");
require('@nomiclabs/hardhat-ethers');
require("dotenv").config()
require("hardhat-gas-reporter")
// let secret = require('./.secret');
const REPORT_GAS = process.env.REPORT_GAS || false
// dotenv.config();
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

 module.exports = {
  // paths: {
  //   artifacts: './src/artifacts',
  // },
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {
      chainId: 31337,
    },
    // forking: {
    //   url: process.env.FORKING_URL || ""
    // },
    // Polygon: {
    //   url: secret.polygon_url,
    //   accounts: [secret.polygon_key],
    // },
    // Mumbai: {
    //   url: secret.mumbai_url,
    //   accounts: [secret.mumbai_key],
    // },
    // Bsctest: {
    //   url: secret.bsctest_url,
    //   accounts: [secret.bsctest_key],
    // },
    // Bsc: {
    //   url: secret.bsc_url,
    //   accounts: [secret.bsc_key],
    // },
    // Ethereum: {
    //   url: secret.ethereum_url,
    //   accounts: [secret.ethereum_key],
    // },
    // Ropsten: {
    //   url: secret.ropsten_url,
    //   accounts: [secret.ropsten_key],
    // },
    // Kovan: {
    //   url: secret.kovan_url,
    //   accounts: [secret.kovan_key],
    // },
    Rinkeby: {
      url: process.env.RINKEBY_URL || "https://eth-rinkeby.alchemyapi.io/v2/C6raRaQEqH8nRtFGrRtzKlElj50eT6v_",
      accounts: process.env.RINKEBY_PRIVATE_KEY !== undefined ? [process.env.RINKEBY_PRIVATE_KEY] : []
    },
  },
  gasReporter: {
    enabled: REPORT_GAS,
    currency: "USD",
    outputFile: "gas-report.txt",
    noColors: true,
    // coinmarketcap: process.env.COINMARKETCAP_API_KEY,
  },

  solidity: {
    compilers: [
      {
        version: "0.8.0",
      },
      {
        version: "0.4.22",
      },
      {
        version: "^0.9.0",
      },
    ],
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  }
};
