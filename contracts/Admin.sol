// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Admin is Ownable {
    
    mapping(address => bool) private whitelist;
    mapping(address => bool) private blacklist;
    
    event Whitelisted(address _address);
    event Blacklisted(address _address);

    function accept(address _addr) public onlyOwner {
        require(!whitelist[_addr], "This address is already whitelisted !");
        require(!blacklist[_addr], "This address is already blacklisted !");
        whitelist[_addr] = true;
        blacklist[_addr] = false;
        emit Whitelisted(_addr);
    }

    function ban(address _addr) public onlyOwner {
        require(!blacklist[_addr], "This address is already blacklisted !");
        require(!whitelist[_addr], "This address is already whitelisted !");
        whitelist[_addr] = false;
        blacklist[_addr] = true;
        emit Blacklisted(_addr);
    }

    function isWhitelisted(address _addr) public view onlyOwner returns(bool) {
        return whitelist[_addr];
    }

    function isBlacklisted(address _addr) public view onlyOwner returns(bool) {
        return blacklist[_addr];
    }
}