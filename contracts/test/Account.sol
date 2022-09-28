// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

contract TestAccount {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

}