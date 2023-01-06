%lang starknet


from starkware.cairo.common.uint256 import Uint256


// Contract Def IERC20Minimal

// @title Minimal ERC20 interface for Uniswap
// @notice Contains a subset of the full ERC20 interface that is used in Uniswap V3
@contract_interface
namespace IERC20Minimal{
func balanceOf_70a08231(account : felt)-> (__warp_0 : Uint256){
}
func transfer_a9059cbb(recipient : felt, amount : Uint256)-> (__warp_1 : felt){
}
func allowance_dd62ed3e(owner : felt, spender : felt)-> (__warp_2 : Uint256){
}
func approve_095ea7b3(spender : felt, amount : Uint256)-> (__warp_3 : felt){
}
func transferFrom_23b872dd(sender : felt, recipient : felt, amount : Uint256)-> (__warp_4 : felt){
}
}