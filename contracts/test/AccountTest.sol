// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

contract AccountTest {
    address public owner;
    uint public greg = 100;

    constructor() {
        owner = msg.sender;
    }

    function setOwner() public {
        owner = msg.sender;
        greg = 42;
    }

}