// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../libraries/SqrtPriceMath.sol';

contract SqrtPriceMathTest {
    function getNextSqrtPriceFromInput(
        uint160 sqrtP,
        uint128 liquidity,
        uint256 amountIn,
        bool zeroForOne
    ) external pure returns (uint160 sqrtQ) {
        return SqrtPriceMath.getNextSqrtPriceFromInput(sqrtP, liquidity, amountIn, zeroForOne);
    }

    function getNextSqrtPriceFromOutput(
        uint160 sqrtP,
        uint128 liquidity,
        uint256 amountOut,
        bool zeroForOne
    ) external pure returns (uint160 sqrtQ) {
        return SqrtPriceMath.getNextSqrtPriceFromOutput(sqrtP, liquidity, amountOut, zeroForOne);
    }

    function getAmount0Delta(
        uint160 sqrtLower,
        uint160 sqrtUpper,
        uint128 liquidity,
        bool roundUp
    ) external pure returns (uint256 amount0) {
        return SqrtPriceMath.getAmount0Delta(sqrtLower, sqrtUpper, liquidity, roundUp);
    }

    function getAmount1Delta(
        uint160 sqrtLower,
        uint160 sqrtUpper,
        uint128 liquidity,
        bool roundUp
    ) external pure returns (uint256 amount1) {
        return SqrtPriceMath.getAmount1Delta(sqrtLower, sqrtUpper, liquidity, roundUp);
    }
}
