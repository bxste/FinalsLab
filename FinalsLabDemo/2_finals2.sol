// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendEther {
    constructor() payable {}
    
    receive() external payable { }
    
    function sendViaTransfer(address payable _to) external payable { _to.transfer(100); }
    
    function sendViaSend(address payable _to) external payable { bool sent = _to.send(100); require(sent, "Sending failed.");
}
    function sendViaCall(address payable _to) external payable { (bool success, ) = _to.call{value:100}(""); require(success, "Call failed.");
}
}
contract ReceiveEther {
    event Log (uint amount, uint gas);
    receive() external payable {
    emit Log(msg.value, gasleft());
}
}
contract SelfDestruct {
    event Deposit (uint amount);
    event Withdraw(uint amount);
    address public owner = msg.sender;
    
    receive() external payable {
        emit Deposit(msg.value);
}
    function withdraw() external {
        require(msg.sender == owner, "Not owner!");
        emit Withdraw (address(this).balance);
        selfdestruct(payable(msg.sender));
}
}

// This Solidity code demonstrates a number of Ether-related features, including the ability to self-destruct. 
// It contains contracts for self-destructing (SelfDestruct), transmitting and receiving ether (SendEther and ReceiveEther, respectively). 
// These contracts show off how adaptable Ethereum smart contracts are for managing contract lifecycles and handling financial transactions. 
// For Ether transfers, the code uses a variety of methods, including transfer, send, and call. It also logs transaction data for monitoring reasons by using events. 

