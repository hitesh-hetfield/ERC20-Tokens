# HetCoin - Custom ERC20 Token

HetCoin is an implementation of an ERC20 token, designed for learning purposes and deployment on Ethereum-compatible blockchains. This smart contract allows users to create an ERC20 token with customizable name, symbol, decimal places, and total supply.

## Features

- Customizable token name, symbol, and decimals.
- Standard ERC20 functionality:
  - Token transfers.
  - Balance inquiries.
  - Allowances and approvals.
- Basic supply management through the constructor.

## Contract Overview

The `HetCoin` smart contract implements the ERC20 standard and allows users to interact with the token using typical ERC20 methods.

### Key Functions

- `totalSupply()`: Returns the total supply of HetCoin in circulation.
- `balanceOf(address _user)`: Returns the balance of a specific account.
- `transfer(address _recipient, uint _value)`: Transfers tokens from the sender to another address.
- `approve(address _spender, uint _value)`: Allows an account to approve a spender to transfer tokens on its behalf.
- `allowance(address _owner, address _spender)`: Returns the remaining number of tokens that a spender is allowed to transfer from the owner's account.
- `transferFrom(address _owner, address _recipient, uint _amount)`: Allows an approved spender to transfer tokens from the owner's account to another address.

### Events

- `Transfer(address indexed _from, address indexed _to, uint256 _amount)`: Emitted when tokens are transferred between addresses.
- `Approval(address _owner, address _spender, uint256 _value)`: Emitted when an account grants approval for another account to transfer tokens.

## Deployment

To deploy HetCoin, you will need an Ethereum development environment, such as Hardhat or Remix.

### Example Deployment (using Remix):

1. Copy and paste the HetCoin contract code into a new Solidity file in Remix.
2. Compile the contract using a Solidity version of 0.8.24 or higher.
3. Deploy the contract by providing the following constructor arguments:
   - `_name`: The name of the token (e.g., "HetCoin").
   - `_symbol`: The token symbol (e.g., "HET").
   - `_decimals`: The number of decimal places (e.g., 18).
   - `totalSupply_`: The initial supply of tokens (e.g., 1,000,000).

   Example constructor arguments:
   - `_name: HetCoin _symbol: HET decimals: 18 totalSupply: 1000000`

   
4. Once deployed, the contract will mint the total supply of tokens to the deployer's address.

## Example Interaction

After deploying the contract, you can use the following methods to interact with it:

- **Check Balance**: Call the `balanceOf` function to check your account balance.
- **Transfer Tokens**: Use the `transfer` function to send tokens to another address.
- **Approve Allowance**: Use the `approve` function to allow another address to spend tokens on your behalf.
- **Transfer on Behalf**: The approved spender can use `transferFrom` to transfer tokens from the original owner's account.

## Requirements

- Solidity `^0.8.24`
- Ethereum wallet (e.g., MetaMask) or local test network (e.g., Ganache)
- Ethereum-compatible development environment (e.g., Remix, Hardhat)

## License

This project is licensed under the MIT License.

---
