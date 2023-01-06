%lang starknet


// Contract Def IUniswapV3Factory

// @title The interface for the Uniswap V3 Factory
// @notice The Uniswap V3 Factory facilitates creation of Uniswap V3 pools and control over the protocol fees
@contract_interface
namespace IUniswapV3Factory{
func owner_8da5cb5b()-> (__warp_0 : felt){
}
func feeAmountTickSpacing_22afcccb(fee : felt)-> (__warp_1 : felt){
}
func getPool_1698ee82(tokenA : felt, tokenB : felt, fee : felt)-> (pool : felt){
}
func createPool_a1671295(tokenA : felt, tokenB : felt, fee : felt)-> (pool : felt){
}
func setOwner_13af4035(_owner : felt)-> (){
}
func enableFeeAmount_8a7c195f(fee : felt, tickSpacing : felt)-> (){
}
}