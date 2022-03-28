// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "UpgradedFilev2.sol";

contract UpgradedFilev3 is UpgradedFilev2 {

    function initialize() public initializer {
        __Ownable_init();
        __ERC20_init("Minifiles", "MNF");
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    function version() public pure virtual override returns (string memory) {
        return "v3!";
    }

    function deleteTask(uint256 taskCounter) public {
        delete tasks[taskCounter];
    }
}