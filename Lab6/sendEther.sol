//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sendEther{
    function send(address payable toReceiver) public payable{
        //call function retruns a boolean value indicating success or failure
        //This is the current recommended method to use

        (bool sent, ) = toReceiver.call{value:msg.value} (" ");
        require(sent, "Failed to send Ether");

        //steps to send ether
        //first account deploy 
        //copy second account address and put in column
        //back to first account
        //state the value
        //send
        //balance changed
    }
}