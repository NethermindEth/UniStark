# StarkSwap V3

This repository contains the core smart contracts for the [Uniswap V3
Protocol](https://github.com/Uniswap/v3-core) modified for transpilation by 
[Warp](https://github.com/NethermindEth/warp) to [Cairo](https://starknet.io/docs/hello_cairo/index.html#hello-cairo) for
deployment on [StarkNet](https://starknet.io/).

A diff of this repo to Uniswap's original is here <link to diff>

In order to transpile them simply [install Warp](https://github.com/NethermindEth/warp/#warp-installation-method-1) and then:

```
warp transpile contract/UniswapV3Pool.sol
```

To transpile all of the files:
```
warp transpile contract/**/*.sol
```

Sit back and enjoy the blinkenlights

This is a demonstration of Warp's capabilities. Kindly note, this is a
[Nethermind](https://nethermind.io/) project carried out with no affiliation to Uniswap. All of the
development and testing implemented in this repo has taken place in accordance
with the Uniswap Business Source Licence 1.1. and other applicable licences.
Nethermind does not use Uniswap V3 Core for revenue-generating purposes. 
