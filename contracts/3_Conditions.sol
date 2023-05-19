// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

contract Conditions {
    uint number;

    function store(uint _num) public {
        require(_num != 0, "can't be zero !");
        uint increment = _num;
        uint limit = 12;
        while(limit > increment) {
            increment += _num;
        }
        number = increment;
    }

    function store2(uint _num) public {
        uint increment = _num;
        uint limit = 12;
        for(uint i=0; i<10; i++) {
            if(limit == increment) {
                increment++;
                continue;
            }
            increment += _num;
        }

        if(increment > 40) {
            revert(unicode"calmos mec héhé");
        }

        number = increment;
    }

    function retrieve() public view returns (uint) {
        return number;
    }
}