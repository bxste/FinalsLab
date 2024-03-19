// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample {
    event FallbackReceived(address sender, uint amount);
    //event to log payment received
    event PaymentReceived(address payer, uint256 amount);

    //fallback function
    fallback() external payable { 
        emit FallbackReceived(msg.sender, msg.value);
    }
    //function to receive ether
    receive() external payable {
        emit PaymentReceived(msg.sender, msg.value);
     }
}

// This Solidity code demonstrates how Ethereum contracts can handle incoming Ether transactions using a contract named FallbackExample. 
// It makes use of two functions, receive() and fallback(), each of which has a specific function in handling payments and recording information. 
// Transparency is improved by include events like FallbackReceived and PaymentReceived, which make it possible to track transactions inside the contract. 


