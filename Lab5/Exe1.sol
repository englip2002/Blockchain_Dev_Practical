//SPDX-License-Identifier:MIT
pragma solidity ^0.4.26;

contract BasicDataType{
    string public constant stringValue = "BMIS2003BAD";
    bool public myBool = true;
    int public myInt = -1;
    //unsigned integer is only for positive value
    uint public myUint = 1;

    //unsign integer number of byte 8 bit, 16bit and 256 bit 
    uint8 public myUint8 = 20;
    uint256 public myUint256 = 99999;
}
