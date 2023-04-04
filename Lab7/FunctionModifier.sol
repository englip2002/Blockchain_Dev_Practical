// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract functionModifier {
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    address owner;

    //error handling technique
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    //ensure the time stamp is valid
    uint256 openingTime = 1635610920;
    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    struct Person {
        uint256 _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _fname, string memory _lname) public {
        people[peopleCount] = Person(peopleCount, _fname, _lname);
        incrementCount();
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
