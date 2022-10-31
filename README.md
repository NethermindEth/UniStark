# UniStark (a.k.a Uniswap V3 Warped)

This repository contains the core smart contracts for the [Uniswap V3
Protocol](https://github.com/Uniswap/v3-core) modified for transpilation by 
[Warp](https://github.com/NethermindEth/warp) to [Cairo](https://starknet.io/docs/hello_cairo/index.html#hello-cairo) for
deployment on [StarkNet](https://starknet.io/).

A diff of this repo to Uniswap's original [here](https://htmlpreview.github.io/?https://github.com/NethermindEth/UniStark/blob/main/diff/v3-core.diff.html)

In order to transpile them simply [install Warp](https://github.com/NethermindEth/warp/#warp-installation-method-1) and then:

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
1. Brief introduction to Warp.
2. Installing the HardHat-warp environment.
3. Transpiling ERC20
-  Test transfers
4. Transpiling UniSwapV3
- Test FullMath library, 
- Test A Swap


### Installation Steps:
1. Install Warp for Transpiling the Contracts:
- `yarn global add @nethermindeth/warp`
- `which warp`
- `warp install`

2. Clone NethermindEth/hardhat-warp: https://github.com/NethermindEth/hardhat-warp
- run `yarn` & `yarn tsc` in hardhat-warp
3. Clone NethermindEth/UniStark Repo: https://github.com/NethermindEth/UniStark
4. Checkout the `workshop` branch
5. Create a virtual-env in the UniStark Repo: `python3.9 -m venv ./venv`
6. Activate the venv an install our modified testnet: `pip install git+https://github.com/JorikSchellekens/starknet-devnet`
7. run `yarn` in Unistark Repo


### Transpilation & Testing
1. ERC20: 
- `warp transpile contracts/test/TestERC20.sol --compile-cairo`
- `yarn test test/TestERC20.spec.ts`
2. UniSwapV3 FullMath Library
- `warp transpile contracts/test/FullMathTest.sol --compile-cairo`
- `yarn test test/FullMath.spec.ts`
3. UniSwapV3 SwapTest
- `warp transpile contracts/test/MockTimeUniSwapV3PoolDeployer.sol --compile-cairo`
- `yarn test test/UniswapV3Pool.swap.spec.ts`



This is a demonstration of Warp's capabilities. Kindly note, this is a
[Nethermind](https://nethermind.io/) project carried out with no affiliation to Uniswap. All of the
development and testing implemented in this repo has taken place in accordance
with the Uniswap Business Source Licence 1.1. and other applicable licences.
Nethermind does not use Uniswap V3 Core for revenue-generating purposes. 
