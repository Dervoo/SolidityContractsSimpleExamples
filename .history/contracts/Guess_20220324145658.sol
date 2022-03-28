// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Guess {
function quessNumberBetweenOneAndTenAndWin(uint256 number, address myWalletAddress) public view returns(string memory) {
           require (number >= 1);
           require (number <= 10);
           if(number == number && msg.sender != myWalletAddress) {
               return "reward already acquired";
           } else {
           return "You matter, remember that!";
           }
       }
}