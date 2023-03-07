//SPDX-License-Identifier:MIT
pragma solidity ^0.4.0;

contract Greeter{
    string public yourName;
    constructor() public {
        yourName="world 123";
    }

    //setter
    function set(string name) public{
        yourName = name;
    }

    //getter
    function hello()constant public returns(string){
        return yourName;
    }


}