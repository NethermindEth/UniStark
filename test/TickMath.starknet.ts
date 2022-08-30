import Decimal from 'decimal.js'
import {TickMathTest__WC__TickMathTest_compiled} from '../typechain-types'
import {expect} from 'chai';
import { getStarknetContractFactory } from 'hardhat-warp/dist/testing'
import { encodePriceSqrt, MIN_SQRT_RATIO, MAX_SQRT_RATIO } from './shared/utilities'
import BN from 'bn.js'

const MIN_TICK = -887272
const MAX_TICK = 887272

Decimal.config({ toExpNeg: -500, toExpPos: 500 })

describe('TickMath', () => {
  let tickMath: TickMathTest__WC__TickMathTest_compiled;

  beforeEach('deploy TickMathTest', async () => {
    const tickMathFactory = getStarknetContractFactory('TickMathTest')
    const contract = await tickMathFactory.deploy()
    tickMath = await (contract.deployed()) as TickMathTest__WC__TickMathTest_compiled
  })

  describe('#getSqrtRatioAtTick', () => {
    /*
    it('throws for too low', async () => {
      await expect(tickMath.getSqrtRatioAtTick_986cfba3(MIN_TICK - 1)).to.be.revertedWith('T')
    })

    it('throws for too low', async () => {
      await expect(tickMath.getSqrtRatioAtTick_986cfba3(MAX_TICK + 1)).to.be.revertedWith('T')
    })
    */
    it.only('min tick', async () => {
      expect(await tickMath.getSqrtRatioAtTick_986cfba3(MIN_TICK.toString())).to.eq('4295128739')
    })

    it.only('min tick +1', async () => {
      expect(await tickMath.getSqrtRatioAtTick_986cfba3((MIN_TICK + 1).toString())).to.eq('4295343490')
    })

    it.only('max tick - 1', async () => {
      expect(await tickMath.getSqrtRatioAtTick_986cfba3((MAX_TICK - 1).toString())).to.eq('1461373636630004318706518188784493106690254656249')
    })

    it.only('min tick ratio is less than js implementation', async () => {
      expect(await tickMath.getSqrtRatioAtTick_986cfba3(MIN_TICK)).to.be.lt(encodePriceSqrt("1", (new BN(2).pow(new BN(127))).toString()))
    })

    it.only('max tick ratio is greater than js implementation', async () => {
      expect(await tickMath.getSqrtRatioAtTick_986cfba3(MAX_TICK)).to.be.gt(encodePriceSqrt( (new BN(2).pow(new BN(127))).toString(), "1"))
    })

    it.only('max tick', async () => {
      expect(await tickMath.getSqrtRatioAtTick_986cfba3(MAX_TICK)).to.eq('1461446703485210103287273052203988822378723970342')
    })

    for (const absTick of [
      50,
      //100,
      //250,
      //500,
      //1_000,
      //2_500,
      //3_000,
      //4_000,
      //5_000,
      50_000,
      //150_000,
      //250_000,
      //500_000,
      //738_203,
    ]) {
      for (const tick of [-absTick, absTick]) {
        describe(`tick ${tick}`, () => {
          it('is at most off by 1/100th of a bips', async () => {
            const jsResult = new Decimal(1.0001).pow(tick).sqrt().mul(new Decimal(2).pow(96))
            const result = await tickMath.getSqrtRatioAtTick_986cfba3(tick.toString())
            const absDiff = new Decimal(result.toString()).sub(jsResult).abs()
            expect(absDiff.div(jsResult).toNumber()).to.be.lt(0.000001)
          })
          /*
          it('result', async () => {
            expect((await tickMath.getSqrtRatioAtTick_986cfba3(tick)).toString()).to.matchSnapshot()
          })
          
          it('gas', async () => {
            await snapshotGasCost(tickMath.getGasCostOfgetSqrtRatioAtTick_986cfba3(tick))
          })*/
        })
      }
    }
  })

  describe('#MIN_SQRT_RATIO', async () => {
    it('equals #getSqrtRatioAtTick(MIN_TICK)', async () => {
      const min = await tickMath.getSqrtRatioAtTick_986cfba3(MIN_TICK)
      expect(min).to.eq(await tickMath.MIN_SQRT_RATIO_ee8847ff())
      expect(min).to.eq(MIN_SQRT_RATIO)
    })
  })

  describe('#MAX_SQRT_RATIO', async () => {
    it('equals #getSqrtRatioAtTick(MAX_TICK)', async () => {
      const max = await tickMath.getSqrtRatioAtTick_986cfba3(MAX_TICK)
      expect(max).to.eq(await tickMath.MAX_SQRT_RATIO_6d2cc304())
      expect(max).to.eq(MAX_SQRT_RATIO)
    })
  })

  describe('#getTickAtSqrtRatio', () => {
    it('throws for too low', async () => {
      await expect(tickMath.getTickAtSqrtRatio_4f76c058((MIN_SQRT_RATIO.sub(1)).toString())).to.be.revertedWith('R')
    })

    it('throws for too high', async () => {
      await expect(tickMath.getTickAtSqrtRatio_4f76c058((MAX_SQRT_RATIO).toString())).to.be.revertedWith('R')
    })

    it('ratio of min tick', async () => {
      expect(await tickMath.getTickAtSqrtRatio_4f76c058((MIN_SQRT_RATIO).toString())).to.eq(MIN_TICK)
    })
    it('ratio of min tick + 1', async () => {
      expect(await tickMath.getTickAtSqrtRatio_4f76c058('4295343490')).to.eq(MIN_TICK + 1)
    })
    it('ratio of max tick - 1', async () => {
      expect(await tickMath.getTickAtSqrtRatio_4f76c058('1461373636630004318706518188784493106690254656249')).to.eq(MAX_TICK - 1)
    })
    it('ratio closest to max tick', async () => {
      expect(await tickMath.getTickAtSqrtRatio_4f76c058((MAX_SQRT_RATIO.sub(1)).toString())).to.eq(MAX_TICK - 1)
    })

    for (const ratio of [
      MIN_SQRT_RATIO,
      encodePriceSqrt((new BN(10).pow(new BN(12))).toString(), 1),
      encodePriceSqrt((new BN(10).pow(new BN(6))).toString(), 1),
      encodePriceSqrt(1, 64),
      encodePriceSqrt(1, 8),
      encodePriceSqrt(1, 2),
      encodePriceSqrt(1, 1),
      encodePriceSqrt(2, 1),
      encodePriceSqrt(8, 1),
      encodePriceSqrt(64, 1),
      encodePriceSqrt(1, (new BN(10).pow(new BN(6))).toString()),
      encodePriceSqrt(1, (new BN(10).pow(new BN(12))).toString()),
      MAX_SQRT_RATIO.sub(1),
    ]) {
      describe(`ratio ${ratio}`, () => {
        it('is at most off by 1', async () => {
          const jsResult = new Decimal(ratio.toString()).div(new Decimal(2).pow(96)).pow(2).log(1.0001).floor()
          const result = await tickMath.getTickAtSqrtRatio_4f76c058(ratio.toString())
          const absDiff = new Decimal(result.toString()).sub(jsResult).abs()
          expect(absDiff.toNumber()).to.be.lte(1)
        })
        /*
        it('ratio is between the tick and tick+1', async () => {
          const tick = await tickMath.getTickAtSqrtRatio_4f76c058(ratio.toString())
          const ratioOfTick = await tickMath.getSqrtRatioAtTick_986cfba3(tick.toString())
          const ratioOfTickPlusOne = await tickMath.getSqrtRatioAtTick_986cfba3((tick+ new BN(1)).toString())
          expect(ratio).to.be.gte(ratioOfTick)
          expect(ratio).to.be.lt(ratioOfTickPlusOne)
        })*/
        it('result', async () => {
          expect(await tickMath.getTickAtSqrtRatio_4f76c058(ratio.toString())).to.matchSnapshot()
        })
        /*
        it('gas', async () => {
          await snapshotGasCost(tickMath.getGasCostOfgetTickAtSqrtRatio_4f76c058(ratio))
        })*/
      })
    }
  })
})
