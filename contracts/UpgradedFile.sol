// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract UpgradedFile is Initializable, ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable {
    struct Tasks {
        string taskName;
        string extension;
        uint256 taskPeriodInSeconds;
        string demands;
    }

    mapping(uint256 => Tasks) public tasks;

    uint256 taskCounter;

    function initialize() public initializer {
        __Ownable_init();
        __ERC20_init("Minifiles", "MNF");
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function version() public pure virtual returns (string memory) {
        return "v1!";
    }
    function addTask(string memory taskName, string memory extension, uint256 taskPeriodInSeconds, string memory demands) public{
        tasks[taskCounter] = Tasks(taskName, extension, taskPeriodInSeconds, demands);
        taskCounter++;
    }
}