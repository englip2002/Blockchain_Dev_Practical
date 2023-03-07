// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to  0.8.17 and less than 0.9.0

pragma solidity ^0.8.17;

contract Counter{
    uint public count;

    //Function to get the current count
    function get() public view returns (uint) {
        return count;
    }

    //function to increment count by 1
    function inc() public{
        count += 1;
    }

    //function to decrement count by 1
    function dec() public{
        count -= 1;
    }
}