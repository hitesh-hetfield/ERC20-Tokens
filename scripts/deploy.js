const { ethers } = require("hardhat");

async function main() {

    const hetCoin = await ethers.getContractFactory("HetCoin");

    const tokenName = "HetCoin";
    const tokenSymbol = "$HC18$";
    const tokenDecimals = 18;
    const totalSupply = 10000;

    const hetCoinContract = await hetCoin.deploy(tokenName, tokenSymbol, tokenDecimals, totalSupply);

    console.log("Contract deployed at:", hetCoinContract.target);
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
})