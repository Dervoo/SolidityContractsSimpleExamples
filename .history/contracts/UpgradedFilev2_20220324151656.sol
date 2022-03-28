// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "UpgradedFile.sol";

contract UpgradedFilev2 is UpgradedFile {

    function initialize() public initializer {
        __Ownable_init();
        __ERC20_init("Minifiles", "MNF");
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    string fileAdmin;
    bytes32 public constant Access_Id = keccak256("Access_Id");

    function version() public pure virtual override returns (string memory) {
        return "v2!";
    }

function addTask(string memory taskName, string memory extension, uint256 taskPeriodInSeconds, string memory demands, uint256 taskCounter, bytes32 Access) public {
    require(Access == Access_Id);
    uint256 timeForCoffee = 60;
        taskPeriodInSeconds += timeForCoffee;
        tasks[taskCounter] = Tasks(taskName, extension, taskPeriodInSeconds, demands);
        taskCounter++;
    }
    function addFileAdmin(string memory newFileAdmin) public virtual {
        fileAdmin = newFileAdmin;
    }

    function getAdminName() public view virtual returns(string memory){
        return fileAdmin;
    }

}