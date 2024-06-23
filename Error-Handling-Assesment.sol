// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    uint private storedNumber;

    // Function to set a number
    function setNum(uint _number) public {
        require(_number > 0, "Number must be greater than zero");
        storedNumber = _number;
    }

    // Function is to get the stored number
    function getNum() public view returns (uint) {
        assert(storedNumber > 0); // Ensure the stored number is always greater than zero
        return storedNumber;
    }

    // Function to reset the stored number to zero
    function resetNum() public {
        if (storedNumber == 0) {
            revert("Number is already zero");
        }
        storedNumber = 0;
    }
}
