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
    /// @dev you assign numbers to people
    function addPerson(uint256 _number, string memory _name) public {
        people.push(People(_number, _name));
        NumberOfName[_name] = _number;
        NameOfNumber[_number] = _name;
    }
    /// @dev store current number
    function store(uint256 _number) public {
        storedNumber = _number;
    }
     /// @dev quick solidity math
    function retrieveDoubleStoredNumber() public view returns(uint256) {
    return storedNumber + storedNumber;
    }
    
}