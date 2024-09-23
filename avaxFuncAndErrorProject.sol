// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionsAndErrorsOdd {

    uint public counter; // tracks how many odd numbers have been processed.

    function requireOddNumber(uint number) external {
        require(number % 2 != 0, "The number you inputted is EVEN");
        ++counter;
    }

    function assertOddNumber(uint number) external {
        assert(number % 2 != 0);
        ++counter;
    }

    function revertOddNumber(uint number) external {
        if (number % 2 == 0) {
            revert("The number you inputted is EVEN. Please try again");
        }
        ++counter;
    }
}
