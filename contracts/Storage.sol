// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Database.sol";

contract Storage is Database {
    Database[] public storagesArray;
    function createstoragesContract() public {
        Database storages = new Database();
        storagesArray.push(storages);
    }
    function sfstorages(uint256 _storagesIndex, uint256 _storagesNumber) public {
        Storage(address(storagesArray[_storagesIndex])).store(_storagesNumber);
    }
    function sfget(uint256 _storagesIndex) public view returns(uint256) {
        return Storage(address(storagesArray[_storagesIndex])).retrieveDoubleStoredNumber();
    }
}