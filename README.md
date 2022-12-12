To recreate the bug you'll need to

Have the latest `develop` of `warp`
`yarn` and `yarn build` `warp`
Have the latest `warp-compile` branch of `hardhat-warp`
`yarn` and `yarn build` `hardhat-warp`
Update the `package.json` of `hardhat-warp` to point to the `warp` directory
Update the `package.json` of this repo to point to `hardhat-warp`

```
yarn compile
cp BitMathTest.cairo artifacts/contracts/test/BitMathTest.sol/
yarn test test/BitMath.spec.ts
```
