// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import './interfaces/IERC20Minimal.sol';

import './libraries/SafeCast.sol';
import './libraries/TickMath.sol';

import './interfaces/callback/IUniswapV3MintCallback.sol';
import './interfaces/callback/IUniswapV3SwapCallback.sol';
import './interfaces/callback/IUniswapV3FlashCallback.sol';

import './interfaces/pool/IUniswapV3PoolActions.sol';
import './interfaces/pool/IUniswapV3PoolImmutables.sol';

contract TestUniswapV3Callee is IUniswapV3MintCallback, IUniswapV3SwapCallback, IUniswapV3FlashCallback {
    using SafeCast for uint256;

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

    function swapExact0For1(
        address pool,
        uint256 amount0In,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IUniswapV3PoolActions(pool).swap(recipient, true, amount0In.toInt256(), sqrtPriceLimitX96, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    function swap0ForExact1(
        address pool,
        uint256 amount1Out,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external returns (int, int) {
       return IUniswapV3PoolActions(pool).swap(recipient, true, -amount1Out.toInt256(), sqrtPriceLimitX96, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    function swapExact1For0(
        address pool,
        uint256 amount1In,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IUniswapV3PoolActions(pool).swap(recipient, false, amount1In.toInt256(), sqrtPriceLimitX96, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    function swap1ForExact0(
        address pool,
        uint256 amount0Out,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IUniswapV3PoolActions(pool).swap(recipient, false, -amount0Out.toInt256(), sqrtPriceLimitX96, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    function swapToLowerSqrtPrice(
        address pool,
        uint160 sqrtPriceX96,
        address recipient
    ) external {
        IUniswapV3PoolActions(pool).swap(recipient, true, type(int256).max, sqrtPriceX96, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    function swapToHigherSqrtPrice(
        address pool,
        uint160 sqrtPriceX96,
        address recipient
    ) external {
        IUniswapV3PoolActions(pool).swap(recipient, false, type(int256).max, sqrtPriceX96, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    event SwapCallback(int256 amount0Delta, int256 amount1Delta);

    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes memory data
    ) external override {
        address sender = bytesToAddress(data, 0);

        emit SwapCallback(amount0Delta, amount1Delta);

        if (amount0Delta > 0) {
            IERC20Minimal(IUniswapV3PoolImmutables(msg.sender).token0()).transferFrom(sender, msg.sender, uint256(amount0Delta));
        } else if (amount1Delta > 0) {
            IERC20Minimal(IUniswapV3PoolImmutables(msg.sender).token1()).transferFrom(sender, msg.sender, uint256(amount1Delta));
        } else {
            // if both are not gt 0, both must be 0.
            assert(amount0Delta == 0 && amount1Delta == 0);
        }
    }

    function mint(
        address pool,
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount
    ) external returns (uint256 amount0, uint256 amount1) {
        return IUniswapV3PoolActions(pool).mint(recipient, tickLower, tickUpper, amount, addressToBytes(msg.sender, 0, new bytes(32)));
    }

    event MintCallback(uint256 amount0Owed, uint256 amount1Owed);

    function uniswapV3MintCallback(
        uint256 amount0Owed,
        uint256 amount1Owed,
        bytes calldata data
    ) external override {
        address sender = bytesToAddress(data, 0);

        emit MintCallback(amount0Owed, amount1Owed);
        if (amount0Owed > 0)
            IERC20Minimal(IUniswapV3PoolImmutables(msg.sender).token0()).transferFrom(sender, msg.sender, amount0Owed);
        if (amount1Owed > 0)
            IERC20Minimal(IUniswapV3PoolImmutables(msg.sender).token1()).transferFrom(sender, msg.sender, amount1Owed);
    }

    event FlashCallback(uint256 fee0, uint256 fee1);

    function flash(
        address pool,
        address recipient,
        uint256 amount0,
        uint256 amount1,
        uint256 pay0,
        uint256 pay1
    ) external {
        bytes memory b = new bytes(32 * 3);
        addressToBytes(msg.sender, 0, b);
        uintToBytes(pay0, 32, b);
        uintToBytes(pay1, 64, b);
        IUniswapV3PoolActions(pool).flash(recipient, amount0, amount1, b);
    }

    function uniswapV3FlashCallback(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external override {
        emit FlashCallback(fee0, fee1);

        address sender = bytesToAddress(data, 0);
        uint pay0 = bytesToUint(data, 32);
        uint pay1 = bytesToUint(data, 64);
        // (address sender, uint256 pay0, uint256 pay1) = abi.decode(data, (address, uint256, uint256));

        if (pay0 > 0) IERC20Minimal(IUniswapV3PoolImmutables(msg.sender).token0()).transferFrom(sender, msg.sender, pay0);
        if (pay1 > 0) IERC20Minimal(IUniswapV3PoolImmutables(msg.sender).token1()).transferFrom(sender, msg.sender, pay1);
    }
}
