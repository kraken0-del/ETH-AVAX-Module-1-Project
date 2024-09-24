// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract arithmeticOperations {

    uint public result;

    function add(uint a, uint b) external {
        require(a > 0 && b > 0, "Inputs must be greater than zero");
        
        result = a + b;

        // Ensures that the result is not smaller than either of the inputs
        assert(result >= a && result >= b);
    }

    
    function subtract(uint a, uint b) external {
        require(a >= b, "First number must be greater than or equal to the second");
        result = a - b;

        // Ensures that subtraction was performed correctly
        assert(result <= a);
    }


    function multiply(uint a, uint b) external {
        if (a == 0 || b == 0) {
            revert("Multiplication by zero is not allowed");
        }

        uint newResult = a * b;

        // Assert that the result divided by 'a' gives 'b', preventing overflow
        assert(newResult / a == b);

        result = newResult;
    }

    
    function divide(uint a, uint b) external {
       
        if (b == 0) revert("Cannot divide by zero");
        
        result = a / b;

        // Ensures that the result multiplied by 'b' is equal to 'a'
        assert(result * b + (a % b) == a);
    }

    function reset() external {
        
        result = 0;
        assert(result == 0);  // Ensures that the result is actually reset to 0
    }
}
