%lang starknet


// Contract Def IUniswapV3PoolDerivedState

// @title Pool state that is not stored
// @notice Contains view functions to provide information about the pool that is computed rather than stored on the
// blockchain. The functions here may have variable gas costs.
@contract_interface
namespace IUniswapV3PoolDerivedState{
func observe_883bdbfd(secondsAgos_len : felt, secondsAgos : felt*)-> (tickCumulatives_len : felt, tickCumulatives : felt*, secondsPerLiquidityCumulativeX128s_len : felt, secondsPerLiquidityCumulativeX128s : felt*){
}
func snapshotCumulativesInside_a38807f2(tickLower : felt, tickUpper : felt)-> (tickCumulativeInside : felt, secondsPerLiquidityInsideX128 : felt, secondsInside : felt){
}
}