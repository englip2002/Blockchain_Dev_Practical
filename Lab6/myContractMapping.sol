//SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

contract myContractMapping {
    
    struct Person{
        uint id;
        string firstName;
        string lastName;
    }

    // Mapping from address to uint
    mapping(uint => Person) public people;
    uint public peopleCount = 0;

    function addPerson(string memory _firstName, string memory _lastName) public {
        // Person memory tempPeople;
        // tempPeople.id = peopleCount+1;
        // tempPeople.firstName = _firstName;
        // tempPeople.lastName = _lastName;
        // people[peopleCount] = tempPeople;
        people[peopleCount] = Person (peopleCount, _firstName, _lastName);
        peopleCount += 1;
    }

}
