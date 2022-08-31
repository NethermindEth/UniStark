// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import '../interfaces/IUniswapV3PoolDeployer.sol';

import './MockTimeUniswapV3Pool.sol';

contract MockTimeUniswapV3PoolDeployer is IUniswapV3PoolDeployer {
    struct Parameters {
        address factory;
        address token0;
        address token1;
        uint24 fee;
        int24 tickSpacing;
    }

    Parameters public override parameters;

    event PoolDeployed(address pool);

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

    function deploy(
        address factory,
        address token0,
        address token1,
        uint24 fee,
        int24 tickSpacing
    ) external returns (address pool) {
        bytes memory data = new bytes(32 * 4);
        addressToBytes(token0, 0, data);
        addressToBytes(token1, 32, data);
        uintToBytes(uint(fee), 64, data);
        uintToBytes(uint(uint24(tickSpacing)), 96, data);
        parameters = Parameters({factory: factory, token0: token0, token1: token1, fee: fee, tickSpacing: tickSpacing});
        pool = address(
            new MockTimeUniswapV3Pool{salt: keccak256(data)}()
        );
        emit PoolDeployed(pool);
        delete parameters;
    }
}
