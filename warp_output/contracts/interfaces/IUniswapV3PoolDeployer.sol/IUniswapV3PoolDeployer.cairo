%lang starknet


// Contract Def IUniswapV3PoolDeployer

// @title An interface for a contract that is capable of deploying Uniswap V3 Pools
// @notice A contract that constructs a pool must implement this to pass arguments to the pool
// @dev This is used to avoid having constructor arguments in the pool contract, which results in the init code hash
// of the pool being constant allowing the CREATE2 address of the pool to be cheaply computed on-chain
@contract_interface
namespace IUniswapV3PoolDeployer{
func parameters_89035730()-> (factory : felt, token0 : felt, token1 : felt, fee : felt, tickSpacing : felt){
}
}