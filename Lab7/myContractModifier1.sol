// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContractModifier1 {
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

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
