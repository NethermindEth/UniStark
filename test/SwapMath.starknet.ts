import { SwapMathTest__WC__SwapMathTest_compiled } from "../typechain-types";
import {expect} from 'chai';
import { getStarknetContractFactory } from 'hardhat-warp/dist/testing'
import BN = require('bn.js')
import { encodePriceSqrt, expandTo18Decimals } from './shared/utilities'
import { SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled } from "../typechain-types/SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled";
import { Uint256 } from "../typechain-types/BitMathTest__WC__BitMathTest_compiled";
import { BigNumber } from 'ethers'

describe('swapMath', () => {
    let swapMath: SwapMathTest__WC__SwapMathTest_compiled;
    let sqrtPriceMath: SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled
    beforeEach('deploy SwapMathTest', async () => {
        const swapMathFactory = getStarknetContractFactory('SwapMathTest');
        let contract = await swapMathFactory.deploy()
        swapMath = contract as SwapMathTest__WC__SwapMathTest_compiled;
        const sqrtPriceMathFactory = getStarknetContractFactory('SqrtPriceMathTest');
        contract = await sqrtPriceMathFactory.deploy()
        sqrtPriceMath = contract as SqrtPriceMathTest__WC__SqrtPriceMathTest_compiled;
    })

    describe('#computeSwapStep', () => {
        it.only('exact amount in that gets capped at price target in one for zero', async () => {
          const price = encodePriceSqrt(1, 1)
          const priceTarget = encodePriceSqrt(101, 100)
          const liquidity = expandTo18Decimals(2)
          const amount = expandTo18Decimals(1)
          const fee = 600
          const zeroForOne = false
    
          
          const results = await swapMath.computeSwapStep_100d3f74(
            price.toString(),
            priceTarget.toString(),
            liquidity.toString(),
            {low: 0, high: amount.toNumber()},
            fee.toString()
          )
          const sqrtQ = results[0];
          const amountIn = results[1];
          const amountOut = results[2];
          const feeAmount = results[3];
    
          expect(amountIn.toString()).to.eq('9975124224178055')
          expect(feeAmount.toString()).to.eq('5988667735148')
          expect(amountOut.toString()).to.eq('9925619580021728')
          //expect((amountIn.add(feeAmount)).toString(), 'entire amount is not used').to.lt(amount.toString())
    
          const priceAfterWholeInputAmount = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
            price.toString(),
            liquidity.toString(),
            {low: 0, high: amount.toNumber()},
            zeroForOne.toString()
          )
    
          expect(sqrtQ.toString(), 'price is capped at price target').to.eq(priceTarget.toString())
          expect(sqrtQ.toNumber(), 'price is less than price after whole input amount').to.lt(priceAfterWholeInputAmount[0].toNumber())
        })
        
    
        it('exact amount out that gets capped at price target in one for zero', async () => {
          const price = encodePriceSqrt(1, 1)
          const priceTarget = encodePriceSqrt(101, 100)
          const liquidity = expandTo18Decimals(2)
          const amount = expandTo18Decimals(1).mul(-1)
          const fee = 600
          const zeroForOne = false
  
          const results = await swapMath.computeSwapStep_100d3f74(
            price.toString(),
            priceTarget.toString(),
            liquidity.toString(),
            {low: 0, high: amount.toNumber()},
            fee.toString()
          )
          const sqrtQ = results[0];
          const amountIn = results[1];
          const amountOut = results[2];
          const feeAmount = results[3];
    
          expect(amountIn.toString()).to.eq('9975124224178055')
          expect(feeAmount.toString()).to.eq('5988667735148')
          expect(amountOut.toString()).to.eq('9925619580021728')
          expect(amountOut.toString(), 'entire amount out is not returned').to.lt(amount.mul(-1))
    
          const priceAfterWholeOutputAmount = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
            price.toString(),
            liquidity.toString(),
            {low: 0, high: amount.toNumber()},
            zeroForOne.toString()
          )
    
          expect(sqrtQ.toString(), 'price is capped at price target').to.eq(priceTarget.toString())
          expect(sqrtQ.toNumber(), 'price is less than price after whole output amount').to.lt(priceAfterWholeOutputAmount[0].toNumber())
        })
    
        it('exact amount in that is fully spent in one for zero', async () => {
          const price = encodePriceSqrt(1, 1)
          const priceTarget = encodePriceSqrt(1000, 100)
          const liquidity = expandTo18Decimals(2)
          const amount = expandTo18Decimals(1)
          const fee = 600
          const zeroForOne = false
    
          const results = await swapMath.computeSwapStep_100d3f74(
            price.toString(),
            priceTarget.toString(),
            liquidity.toString(),
            {low: 0, high: amount.toNumber()},
            fee.toString()
          )
          const sqrtQ = results[0];
          const amountIn = results[1];
          const amountOut = results[2];
          const feeAmount = results[3];
    
          expect(amountIn.toString()).to.eq('999400000000000000')
          expect(feeAmount.toString()).to.eq('600000000000000')
          expect(amountOut.toString()).to.eq('666399946655997866')
          //expect(amountIn.add(feeAmount), 'entire amount is used').to.eq(amount)
    
          const priceAfterWholeInputAmountLessFee = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
            price.toString(),
            liquidity.toString(),
            { low:0, high : amount.sub(feeAmount)},
            zeroForOne.toString()
          )
    
          expect(sqrtQ.toNumber(), 'price does not reach price target').to.be.lt(priceTarget.toNumber())
          expect(sqrtQ.toString(), 'price is equal to price after whole input amount').to.eq(priceAfterWholeInputAmountLessFee[0].toString())
        })
    /*
        it('exact amount out that is fully received in one for zero', async () => {
          const price = encodePriceSqrt(1, 1)
          const priceTarget = encodePriceSqrt(10000, 100)
          const liquidity = expandTo18Decimals(2)
          const amount = expandTo18Decimals(1).mul(-1)
          const fee = 600
          const zeroForOne = false
    
          const { amountIn, amountOut, sqrtQ, feeAmount } = await swapMath.computeSwapStep_100d3f74(
            price,
            priceTarget,
            liquidity,
            amount,
            fee
          )
    
          expect(amountIn).to.eq('2000000000000000000')
          expect(feeAmount).to.eq('1200720432259356')
          expect(amountOut).to.eq(amount.mul(-1))
    
          const priceAfterWholeOutputAmount = await sqrtPriceMath.getNextSqrtPriceFromInput_aa58276a(
            price,
            liquidity,
            amount.mul(-1),
            zeroForOne
          )
    
          expect(sqrtQ, 'price does not reach price target').to.be.lt(priceTarget)
          expect(sqrtQ, 'price is less than price after whole output amount').to.eq(priceAfterWholeOutputAmount)
        })
    
        it('amount out is capped at the desired amount out', async () => {
          const { amountIn, amountOut, sqrtQ, feeAmount } = await swapMath.computeSwapStep_100d3f74(
            BigNumber.from('417332158212080721273783715441582'),
            BigNumber.from('1452870262520218020823638996'),
            '159344665391607089467575320103',
            '-1',
            1
          )
          expect(amountIn).to.eq('1')
          expect(feeAmount).to.eq('1')
          expect(amountOut).to.eq('1') // would be 2 if not capped
          expect(sqrtQ).to.eq('417332158212080721273783715441581')
        })
    
        it('target price of 1 uses partial input amount', async () => {
          const { amountIn, amountOut, sqrtQ, feeAmount } = await swapMath.computeSwapStep_100d3f74(
            BigNumber.from('2'),
            BigNumber.from('1'),
            '1',
            '3915081100057732413702495386755767',
            1
          )
          expect(amountIn).to.eq('39614081257132168796771975168')
          expect(feeAmount).to.eq('39614120871253040049813')
          expect(amountIn.add(feeAmount)).to.be.lte('3915081100057732413702495386755767')
          expect(amountOut).to.eq('0')
          expect(sqrtQ).to.eq('1')
        })
    
        it('entire input amount taken as fee', async () => {
          const { amountIn, amountOut, sqrtQ, feeAmount } = await swapMath.computeSwapStep_100d3f74(
            '2413',
            '79887613182836312',
            '1985041575832132834610021537970',
            '10',
            1872
          )
          expect(amountIn).to.eq('0')
          expect(feeAmount).to.eq('10')
          expect(amountOut).to.eq('0')
          expect(sqrtQ).to.eq('2413')
        })
    
        it('handles intermediate insufficient liquidity in zero for one exact output case', async () => {
          const sqrtP = BigNumber.from('20282409603651670423947251286016')
          const sqrtPTarget = sqrtP.mul(11).div(10)
          const liquidity = 1024
          // virtual reserves of one are only 4
          // https://www.wolframalpha.com/input/?i=1024+%2F+%2820282409603651670423947251286016+%2F+2**96%29
          const amountRemaining = -4
          const feePips = 3000
          const { amountIn, amountOut, sqrtQ, feeAmount } = await swapMath.computeSwapStep_100d3f74(
            sqrtP,
            sqrtPTarget,
            liquidity,
            amountRemaining,
            feePips
          )
          expect(amountOut).to.eq(0)
          expect(sqrtQ).to.eq(sqrtPTarget)
          expect(amountIn).to.eq(26215)
          expect(feeAmount).to.eq(79)
        })
    
        it('handles intermediate insufficient liquidity in one for zero exact output case', async () => {
          const sqrtP = BigNumber.from('20282409603651670423947251286016')
          const sqrtPTarget = sqrtP.mul(9).div(10)
          const liquidity = 1024
          // virtual reserves of zero are only 262144
          // https://www.wolframalpha.com/input/?i=1024+*+%2820282409603651670423947251286016+%2F+2**96%29
          const amountRemaining = -263000
          const feePips = 3000
          const { amountIn, amountOut, sqrtQ, feeAmount } = await swapMath.computeSwapStep_100d3f74(
            sqrtP,
            sqrtPTarget,
            liquidity,
            amountRemaining,
            feePips
          )
          expect(amountOut).to.eq(26214)
          expect(sqrtQ).to.eq(sqrtPTarget)
          expect(amountIn).to.eq(1)
          expect(feeAmount).to.eq(1)
        })
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
    