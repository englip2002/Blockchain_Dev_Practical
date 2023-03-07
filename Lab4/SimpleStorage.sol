//SPDX-License-Identifier:MIT
pragma solidity ^0.4.26;

contract SimpleStorage{
    uint storedData;

    function set(uint x) public{
        storedData = x;
    }

    function get() constant public returns (uint){
        return storedData;
    }

    function increment (uint n) public{
        storedData += n;
        return;
    }

    function decrement (uint n) public{
        storedData -= n;
        return;
    }
}