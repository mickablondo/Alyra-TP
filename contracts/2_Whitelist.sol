// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

contract Whitelist {
    // mapping(address => uint[]) students; // autre exo
    mapping(address => bool) whitelist;

    event Authorized(address _address); // déclaration event
    event EthReceived(address _address, uint _amount);

    constructor() {
        whitelist[msg.sender] = true;
    }

    modifier check() {
        require(whitelist[msg.sender], unicode"Non autorisé");
        _;
    }

    function authorize(address _address) public check {
        whitelist[_address] = true;
        emit Authorized(_address); // triggering event
    }

    receive() external payable {
        emit EthReceived(msg.sender, msg.value);
    }

    fallback() external payable {
        emit EthReceived(msg.sender, msg.value);
    }
}