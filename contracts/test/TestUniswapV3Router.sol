// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../libraries/SafeCast.sol';
import '../libraries/TickMath.sol';

import '../interfaces/IERC20Minimal.sol';
import '../interfaces/callback/IUniswapV3SwapCallback.sol';
import '../interfaces/IUniswapV3Pool.sol';

contract TestUniswapV3Router is IUniswapV3SwapCallback {
    using SafeCast for uint256;
    function addressesToBytes(address x, address y) private returns (bytes memory b) {
        b = new bytes(64);
        for (uint i = 0; i < 32; i++)
            b[i] = bytes1(uint8(uint(x) / (2**(8*(31 - i)))));
        for (uint i = 0; i < 32; i++)
            b[32 + i] = bytes1(uint8(uint(y) / (2**(8*(31 - i)))));
    }
    function bytesToAddresses(bytes memory b) private returns (address x, address y) {
        uint x_uint;
        uint y_uint;
        for (uint i = 0; i < 32; i++)
            x_uint += uint256(uint8(b[i])) << 8 * (31 - i);
        for (uint i = 0; i < 32; i++)
            y_uint += uint256(uint8(b[32 + i])) << 8 * (31 - i);
        return (address(x_uint), address(y_uint));
    }


    // flash swaps for an exact amount of token0 in the output pool
    function swapForExact0Multi(
        address recipient,
        address poolInput,
        address poolOutput,
        uint256 amount0Out
    ) external {
        IUniswapV3Pool(poolOutput).swap(
            recipient,
            false,
            -amount0Out.toInt256(),
            TickMath.MAX_SQRT_RATIO - 1,
            addressesToBytes(poolInput, msg.sender)
        );
    }

    // flash swaps for an exact amount of token1 in the output pool
    function swapForExact1Multi(
        address recipient,
        address poolInput,
        address poolOutput,
        uint256 amount1Out
    ) external {
        IUniswapV3Pool(poolOutput).swap(
            recipient,
            true,
            -amount1Out.toInt256(),
            TickMath.MIN_SQRT_RATIO + 1,
            addressesToBytes(poolInput, msg.sender)
        );
    }

    event SwapCallback(int256 amount0Delta, int256 amount1Delta);

    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes calldata data
    ) public override {
        emit SwapCallback(amount0Delta, amount1Delta);

        (address pool, address payer) = bytesToAddresses(data);

        // get the address and amount of the token that we need to pay
        address tokenToBePaid = IUniswapV3Pool(msg.sender).token1();
        if (amount0Delta > 0) {
            tokenToBePaid = IUniswapV3Pool(msg.sender).token0();
        }
        int256 amountToBePaid = amount1Delta;
        if (amount0Delta > 0) {
            amountToBePaid = amount0Delta;
        }

        bool zeroForOne = tokenToBePaid == IUniswapV3Pool(pool).token1();
        IUniswapV3Pool(pool).swap(
            msg.sender,
            zeroForOne,
            -amountToBePaid,
            conditional(zeroForOne),
            addressesToBytes(address(0), payer)
        );
    }

    function conditional(bool zeroForOne) internal returns (uint160) {
        if (zeroForOne) {
            return TickMath.MIN_SQRT_RATIO + 1;
        } else {
            return TickMath.MAX_SQRT_RATIO - 1;
        }
    }
}
