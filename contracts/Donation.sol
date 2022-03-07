
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Donation {

    address payable owner;
    uint256 amount;
    mapping(address => uint256) private totalAmount;
    address account;

    constructor() {
        owner = payable(msg.sender);
    }
    function ChooseDonationAmount(uint256 _amount) public {
        amount = _amount;
    }
    function DonateToOwner() public {
        totalAmount[owner] += amount;
    }
    function DonateToChosenAccount(address account) public {
        totalAmount[account] += amount;
    }
    function GetContractOwnerDonationsAmount() public view returns(uint256) {
        return totalAmount[owner];
    }
    function GetChosenAccountDonationsAmount(address account) public view returns(uint256) {
        return totalAmount[account];
    }
    function GetChosenDonation() public view returns(uint256) {
        return amount;
    }
}