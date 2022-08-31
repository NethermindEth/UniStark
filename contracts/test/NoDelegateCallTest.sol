// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../NoDelegateCall.sol';

contract NoDelegateCallTest is NoDelegateCall {
    function canBeDelegateCalled() public view returns (uint256) {
        return block.timestamp / 5;
    }

    function cannotBeDelegateCalled() public view noDelegateCall returns (uint256) {
        return block.timestamp / 5;
    }

    function callsIntoNoDelegateCallFunction() external view {
        noDelegateCallPrivate();
    }

    function noDelegateCallPrivate() private view noDelegateCall {}
}
