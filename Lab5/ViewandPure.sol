//SPDX-License-Identifier:MIT
pragma solidity >=0.6.10;

contract ViewandPure {
    uint256 public x = 1;

    //promise not to modify the state (uint public x)
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    //promise not to modify or read from state (uint public x)
    function add(uint256 i, uint256 j) public pure returns (uint256) {
        return i + j;
    }
}
