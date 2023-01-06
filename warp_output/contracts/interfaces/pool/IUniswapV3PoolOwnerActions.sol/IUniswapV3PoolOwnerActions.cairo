%lang starknet


// Contract Def IUniswapV3PoolOwnerActions

// @title Permissioned pool actions
// @notice Contains pool methods that may only be called by the factory owner
@contract_interface
namespace IUniswapV3PoolOwnerActions{
func setFeeProtocol_8206a4d1(feeProtocol0 : felt, feeProtocol1 : felt)-> (){
}
func collectProtocol_85b66729(recipient : felt, amount0Requested : felt, amount1Requested : felt)-> (amount0 : felt, amount1 : felt){
}
}