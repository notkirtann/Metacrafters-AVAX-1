// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract ErrorHandlingAssesment{

    uint public count=0;

    function testingRequire_In_Solidity(uint money) public{
        require(money > 1000,"Entered Amount must be greater than 1000");
        count++;
    }

    function testingRevert_In_Solidity(uint money) public {
        if(!(money > 1000)){
            revert("Entered Amount must be greater than 1000");
        }
        count++;
    }

    function testingAssert_In_Solidity(uint money) public{
        assert(money > 1000);
        count++;
    }

}
