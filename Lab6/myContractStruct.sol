//SPDX-License-Identifier: MIT
pragma solidity ^0.6.8;

contract myContractStruct{
    struct Person{
        string firstName;
        string lastName;
    }

    Person[] public people;
    uint public peopleCount = 0;

    function addPerson(string memory _firstName, string memory _lastName) public {
        Person memory tempPeople;
        tempPeople.firstName = _firstName;
        tempPeople.lastName = _lastName;
        people.push(tempPeople);

        peopleCount += 1;
    }

    function deleteLastPerson() public{
        people.pop();
    }
}

