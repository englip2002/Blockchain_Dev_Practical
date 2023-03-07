//SPDX-License-Identifier:MIT
//different version need different keyword
pragma solidity ^0.5.0;

contract MyContract{
    //state variable
    string public constant value = "myValue";
    constructor() public{
    }

    //can replace "pure" with "view" but will got warning (not the best)
    function get() pure public returns (string memory){
        return value;
    }

    //need to be excluded since the variable is constant
    // function set(string userValue) public {
    //     value = userValue;
    // }
}