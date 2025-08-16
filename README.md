# Simple Token Smart Contract - Internship Assignment

This repository contains a simple Solidity smart contract created for an internship assignment.

## Smart Contract (`TOKEN_ASSIGNMENT.sol`)

The contract includes the following functions:

- `mint(address to, uint256 amount)`: Allows the contract owner to create new tokens and assign them to a specific address.
- `transfer(address to, uint256 amount)`: Allows any user to transfer their tokens to another address.

The contract uses custom errors for handling reverts and emits a `Transfer` event for off-chain tracking.

## Decentralization Rationale

Decentralization is crucial for modern platforms because it fundamentally shifts control from a single entity to a distributed network of users. This eliminates single points of failure and makes the system highly resistant to censorship or shutdowns by corporations or governments. Furthermore, it fosters a trustless environment where users can interact directly without needing to rely on a central intermediary, reducing the risk of data manipulation and corruption. Ultimately, this gives users true ownership and control over their data and assets, creating a more open and equitable digital landscape.
