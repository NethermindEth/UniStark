// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../interfaces/IERC20Minimal.sol';

import '../interfaces/callback/IUniswapV3SwapCallback.sol';
import '../interfaces/IUniswapV3Pool.sol';

contract TestUniswapV3SwapPay is IUniswapV3SwapCallback {

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

    function swap(
        address pool,
        address recipient,
        bool zeroForOne,
        uint160 sqrtPriceX96,
        int256 amountSpecified,
        uint256 pay0,
        uint256 pay1
    ) external {
        bytes memory data = new bytes(32 * 3);
        addressToBytes(msg.sender, 0, data);
        uintToBytes(pay0, 32, data);
        uintToBytes(pay1, 64, data);
        IUniswapV3Pool(pool).swap(
            recipient,
            zeroForOne,
            amountSpecified,
            sqrtPriceX96,
            data
        );
    }

    function uniswapV3SwapCallback(
        int256,
        int256,
        bytes calldata data
    ) external override {
        address sender = bytesToAddress(data, 0);
        uint pay0 = bytesToUint(data, 32);
        uint pay1 = bytesToUint(data, 64);

        if (pay0 > 0) {
            IERC20Minimal(IUniswapV3Pool(msg.sender).token0()).transferFrom(sender, msg.sender, uint256(pay0));
        } else if (pay1 > 0) {
            IERC20Minimal(IUniswapV3Pool(msg.sender).token1()).transferFrom(sender, msg.sender, uint256(pay1));
        }
    }
}
