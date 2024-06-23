// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    uint256 public funds; // The funds of the contract
    address public administrator; // The administrator of the contract

    // Constructor to set the contract deployer as the administrator
    constructor() {
        administrator = msg.sender;
    }

    // Modifier to restrict function access to only the administrator
    modifier onlyAdministrator() {
        require(msg.sender == administrator, "Only the administrator can call this function");
        _;
    }

    // Function to add funds to the contract
    function addFunds(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0"); // Check if the amount is greater than 0

        // Check for overflow
        assert(funds + amount >= funds);

        funds += amount; // Increase the funds by the amount
    }

    // Function to remove funds from the contract, only callable by the administrator
    function removeFunds(uint256 amount) public onlyAdministrator {
        require(amount > 0, "Amount must be greater than 0"); // Check if the amount is greater than 0
        require(funds >= amount, "Insufficient funds"); // Check if the funds are sufficient for the withdrawal

        // Prevent withdrawal of more than half of the funds
        if (amount > funds / 2) {
            revert("Cannot remove more than half of the funds");
        }

        funds -= amount; // Decrease the funds by the amount
    }
}
