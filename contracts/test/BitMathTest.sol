// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../libraries/BitMath.sol';

contract BitMathTest {
    function mostSignificantBit(uint256 x) external pure returns (uint8 r) {
        return BitMath.mostSignificantBit(x);
    }


    function leastSignificantBit(uint256 x) external pure returns (uint8 r) {
        return BitMath.leastSignificantBit(x);
    }
}
