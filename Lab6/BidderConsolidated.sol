//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BidderConsolidated {
    string public name;
    uint256 public bidAmount;
    bool public eligible;
    uint256 public minBid;
    uint256 public winFinalAmount;
    address public winnerAddress;
    string public winnerBidder;
    uint256 public winnerTimeStamp;

    constructor(uint256 _setMinBid) {
        minBid = _setMinBid;
        winFinalAmount = _setMinBid;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function setBidAmount(uint256 _value) public {
        bidAmount = _value;
    }

    function determineEligibility() public {
        if (bidAmount >= minBid) eligible = true;
        else eligible = false;
    }

    function determineWinner() public {
        if (bidAmount >= winFinalAmount) {
            winFinalAmount = bidAmount;
            winnerBidder = name;
            winnerAddress = msg.sender;
            winnerTimeStamp = block.timestamp;
        }
    }
}
