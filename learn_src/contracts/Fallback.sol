// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Fallback {
    event Log(uint gas);

    // Fallback function must be declared as external.

    // write a fallback function
    // write a log event when the fallback function is called.
    
    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
