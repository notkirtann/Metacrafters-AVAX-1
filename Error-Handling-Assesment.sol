// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleCalculator {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Addition function
    function add(uint256 a, uint256 b) public pure returns (uint256) {
    uint256 result = a + b;
    assert(result >= a); // Ensure no overflow
    return result;
}


    // Subtraction function
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
    require(a >= b, "Subtraction would result in a negative value");
    return a - b;
}


    // Multiplication function
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
    if (a == 0 || b == 0) {
        return 0;
    }
    uint256 result = a * b;
    assert(result / a == b); // Ensure no overflow
    return result;
}

    // Division function
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
    require(b > 0, "Division by zero");
    return a / b;
}

    // Function to trigger a manual error using revert
    function triggerError() public pure {
        revert("This is a manually triggered error");
    }
}
