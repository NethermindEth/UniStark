%lang starknet


from starkware.cairo.common.uint256 import Uint256


// Contract Def IUniswapV3PoolActions

// @title Permissionless pool actions
// @notice Contains pool methods that can be called by anyone
@contract_interface
namespace IUniswapV3PoolActions{
func initialize_f637731d(sqrtPriceX96 : felt)-> (){
}
func mint_3c8a7d8d(recipient : felt, tickLower : felt, tickUpper : felt, amount : felt, data_len : felt, data : felt*)-> (amount0 : Uint256, amount1 : Uint256){
}
func collect_4f1eb3d8(recipient : felt, tickLower : felt, tickUpper : felt, amount0Requested : felt, amount1Requested : felt)-> (amount0 : felt, amount1 : felt){
}
func burn_a34123a7(tickLower : felt, tickUpper : felt, amount : felt)-> (amount0 : Uint256, amount1 : Uint256){
}
func swap_128acb08(recipient : felt, zeroForOne : felt, amountSpecified : Uint256, sqrtPriceLimitX96 : felt, data_len : felt, data : felt*)-> (amount0 : Uint256, amount1 : Uint256){
}
func flash_490e6cbc(recipient : felt, amount0 : Uint256, amount1 : Uint256, data_len : felt, data : felt*)-> (){
}
func increaseObservationCardinalityNext_32148f67(observationCardinalityNext : felt)-> (){
}
}