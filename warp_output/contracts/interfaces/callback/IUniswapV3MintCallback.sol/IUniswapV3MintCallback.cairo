%lang starknet


from starkware.cairo.common.uint256 import Uint256


// Contract Def IUniswapV3MintCallback

// @title Callback for IUniswapV3PoolActions#mint
// @notice Any contract that calls IUniswapV3PoolActions#mint must implement this interface
@contract_interface
namespace IUniswapV3MintCallback{
func uniswapV3MintCallback_d3487997(amount0Owed : Uint256, amount1Owed : Uint256, data_len : felt, data : felt*)-> (){
}
}