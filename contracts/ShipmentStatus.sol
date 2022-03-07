// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ShipmentStatus {
    enum ShippingStatus {pending, shipped, delivered}
    ShippingStatus private status;
    event describtion(string description);
    constructor() {
        status = ShippingStatus.pending;
    }
    function Shipped() public {
        status = ShippingStatus.shipped;
        emit describtion("Package has been shipped");
    }
    function Delivered() public {
        status = ShippingStatus.delivered;
        emit describtion("Package has been delivered");
    }
    function getStatus(ShippingStatus _status) internal pure returns(string memory) {
        if(ShippingStatus.pending == _status) return "Pending";
        if(ShippingStatus.shipped == _status) return "Shipped";
        if(ShippingStatus.delivered == _status) return "Delivered";
    }
    function Status() public view returns(string memory) {
        ShippingStatus _status = status;
        return getStatus(_status);
    }
}