// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

/**
 * @title ERC20Token
 * @dev Création d'un token répondant à la norme ERC20
 */
contract ERC20Token is ERC20 {
    // constructor importe le constructeur d'ERC20
    constructor(uint256 initialSupply) ERC20("MiK@", "MIK") {
        // fonction internal de l’ERC20 d’OpenZeppelin qui permet
        // de créer n (amount) tokens à celui qui l’appelle (msg.sender)
        _mint(msg.sender, initialSupply);
    }
}