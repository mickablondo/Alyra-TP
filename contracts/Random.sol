// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Random {
    uint private nonce;

    function random() public returns(uint) {
        nonce++;
        // uint() : convertir en uint
        // keccak256 : pour générer un hash
        // % : modulo 100 pour être entre 0 et 100
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, nonce)))%100;
    }
}