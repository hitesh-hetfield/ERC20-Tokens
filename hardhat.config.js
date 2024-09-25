/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const account_pvt_key = process.env.PVT_KEY !== undefined ? [process.env.PVT_KEY] : []

module.exports = {
  solidity: "0.8.24",

  networks: {
    thunder: {
      url: "https://rpc.testnet.5ire.network",
      chainId: 997,
      accounts: account_pvt_key
    }
  },

  etherscan: {
    apiKey: {
      thunder: process.env.API_KEY != undefined ? [process.env.API_KEY] : []
    },
    customChains: [
      {
        network: "thunder",
        chainId: 997,
        urls: {
          apiURL: "https://contract.evm.testnet.5ire.network/5ire/verify",
          browserURL: "https://testnet.5irescan.io/dashboard"
        }
      }
    ]
  }
}
