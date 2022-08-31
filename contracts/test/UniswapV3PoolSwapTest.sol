// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../interfaces/IERC20Minimal.sol';

import '../interfaces/callback/IUniswapV3SwapCallback.sol';
import '../interfaces/IUniswapV3Pool.sol';

contract UniswapV3PoolSwapTest is IUniswapV3SwapCallback {
    int256 private _amount0Delta;
    int256 private _amount1Delta;

    function addressToBytes(address x, uint240 o, bytes memory b) private returns (bytes memory c) {
      return uintToBytes(uint(x), o, b);
    }
    function uintToBytes(uint x, uint240 o, bytes memory b) private returns (bytes memory c) {
        for (uint i = 0; i < 32; i++)
            b[o + i] = bytes1(uint8(x / (2**(8*(31 - i)))));
        return b;
    }
    function bytesToAddress(bytes memory b, uint240 o) private returns (address x) {
      return address(bytesToUint(b, o));
    }
    function bytesToUint(bytes memory b, uint240 o) private returns (uint x) {
        uint x_uint;
        for (uint i = 0; i < 32; i++)
            x_uint += uint256(uint8(b[o + i])) << 8 * (31 - i);
        return (x_uint);
    }
    function getSwapResult(
        address pool,
        bool zeroForOne,
        int256 amountSpecified,
        uint160 sqrtPriceLimitX96
    )
        external
        returns (
            int256 amount0Delta,
            int256 amount1Delta,
            uint160 nextSqrtRatio
        )
    {
        (amount0Delta, amount1Delta) = IUniswapV3Pool(pool).swap(
            address(0),
            zeroForOne,
            amountSpecified,
            sqrtPriceLimitX96,
            addressToBytes(msg.sender, 0, new bytes(32))
        );

        (nextSqrtRatio, , , , , , ) = IUniswapV3Pool(pool).slot0();
    }

    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes calldata data
    ) external override {
        address sender = bytesToAddress(data, 0);

        if (amount0Delta > 0) {
            IERC20Minimal(IUniswapV3Pool(msg.sender).token0()).transferFrom(sender, msg.sender, uint256(amount0Delta));
        } else if (amount1Delta > 0) {
            IERC20Minimal(IUniswapV3Pool(msg.sender).token1()).transferFrom(sender, msg.sender, uint256(amount1Delta));
        }
    }
}
