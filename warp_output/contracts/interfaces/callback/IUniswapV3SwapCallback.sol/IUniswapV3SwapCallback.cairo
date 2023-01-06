%lang starknet


from starkware.cairo.common.uint256 import Uint256


// Contract Def IUniswapV3SwapCallback

// @title Callback for IUniswapV3PoolActions#swap
// @notice Any contract that calls IUniswapV3PoolActions#swap must implement this interface
@contract_interface
namespace IUniswapV3SwapCallback{
func uniswapV3SwapCallback_fa461e33(amount0Delta : Uint256, amount1Delta : Uint256, data_len : felt, data : felt*)-> (){
}
}