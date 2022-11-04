require("@nomiclabs/hardhat-waffle");
require('@nomiclabs/hardhat-ethers');
require("dotenv").config()
require("hardhat-gas-reporter")
require('@openzeppelin/hardhat-upgrades');
require("@nomiclabs/hardhat-etherscan");
require('.env')

// let secret = require('./.secret');
const REPORT_GAS = process.env.REPORT_GAS || false
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

 module.exports = {
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
    Ropsten: {
      url: process.env.ROPSTEN_URL || "YOUR_ROPSTEN_URL",
      accounts: process.env.ROPSTEN_PRIVATE_KEY !== undefined ? [process.env.ROPSTEN_PRIVATE_KEY] : []
    },
    // Kovan: {
    //   url: secret.kovan_url,
    //   accounts: [secret.kovan_key],
    // },
    Rinkeby: {
      url: process.env.RINKEBY_URL || "YOUR_RINKEBY_URL",
      accounts: process.env.RINKEBY_PRIVATE_KEY !== undefined ? [process.env.RINKEBY_PRIVATE_KEY] : []
    },
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: API_KEY
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
        version: "0.8.4",
      },
      {
        version: "0.8.7",
      },
      {
        version: "0.8.9",
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
