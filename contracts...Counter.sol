// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract Contract{
    uint public counter;
    string public description;

    constructor(uint initialCounter, string memory initialDescription) {
        counter = initialCounter;
        description = initialDescription;
    }

    // Function to get the counter value
    function getCounter() public view returns (uint) {
        return counter;
    }

    // Function to get the description
    function getDescription() public view returns (string memory) {
        return description;
    }

    // Function to increase the counter
    function incrementCounter() public {
        counter += 1;
    }
}




    