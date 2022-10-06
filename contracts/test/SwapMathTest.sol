// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../libraries/SwapMath.sol';

contract SwapMathTest {

    function computeSwapStep(
        uint160 sqrtP,
        uint160 sqrtPTarget,
        uint128 liquidity,
        int256 amountRemaining,
        uint24 feePips
    )
        external
        pure
        returns (
            uint160 sqrtQ,
            uint256 amountIn,
            uint256 amountOut,
            uint256 feeAmount
        )
    {
        return SwapMath.computeSwapStep(sqrtP, sqrtPTarget, liquidity, amountRemaining, feePips);
    }
}
