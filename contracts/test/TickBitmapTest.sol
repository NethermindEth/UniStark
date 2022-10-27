// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../libraries/TickBitmap.sol';

contract TickBitmapTest {
    using TickBitmap for mapping(int16 => uint256);

    mapping(int16 => uint256) public bitmap;

    function flipTick(int24 tick) external {
        bitmap.flipTick(tick, 1);
    }

    function nextInitializedTickWithinOneWord(int24 tick, bool lte)
        external
        view
        returns (int24 next, bool initialized)
    {
        return bitmap.nextInitializedTickWithinOneWord(tick, 1, lte);
    }

    // returns whether the given tick is initialized
    function isInitialized(int24 tick) external view returns (bool) {
        (int24 next, bool initialized) = bitmap.nextInitializedTickWithinOneWord(tick, 1, true);
        return next == tick ? initialized : false;
    }
}
