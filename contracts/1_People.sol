// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

contract People {

    // Ex 1 : créer struct Person
    struct Person {
        string name;
        uint age;
    }
    Person public moi;

    // Ex 3 : array dynamic
    Person[] public persons;

    // Ex 2 : créer fonction modifyPerson
    function modifyPerson (string calldata _name, uint _age) public {
        // moi = Person(_name, _age); // /!\ mettre dans l'ordre
        moi.name = _name;
        moi.age = _age;
    }

    // Ex 4 : Array avancé - push
    function add(string calldata _name, uint _age) public {
        Person memory tmpPerson = Person(_name, _age);
        persons.push(tmpPerson);
        // persons.push(Person(_name, _age));
    }

    // Ex 4 : Array avancé - pop
    function remove() public {
        persons.pop();
    }
}