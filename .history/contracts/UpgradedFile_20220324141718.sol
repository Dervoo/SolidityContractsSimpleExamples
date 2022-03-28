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

    uint256 taskCounter = 1;

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
contract UpgradedFilev2 is UpgradedFile {
    struct Tasks {
        string taskName;
        string extension;
        uint256 taskPeriodInSeconds;
        string demands;
    }

    mapping(uint256 => Tasks) public tasks;

    uint256 taskCounter = 1;
    string fileAdmin;
    bytes32 public constant Access_Id = keccak256("Access_Id");

    function version() public pure virtual override returns (string memory) {
        return "v2!";
    }

function addTask(string memory taskName, string memory extension, uint256 taskPeriodInSeconds, string memory demands, uint256 taskCounter, bytes32 Access) public override {
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
    function deleteTask(uint256 taskCounter) public {
        delete tasks[taskCounter];
    }

}

contract UpgradedFilev3 is UpgradedFilev2 {
    uint256 tax;

    function version() public pure virtual override returns (string memory) {
        return "v3!";
    }

    function assingTax(uint256 _newTax) public virtual {
        tax = _newTax;
    }

    function getTax() public view virtual returns(uint256) {
        return tax;
    }
}