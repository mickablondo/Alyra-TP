// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./ERC20Token.sol";

/**
 * @title ERC20Token
 * @dev Création d'un token répondant à la norme ERC20
 */
contract Crowdsale {
    uint public rate = 1000000000; // taux de change : 10^9 (1 mik pour 1gwei)
    ERC20Token public token;

    constructor(uint256 initialSupply) {
        token = new ERC20Token(initialSupply); // création d'une nouvelle instance de mon Smart Contract ERC20Token
    }

    receive() external payable {
        require(msg.value >= 0.1 ether, unicode"Le montant minimal autorisé est de 0.1 ETH");
        distribute(msg.value);
    }

    /**
     * @dev changement de l'ether envoyé en token
     * puis transfère (fonction ERC20) des tokens à celui qui a envoyé l'argent
     */
    function distribute(uint256 amount) internal { // internal pour sécuriser (limiter l'utilisation)
        uint tokensToSend = amount * rate;
        token.transfer(msg.sender, tokensToSend);
    }
}