// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Puzzle { 

    bool public isSolved = false; // puzzle hasn't been solved yet
    uint256 public ticketPrice = 5 * 10 ** 15; // 0.005 ether

    event Won(string message, uint256 prize);
    event TooLate(string message);
    event Lost(string message);

    function getPuzzle() public pure returns (string memory) {
        return "When we peel it, we wipe our tears.";
    } // returns informations about the riddle

    function rules() public pure returns (string memory) {
        return "To try and guess you need to pay ticketPrice but the puzzle can be solved only once, winner takes all the money from tickets.";
    } // returns informations about the rules of the game
 
    function totalReward() public view returns(uint256){
        return address(this).balance;
    } // everytime someone will try to answer the riddle 

    function solveAndWin(string memory answer) public payable {
        require(msg.value == ticketPrice); // requires msg.value as the price of ticker = 0.005 ether
        if(isSolved == true) {
            // charges money on purpose anyways if user fails to check isSolved to increase totalReward
            emit TooLate("Too late, reward already acquired."); // returns information that reward has been already acquired
            return;
        }
        if((keccak256(abi.encodePacked(answer))) == (keccak256(abi.encodePacked("onion"))) || 
        (keccak256(abi.encodePacked(answer))) == (keccak256(abi.encodePacked("Onion"))) || 
        (keccak256(abi.encodePacked(answer))) == (keccak256(abi.encodePacked("onions"))) || 
        (keccak256(abi.encodePacked(answer))) == (keccak256(abi.encodePacked("Onions")))) { 
            // determines conditions to solve the puzzle
            isSolved = true; // determines conditions to solve the puzzle
            (bool success, ) = msg.sender.call{value: address(this).balance}(""); // if success sends the reward, no need for bytes
            require(success);
            emit Won("You Won.", address(this).balance);
            return;
        } else {
            emit Lost("You Lost."); // if any other option won't happen, you fail
            return;
        }
    }

}