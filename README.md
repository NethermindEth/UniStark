# UniStark (a.k.a Uniswap V3 Warped)

This repository contains the core smart contracts for the [Uniswap V3
Protocol](https://github.com/Uniswap/v3-core) modified for transpilation by 
[Warp](https://github.com/NethermindEth/warp) to [Cairo](https://starknet.io/docs/hello_cairo/index.html#hello-cairo) for
deployment on [StarkNet](https://starknet.io/).

A diff of this repo to Uniswap's original [here](https://htmlpreview.github.io/?https://github.com/NethermindEth/UniStark/blob/main/diff/v3-core.diff.html)

In order to transpile them simply run: 
```
yarn global add @nethermindeth/warp@2.3.1
```
More detailed instructions on how to install warp can be found [here](https://github.com/NethermindEth/warp/#warp-installation-method-1)

```
warp transpile contract/UniswapV3Pool.sol
```

To transpile all of the files:
```
warp transpile contract/**/*.sol
```

Sit back and enjoy the blinking lights.

---

## Workshop:

### Agenda
1. Brief introduction to Warp
2. Transpiling UniSwap
3. Testing UniSwap
4. Installing the HardHat-warp environment
5. Transpiling ERC20
-  Test transfers
6. Transpiling UniSwapV3
- Test the FullMath library
- Test a swap


### Installation Steps:
1. Install python: `sudo apt install python3.9 python3.9-dev python3.9-venv`
2. Install Warp for Transpiling the Contracts:
- `yarn global add @nethermindeth/warp`
- `which warp`
- `warp install --python <path/to/python3.9>`

3. Clone NethermindEth/hardhat-warp: https://github.com/NethermindEth/hardhat-warp
- run `yarn` & `yarn tsc` in hardhat-warp
4. Clone NethermindEth/UniStark Repo: https://github.com/NethermindEth/UniStark
5. Checkout the `workshop` branch
6. Create a virtual-env in the UniStark Repo: `python3.9 -m venv ./venv`
7. Activate the venv an install our modified testnet: `pip install git+https://github.com/JorikSchellekens/starknet-devnet`
8. run `yarn` in Unistark Repo


### Transpilation & Testing
1. ERC20: 
- `warp transpile contracts/test/TestERC20.sol --compile-cairo`
- `yarn test test/TestERC20.spec.ts`
2. UniSwapV3 FullMath Library
- `warp transpile contracts/test/FullMathTest.sol --compile-cairo`
- `yarn test test/FullMath.spec.ts`
3. UniSwapV3 SwapTest
- `warp transpile contracts/UniSwapV3Factory.sol --compile-cairo`
- `warp transpile contracts/test/TestUniswapV3Callee.sol --compile-cairo`
- `warp transpile contracts/test/TestUniswapV3Router.sol --compile-cairo`
- `yarn test test/UniswapV3Pool.swap.spec.ts`



This is a demonstration of Warp's capabilities. Kindly note, this is a
[Nethermind](https://nethermind.io/) project carried out with no affiliation to Uniswap. All of the
development and testing implemented in this repo has taken place in accordance
with the Uniswap Business Source Licence 1.1. and other applicable licences.
Nethermind does not use Uniswap V3 Core for revenue-generating purposes. 
