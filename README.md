# Fund Project - Ethereum Smart Contract

This repository contains a Solidity smart contract that implements a fund project on the Ethereum blockchain. The contract allows users to deposit Ether (ETH) into the contract and keeps track of the deposited amounts. The contract also includes functionality to withdraw the funds by the contract owner.

## Smart Contract Details

- **Contract Address**: [Contract_Address](insert_contract_address_here)
- **Solidity Version**: 0.8.0

## Dependencies

This project relies on the following external dependency:

- [Chainlink](https://github.com/smartcontractkit/chainlink) - The Chainlink library is used for retrieving the latest ETH/USD price feed.

## Contract Functionality

The `fund_Project` contract offers the following functions:

- `fund()`: Users can deposit Ether (ETH) into the contract by calling this function. The minimum deposit amount is 1 ETH (equivalent to 50 USD) based on the ETH/USD price retrieved from the Chainlink aggregator.

- `withdraw()`: The contract owner can withdraw the accumulated funds from the contract. The funds will be transferred to the owner's address. Additionally, the deposited amounts for all users will be reset to zero, and the list of funders will be cleared.

- `getVersion()`: Retrieves the version of the Chainlink aggregator being used.

- `getPrice()`: Retrieves the latest ETH/USD price from the Chainlink aggregator.

## Usage

To use this smart contract, follow these steps:

1. Deploy the smart contract to the Ethereum network using your preferred method (e.g., Remix, Truffle, Hardhat).
2. Ensure that you have an ETH account connected to a compatible wallet (e.g., MetaMask) to interact with the contract.
3. Call the `fund()` function to deposit ETH into the contract.
4. Call the `withdraw()` function to withdraw the accumulated funds (only accessible to the contract owner).

## Owner Permissions

The `onlyOwner` modifier is implemented to restrict access to certain functions to the contract owner. Only the owner's address can invoke functions marked with this modifier.

## License

This project is licensed under the [MIT License](link_to_license_file). Feel free to use, modify, and distribute the code according to the terms specified in the license.

## Contact

If you have any questions or suggestions regarding this project, feel free to reach out to us at [xnima2000@gmail.com](mailto:xnima2000@gmail.com). We appreciate your feedback and support!

Thank you for your interest in the Fund Project. Happy coding on the Ethereum blockchain!
