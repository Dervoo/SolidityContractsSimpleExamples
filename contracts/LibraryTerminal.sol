// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LibraryTerminal {
 Person[] public people;
    uint256 public peopleCount = 0;
   

    struct Person {
        string _FirstName;
        string _LastName;
    }
    function addPerson(string memory _FirstName, string memory _LastName) public {
        people.push(Person(_FirstName, _LastName));
        peopleCount += 1;
        
    }
}