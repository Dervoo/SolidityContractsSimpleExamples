
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Inbox {
    string public messageOne;
    string public messageTwo;
    function SetMessageOne(string memory _MessageOne) public {
        messageOne = _MessageOne;
    }
    function SetMessageTwo(string memory _MessageTwo) public {
        messageTwo = _MessageTwo;
    }
}