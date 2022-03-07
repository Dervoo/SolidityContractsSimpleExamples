// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Database {
    uint256 public storedNumber;
    
    struct People {
        uint256 storedNumber;
        string name;
    }
    
    People[] public people;
    
    mapping(string => uint256) public NumberOfName;
    mapping(uint256 => string) public NameOfNumber;

    function addPerson(uint256 _number, string memory _name) public {
        people.push(People(_number, _name));
        NumberOfName[_name] = _number;
        NameOfNumber[_number] = _name;
    }
    
    function store(uint256 _number) public {
        storedNumber = _number;
    }
    function retrieveDoubleStoredNumber() public view returns(uint256) {
    return storedNumber + storedNumber;
    }
    
}