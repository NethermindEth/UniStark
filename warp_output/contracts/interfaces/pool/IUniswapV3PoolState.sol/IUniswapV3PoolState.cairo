%lang starknet


from starkware.cairo.common.uint256 import Uint256


// Contract Def IUniswapV3PoolState

// @title Pool state that can change
// @notice These methods compose the pool's state, and can change with any frequency including multiple times
// per transaction
@contract_interface
namespace IUniswapV3PoolState{
func slot0_3850c7bd()-> (sqrtPriceX96 : felt, tick : felt, observationIndex : felt, observationCardinality : felt, observationCardinalityNext : felt, feeProtocol : felt, unlocked : felt){
}
func feeGrowthGlobal0X128_f3058399()-> (__warp_0 : Uint256){
}
func feeGrowthGlobal1X128_46141319()-> (__warp_1 : Uint256){
}
func protocolFees_1ad8b03b()-> (token0 : felt, token1 : felt){
}
func liquidity_1a686502()-> (__warp_2 : felt){
}
func ticks_f30dba93(tick : felt)-> (liquidityGross : felt, liquidityNet : felt, feeGrowthOutside0X128 : Uint256, feeGrowthOutside1X128 : Uint256, tickCumulativeOutside : felt, secondsPerLiquidityOutsideX128 : felt, secondsOutside : felt, initialized : felt){
}
func tickBitmap_5339c296(wordPosition : felt)-> (__warp_3 : Uint256){
}
func positions_514ea4bf(key : Uint256)-> (_liquidity : felt, feeGrowthInside0LastX128 : Uint256, feeGrowthInside1LastX128 : Uint256, tokensOwed0 : felt, tokensOwed1 : felt){
}
func observations_252c09d7(index : Uint256)-> (blockTimestamp : felt, tickCumulative : felt, secondsPerLiquidityCumulativeX128 : felt, initialized : felt){
}
}