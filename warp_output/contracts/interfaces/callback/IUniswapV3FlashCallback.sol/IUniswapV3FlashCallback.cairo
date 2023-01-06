%lang starknet


from starkware.cairo.common.uint256 import Uint256


// Contract Def IUniswapV3FlashCallback

// @title Callback for IUniswapV3PoolActions#flash
// @notice Any contract that calls IUniswapV3PoolActions#flash must implement this interface
@contract_interface
namespace IUniswapV3FlashCallback{
func uniswapV3FlashCallback_e9cbafb0(fee0 : Uint256, fee1 : Uint256, data_len : felt, data : felt*)-> (){
}
}