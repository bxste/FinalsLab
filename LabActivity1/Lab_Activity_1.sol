// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(_amount <= address(this).balance, "Insufficient balance");
        owner.transfer(_amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}