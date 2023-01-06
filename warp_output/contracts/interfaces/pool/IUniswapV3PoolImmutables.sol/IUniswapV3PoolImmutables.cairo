%lang starknet


// Contract Def IUniswapV3PoolImmutables

// @title Pool state that never changes
// @notice These parameters are fixed for a pool forever, i.e., the methods will always return the same values
@contract_interface
namespace IUniswapV3PoolImmutables{
func factory_c45a0155()-> (__warp_0 : felt){
}
func token0_0dfe1681()-> (__warp_1 : felt){
}
func token1_d21220a7()-> (__warp_2 : felt){
}
func fee_ddca3f43()-> (__warp_3 : felt){
}
func tickSpacing_d0c93a7c()-> (__warp_4 : felt){
}
func maxLiquidityPerTick_70cf754a()-> (__warp_5 : felt){
}
}