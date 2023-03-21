// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Bidder {
    string public name;
    uint256 public bidAmount;
    bool public eligible;
    uint256 public minBid;

    constructor (uint _setMinBid) public{
        minBid=_setMinBid;
    }

    function setName(string memory inName) public {
        name = inName;
    }

    function setBidAmount(uint256 amount) public{
        if(determineEligibility(amount)){
            bidAmount = amount;
        }
        else{
            bidAmount = 0;
        }
    }

    function determineEligibility(uint256 inAmount) public returns (bool){
        if (inAmount >= minBid) {
            eligible = true;
        } else {
            eligible = false;
        }

        return eligible;
    }
}
