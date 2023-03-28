//SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

contract myContractMapping {
    
    struct Person{
        uint id;
        string firstName;
        string lastName;
    }

    // Mapping from address to uint
    // use uint to find the exect data 
    mapping(uint => Person) public people;
    uint public peopleCount = 0;

    function addPerson(string memory _firstName, string memory _lastName) public {
        // Person memory tempPeople;
        // tempPeople.id = peopleCount+1;
        // tempPeople.firstName = _firstName;
        // tempPeople.lastName = _lastName;
        // people[peopleCount] = tempPeople;
        peopleCount += 1;
        people[peopleCount] = Person (peopleCount, _firstName, _lastName);
    }

}
