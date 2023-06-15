require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.9",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545/", // Cambia esto por la URL de tu red local
    },
  },
};
