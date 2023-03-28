//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract coin {
    address public minter;
    mapping(address => uint256) public balance;

    //create event sent function to have 3 parameters: (1) from
    //whom he money was sent, (2) to what address the money was sent, and 
    //(3) the amount of money that was sent
    event sent(address from, address to, uint amount);


    //create a constructor function where the message sender ot the person who's creating this contarct is defined as the minter and
    //message sender.
    constructor() {
        minter = msg.sender;
    }

    //add balance to own account (account that deploy)
    function mint(address reciever, uint256 amount) public {
        if (msg.sender != minter) return;
        balance[reciever] += amount;
        
    }

    //send balance from 1 account to another account
    //to send, need to back to sender account before click
    function send (address reciever, uint256 amount) public {
        //if amount is insufficient
        if (balance[msg.sender] < amount) return;
        
        balance[msg.sender] -= amount;
        balance[reciever] += amount;
        emit sent(msg.sender, reciever, amount);
    }
}
