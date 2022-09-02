import { SwapMathTest__WC__SwapMathTest_compiled } from "../typechain-types";
import {expect} from 'chai';
import { getStarknetContractFactory } from 'hardhat-warp/dist/testing'
import BN = require('bn.js')
import { SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled } from "../typechain-types/SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled";
import { Uint256 } from "../typechain-types/BitMathTest__WC__BitMathTest_compiled";
import { encodePriceSqrt } from "./shared/utilities";
import { BigNumber,BigNumberish } from 'ethers'
import bn from 'bignumber.js'


export function expandTo18Decimals(n: number): BigNumber {
  return BigNumber.from(n).mul(BigNumber.from(10).pow(18))
}

var Q128 = new BN(2).pow(new BN(128))
function toUint256(x: number | BN | string): Uint256 {
  var num = new BN(x);
  return {high: num.div(Q128), low: num.mod(Q128)};
}

function toBN(x: Uint256) {
  return new BN(x.high).mul(Q128).add(new BN(x.low));
}

function Uint256toString(x: Uint256) {
  return x.high.toString() + x.low.toString();
}


describe('swapMath', () => {
    let swapMath: SwapMathTest__WC__SwapMathTest_compiled;
    let sqrtPriceMath: SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled
    beforeEach('deploy SwapMathTest', async () => {
        const swapMathFactory = getStarknetContractFactory('SwapMathTest');
        let contract = await swapMathFactory.deploy()
        swapMath = await (contract.deployed()) as SwapMathTest__WC__SwapMathTest_compiled;
        const sqrtPriceMathFactory = getStarknetContractFactory('SqrtPriceMathTest');
        contract = await sqrtPriceMathFactory.deploy()
        sqrtPriceMath = await (contract.deployed()) as SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled;
    })

    describe('#computeSwapStep', () => {

        // it('exact amount in that gets capped at price target in one for zero', async () => {
          
        //   const price = encodePriceSqrt(1, 1)
        //   const priceTarget = encodePriceSqrt(101, 100)
        //   const liquidity = expandTo18Decimals(2)
        //   const amount = expandTo18Decimals(1)
        //   const fee = 600
        //   const zeroForOne = 0;
    
          
        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     price.toString(),
        //     priceTarget.toString(),
        //     liquidity.toString(),
        //     toUint256(amount.toString()),
        //     fee.toString()
        //   )
        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];
    
        //   expect(toBN(amountIn).toString()).to.eq('9975124224178055')
        //   expect(toBN(feeAmount).toString()).to.eq('5988667735148')
        //   expect(toBN(amountOut).toString()).to.eq('9925619580021728')
        //   const lt = toBN(amountIn).add(toBN(feeAmount)).lt(new BN(amount.toString()))
        //   expect(lt, 'entire amount is not used').to.be.true;
    
        //   const priceAfterWholeInputAmount = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
        //     price.toString(),
        //     liquidity.toString(),
        //     toUint256(amount.toString()),
        //     zeroForOne.toString()
        //   )
    
        //   expect(sqrtQ.toString(), 'price is capped at price target').to.eq(priceTarget.toString())
        //   const price_lt = sqrtQ.lt(priceAfterWholeInputAmount[0]);
        //   expect(price_lt, 'price is less than price after whole input amount').to.be.true;
        // })
        
    
         it('exact amount out that gets capped at price target in one for zero', async () => {
           const price = encodePriceSqrt(1, 1);
           const priceTarget = encodePriceSqrt(101, 100);
           const liquidity = expandTo18Decimals(2);
           const amount = expandTo18Decimals(1).mul(-1).toTwos(256);
           const fee = 600;
           const zeroForOne = 0;
  
           const results = await swapMath.computeSwapStep_100d3f74(
             price.toString(),
             priceTarget.toString(),
             liquidity.toString(),
             toUint256(amount.toString()),
             fee.toString()
           )
           const sqrtQ = results[0];
           const amountIn = results[1];
           const amountOut = results[2];
           const feeAmount = results[3];
           expect(toBN(amountIn).toString()).to.eq('9975124224178055')
           expect(toBN(feeAmount).toString()).to.eq('5988667735148')
           expect(toBN(amountOut).toString()).to.eq('9925619580021728')
           expect(toBN(amountOut).toString(), 'entire amount out is not returned').to.lt(amount.mul(-1).toTwos(256));
   
           const priceAfterWholeOutputAmount = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
             price.toString(),
             liquidity.toString(),
             toUint256(amount.toString()),
             zeroForOne.toString()
           )
    
           expect(sqrtQ.toString(), 'price is capped at price target').to.eq(priceTarget.toString())
           const sqrtQ_lt = sqrtQ.lt(priceAfterWholeOutputAmount[0]);
           expect(sqrtQ_lt, 'price is less than price after whole output amount').to.be.true;
         })
    
        //  it('exact amount in that is fully spent in one for zero', async () => {
        //    const price = encodePriceSqrt(1, 1)
        //    const priceTarget = encodePriceSqrt(1000, 100)
        //    const liquidity = expandTo18Decimals(2)
        //    const amount = expandTo18Decimals(1)
        //    const fee = 600
        //    const zeroForOne = 0
   
        //    const results = await swapMath.computeSwapStep_100d3f74(
        //      price.toString(),
        //      priceTarget.toString(),
        //      liquidity.toString(),
        //      toUint256(amount.toString()),
        //      fee
        //    )
        //    const sqrtQ = results[0];
        //    const amountIn = results[1];
        //    const amountOut = results[2];
        //    const feeAmount = results[3];
    
        //    expect(toBN(amountIn).toString()).to.eq('999400000000000000')
        //    expect(toBN(feeAmount).toString()).to.eq('600000000000000')
        //    expect(toBN(amountOut).toString()).to.eq('666399946655997866')
        //    expect(toBN(amountIn).add(toBN(feeAmount)), 'entire amount is used').to.eq(amount)
   
        //    const priceAfterWholeInputAmountLessFee = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
        //      price.toString(),
        //      liquidity.toString(),
        //      toUint256((amount.sub(BigNumber.from(feeAmount))).toString()),
        //      zeroForOne.toString()
        //    )
    
        //   const sqrtQ_lt = sqrtQ.lt(new BN(priceTarget.toString()));
        //    expect(sqrtQ_lt, 'price does not reach price target').to.be.true;
        //    expect(sqrtQ.toString(), 'price is equal to price after whole input amount').to.eq(priceAfterWholeInputAmountLessFee[0].toString())
        //  })
    
        // it('exact amount out that is fully received in one for zero', async () => {
        //   const price = encodePriceSqrt(1, 1)
        //   const priceTarget = encodePriceSqrt(10000, 100)
        //   const liquidity = expandTo18Decimals(2)
        //   const amount = expandTo18Decimals(1).mul(-1)
        //   const fee = 600
        //   const zeroForOne = 0

        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     price.toString(),
        //     priceTarget.toString(),
        //     liquidity.toString(),
        //     toUint256(amount.toNumber()),
        //     fee
        //   )
        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];
    
        //   expect(toBN(amountIn).toString()).to.eq('2000000000000000000')
        //   expect(toBN(feeAmount).toString()).to.eq('1200720432259356')
        //   expect(toBN(amountOut).toString()).to.eq(amount.mul(-1))
    
        //   const priceAfterWholeOutputAmount = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
        //     price.toString(),
        //     liquidity.toString(),
        //     toUint256((amount.mul(-1)).toNumber()),
        //     zeroForOne.toString()
        //   )
    
        //   expect(sqrtQ.toNumber(), 'price does not reach price target').to.be.lt(priceTarget.toNumber())
        //   expect(sqrtQ.toString(), 'price is less than price after whole output amount').to.eq(priceAfterWholeOutputAmount[0].toString())
        // })
    
        // it('amount out is capped at the desired amount out', async () => {

        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     '417332158212080721273783715441582',
        //     '1452870262520218020823638996',
        //     '159344665391607089467575320103',
        //     toUint256(new BN(-1).toTwos(24)),
        //     1
        //   )

        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];

        //   expect(toBN(amountIn).toString()).to.eq('1')
        //   expect(toBN(feeAmount).toString()).to.eq('1')
        //   expect(toBN(amountOut).toString()).to.eq('1') // would be 2 if not capped
        //   expect(sqrtQ.toString()).to.eq('417332158212080721273783715441581')
        // })
    
        // it('target price of 1 uses partial input amount', async () => {
        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     '2',
        //     '1',
        //     '1',
        //     toUint256('3915081100057732413702495386755767'),
        //     1
        //   )

        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];

        //   expect(toBN(amountIn).toString()).to.eq('39614081257132168796771975168')
        //   expect(toBN(feeAmount).toString()).to.eq('39614120871253040049813')
        //   expect(BigNumber.from(toBN(amountIn).add(toBN(feeAmount)).toString())).to.be.lte(BigNumber.from('3915081100057732413702495386755767'))
        //   expect(toBN(amountOut).toString()).to.eq('0')
        //   expect(sqrtQ.toString()).to.eq('1')

        // })
    
        // it('entire input amount taken as fee', async () => {
        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     '2413',
        //     '79887613182836312',
        //     '1985041575832132834610021537970',
        //     toUint256(10),
        //     1872
        //   )

        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];

        //   expect(toBN(amountIn).toString()).to.eq('0')
        //   expect(toBN(feeAmount).toString()).to.eq('10')
        //   expect(toBN(amountOut).toString()).to.eq('0')
        //   expect(sqrtQ.toString()).to.eq('2413')
        // })
    
        // it('handles intermediate insufficient liquidity in zero for one exact output case', async () => {
        //   const sqrtP = BigNumber.from('20282409603651670423947251286016')
        //   const sqrtPTarget = sqrtP.mul(11).div(10)
        //   const liquidity = 1024
        //   // virtual reserves of one are only 4
        //   // https://www.wolframalpha.com/input/?i=1024+%2F+%2820282409603651670423947251286016+%2F+2**96%29
        //   const amountRemaining = -4
        //   const feePips = 3000
        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     sqrtP.toString(),
        //     sqrtPTarget.toString(),
        //     liquidity.toString(),
        //     toUint256(new BN(amountRemaining).toTwos(24)),
        //     feePips
        //   )
        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];

        //   expect(toBN(amountOut).toString()).to.eq('0')
        //   expect(sqrtQ.toString()).to.eq(sqrtPTarget.toString())
        //   expect(toBN(amountIn).toString()).to.eq('26215')
        //   expect(toBN(feeAmount).toString()).to.eq('79')
        // })
    
        // it('handles intermediate insufficient liquidity in one for zero exact output case', async () => {
        //   const sqrtP = BigNumber.from('20282409603651670423947251286016')
        //   const sqrtPTarget = sqrtP.mul(9).div(10)
        //   const liquidity = 1024
        //   // virtual reserves of zero are only 262144
        //   // https://www.wolframalpha.com/input/?i=1024+*+%2820282409603651670423947251286016+%2F+2**96%29
        //   const amountRemaining = -263000
        //   const feePips = 3000
        //   const results = await swapMath.computeSwapStep_100d3f74(
        //     sqrtP.toString(),
        //     sqrtPTarget.toString(),
        //     liquidity.toString(),
        //     toUint256(new BN(amountRemaining).toTwos(24)),
        //     feePips
        //   )

        //   const sqrtQ = results[0];
        //   const amountIn = results[1];
        //   const amountOut = results[2];
        //   const feeAmount = results[3];

        //   expect(toBN(amountOut).toString()).to.eq('26214');
        //   expect(sqrtQ.toString()).to.eq(sqrtPTarget);
        //   expect(toBN(amountIn).toString()).to.eq('1');
        //   expect(toBN(feeAmount).toString()).to.eq('1');
        // })
    /*
        describe('gas', () => {
          it('swap one for zero exact in capped', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(101, 100),
                expandTo18Decimals(2),
                expandTo18Decimals(1),
                600
              )
            )
          })
          it('swap zero for one exact in capped', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(99, 100),
                expandTo18Decimals(2),
                expandTo18Decimals(1),
                600
              )
            )
          })
          it('swap one for zero exact out capped', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(101, 100),
                expandTo18Decimals(2),
                expandTo18Decimals(1).mul(-1),
                600
              )
            )
          })
          it('swap zero for one exact out capped', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(99, 100),
                expandTo18Decimals(2),
                expandTo18Decimals(1).mul(-1),
                600
              )
            )
          })
          it('swap one for zero exact in partial', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(1010, 100),
                expandTo18Decimals(2),
                1000,
                600
              )
            )
          })
          it('swap zero for one exact in partial', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(99, 1000),
                expandTo18Decimals(2),
                1000,
                600
              )
            )
          })
          it('swap one for zero exact out partial', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(1010, 100),
                expandTo18Decimals(2),
                1000,
                600
              )
            )
          })
          it('swap zero for one exact out partial', async () => {
            await snapshotGasCost(
              swapMath.getGasCostOfcomputeSwapStep_100d3f74(
                encodePriceSqrt(1, 1),
                encodePriceSqrt(99, 1000),
                expandTo18Decimals(2),
                1000,
                600
              )
            )
          })
        })
        */
      })
    })
    