// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyFinalsActivity2 {
    address payable public owner;
    uint256 public constant INITIAL_ETH_AMOUNT = 2 ether;
    uint256 public remainingEth;
    uint256 public creationTime;

    event EtherReceived(address indexed from, uint256 amount);
    event EtherSent(address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
        creationTime = block.timestamp;
        remainingEth = INITIAL_ETH_AMOUNT;
    }

    receive() external payable {
        emit EtherReceived(msg.sender, msg.value);
    }
    
    function ReceivedAndEmit() external payable {
        emit EtherReceived(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendEther(address payable _recipient, uint256 _amount) public onlyOwner {
        require(_amount <= remainingEth, "Insufficient funds in the contract");
        _recipient.transfer(_amount);
        remainingEth -= _amount;
        emit EtherSent(_recipient, _amount);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

// MyFinalsActivity2 is a Solidity contract that controls ownership and manages Ether transactions. 
// It has features for sending and receiving ether, and it starts with an owner and a certain quantity of ether.
// in addition to event recording. It also has an owner-only self-destruct option and a function for checking balances. 
// demonstrating the fundamentals of blockchain-based ether management.
