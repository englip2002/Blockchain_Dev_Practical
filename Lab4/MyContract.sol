//SPDX-License-Identifier:MIT
pragma solidity ^0.4.26;

contract MyContract{
    string public value;
    constructor() public{
        value = "default";
    }

    function get() constant public returns (string){
        return value;
    }

    function set(string userValue) public {
        value = userValue;
    }
}