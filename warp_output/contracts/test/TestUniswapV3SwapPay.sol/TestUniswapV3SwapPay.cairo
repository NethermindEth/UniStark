%lang starknet


from warplib.memory import wm_read_felt, wm_read_256, wm_new
from starkware.cairo.common.uint256 import uint256_sub, uint256_add, Uint256
from starkware.cairo.common.alloc import alloc
from warplib.maths.utils import narrow_safe, felt_to_uint256
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_bool import warp_external_input_check_bool
from warplib.maths.external_input_check_ints import warp_external_input_check_int160, warp_external_input_check_int256, warp_external_input_check_int8
from starkware.cairo.common.dict import dict_write
from warplib.dynamic_arrays_util import byte_array_to_felt_value, byte_array_to_uint256_value, fixed_bytes256_to_felt_dynamic_array, felt_array_to_warp_memory_array
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from starkware.starknet.common.syscalls import get_caller_address
from warplib.maths.gt import warp_gt256


struct cd_dynarray_felt{
     len : felt ,
     ptr : felt*,
}

func wm_to_calldata0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(mem_loc: felt) -> (retData: cd_dynarray_felt){
    alloc_locals;
    let (len_256) = wm_read_256(mem_loc);
    let (ptr : felt*) = alloc();
    let (len_felt) = narrow_safe(len_256);
    wm_to_calldata1(len_felt, ptr, mem_loc + 2);
    return (cd_dynarray_felt(len=len_felt, ptr=ptr),);
}


func wm_to_calldata1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(len: felt, ptr: felt*, mem_loc: felt) -> (){
    alloc_locals;
    if (len == 0){
         return ();
    }
let (mem_read0) = wm_read_felt(mem_loc);
assert ptr[0] = mem_read0;
    wm_to_calldata1(len=len - 1, ptr=ptr + 1, mem_loc=mem_loc + 1);
    return ();
}

func extern_input_check0{range_check_ptr : felt}(len: felt, ptr : felt*) -> (){
    alloc_locals;
    if (len == 0){
        return ();
    }
warp_external_input_check_int8(ptr[0]);
   extern_input_check0(len = len - 1, ptr = ptr + 1);
    return ();
}

func cd_to_memory0_elem{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(calldata: felt*, mem_start: felt, length: felt){
    alloc_locals;
    if (length == 0){
        return ();
    }
dict_write{dict_ptr=warp_memory}(mem_start, calldata[0]);
    return cd_to_memory0_elem(calldata + 1, mem_start + 1, length - 1);
}
func cd_to_memory0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(calldata : cd_dynarray_felt) -> (mem_loc: felt){
    alloc_locals;
    let (len256) = felt_to_uint256(calldata.len);
    let (mem_start) = wm_new(len256, Uint256(0x1, 0x0));
    cd_to_memory0_elem(calldata.ptr, mem_start + 2, calldata.len);
    return (mem_start,);
}

func abi_decode0{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(mem_ptr : felt) -> (result0 : felt,result1 : Uint256,result2 : Uint256){
  alloc_locals;
  let max_index_length: felt = 96;
  let mem_index: felt = 0;
// Param 0 decoding:
let (result0 : felt) = byte_array_to_felt_value(mem_index, mem_index + 32, mem_ptr, 0);
let mem_index = mem_index + 32;
// Param 1 decoding:
let (result1 : Uint256) = byte_array_to_uint256_value(mem_index,mem_index + 32,mem_ptr,0,0);
let mem_index = mem_index + 32;
// Param 2 decoding:
let (result2 : Uint256) = byte_array_to_uint256_value(mem_index,mem_index + 32,mem_ptr,0,0);
let mem_index = mem_index + 32;
  assert max_index_length - mem_index = 0;
 return (result0 = result0,result1 = result1,result2 = result2);
}

func abi_encode0{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt, param1 : Uint256, param2 : Uint256) -> (result_ptr : felt){
  alloc_locals;
  let bytes_index : felt = 0;
  let bytes_offset : felt = 96;
  let (bytes_array : felt*) = alloc();
let (param0256) = felt_to_uint256(param0);
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param0256);
let bytes_index = bytes_index + 32;
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param1);
let bytes_index = bytes_index + 32;
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param2);
let bytes_index = bytes_index + 32;
  let (max_length256) = felt_to_uint256(bytes_offset);
  let (mem_ptr) = wm_new(max_length256, Uint256(0x1, 0x0));
  felt_array_to_warp_memory_array(0, bytes_array, 0, mem_ptr, bytes_offset);
  return (mem_ptr,);
}


// Contract Def TestUniswapV3SwapPay


namespace TestUniswapV3SwapPay{

    // Dynamic variables - Arrays and Maps

    // Static variables

}


    @external
    func swap_f13cdf90{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_pool : felt, __warp_1_recipient : felt, __warp_2_zeroForOne : felt, __warp_3_sqrtPriceX96 : felt, __warp_4_amountSpecified : Uint256, __warp_5_pay0 : Uint256, __warp_6_pay1 : Uint256)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int256(__warp_6_pay1);
        
        warp_external_input_check_int256(__warp_5_pay0);
        
        warp_external_input_check_int256(__warp_4_amountSpecified);
        
        warp_external_input_check_int160(__warp_3_sqrtPriceX96);
        
        warp_external_input_check_bool(__warp_2_zeroForOne);
        
        warp_external_input_check_address(__warp_1_recipient);
        
        warp_external_input_check_address(__warp_0_pool);
        
        let (__warp_se_0) = get_caller_address();
        
        let (__warp_se_1) = abi_encode0(__warp_se_0, __warp_5_pay0, __warp_6_pay1);
        
        let (__warp_se_2) = wm_to_calldata0(__warp_se_1);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_0_pool, __warp_1_recipient, __warp_2_zeroForOne, __warp_4_amountSpecified, __warp_3_sqrtPriceX96, __warp_se_2.len, __warp_se_2.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func uniswapV3SwapCallback_fa461e33{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_7 : Uint256, __warp_8 : Uint256, __warp_9_data_len : felt, __warp_9_data : felt*)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        extern_input_check0(__warp_9_data_len, __warp_9_data);
        
        warp_external_input_check_int256(__warp_8);
        
        warp_external_input_check_int256(__warp_7);
        
        local __warp_9_data_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_9_data_len, __warp_9_data);
        
        let (__warp_se_3) = cd_to_memory0(__warp_9_data_dstruct);
        
        let (__warp_td_0, __warp_11_pay0, __warp_12_pay1) = abi_decode0(__warp_se_3);
        
        let __warp_10_sender = __warp_td_0;
        
        let (__warp_se_4) = warp_gt256(__warp_11_pay0, Uint256(low=0, high=0));
        
            
            if (__warp_se_4 != 0){
            
                
                let (__warp_se_5) = get_caller_address();
                
                let (__warp_pse_0) = IUniswapV3Pool_warped_interface.token0_0dfe1681(__warp_se_5);
                
                let (__warp_se_6) = get_caller_address();
                
                IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_0, __warp_10_sender, __warp_se_6, __warp_11_pay0);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_7) = warp_gt256(__warp_12_pay1, Uint256(low=0, high=0));
                
                    
                    if (__warp_se_7 != 0){
                    
                        
                        let (__warp_se_8) = get_caller_address();
                        
                        let (__warp_pse_1) = IUniswapV3Pool_warped_interface.token1_d21220a7(__warp_se_8);
                        
                        let (__warp_se_9) = get_caller_address();
                        
                        IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_1, __warp_10_sender, __warp_se_9, __warp_12_pay1);
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar warp_memory = warp_memory;
                        tempvar bitwise_ptr = bitwise_ptr;
                    }else{
                    
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar warp_memory = warp_memory;
                        tempvar bitwise_ptr = bitwise_ptr;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar warp_memory = warp_memory;
                    tempvar bitwise_ptr = bitwise_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar warp_memory = warp_memory;
            tempvar bitwise_ptr = bitwise_ptr;
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;


        
        
        
        return ();

    }

@storage_var
func WARP_STORAGE(index: felt) -> (val: felt){
}
@storage_var
func WARP_USED_STORAGE() -> (val: felt){
}
@storage_var
func WARP_NAMEGEN() -> (name: felt){
}
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) -> (val: felt){
    alloc_locals;
    let (id) = WARP_STORAGE.read(loc);
    if (id == 0){
        let (id) = WARP_NAMEGEN.read();
        WARP_NAMEGEN.write(id + 1);
        WARP_STORAGE.write(loc, id + 1);
        return (id + 1,);
    }else{
        return (id,);
    }
}


// Contract Def IUniswapV3Pool@interface


@contract_interface
namespace IUniswapV3Pool_warped_interface{
func setFeeProtocol_8206a4d1(feeProtocol0 : felt, feeProtocol1 : felt)-> (){
}
func collectProtocol_85b66729(recipient : felt, amount0Requested : felt, amount1Requested : felt)-> (amount0 : felt, amount1 : felt){
}
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
func observe_883bdbfd(secondsAgos_len : felt, secondsAgos : felt*)-> (tickCumulatives_len : felt, tickCumulatives : felt*, secondsPerLiquidityCumulativeX128s_len : felt, secondsPerLiquidityCumulativeX128s : felt*){
}
func snapshotCumulativesInside_a38807f2(tickLower : felt, tickUpper : felt)-> (tickCumulativeInside : felt, secondsPerLiquidityInsideX128 : felt, secondsInside : felt){
}
func slot0_3850c7bd()-> (sqrtPriceX96 : felt, tick : felt, observationIndex : felt, observationCardinality : felt, observationCardinalityNext : felt, feeProtocol : felt, unlocked : felt){
}
func feeGrowthGlobal0X128_f3058399()-> (__warp_0 : Uint256){
}
func feeGrowthGlobal1X128_46141319()-> (__warp_1 : Uint256){
}
func protocolFees_1ad8b03b()-> (token0 : felt, token1 : felt){
}
func liquidity_1a686502()-> (__warp_2 : felt){
}
func ticks_f30dba93(tick : felt)-> (liquidityGross : felt, liquidityNet : felt, feeGrowthOutside0X128 : Uint256, feeGrowthOutside1X128 : Uint256, tickCumulativeOutside : felt, secondsPerLiquidityOutsideX128 : felt, secondsOutside : felt, initialized : felt){
}
func tickBitmap_5339c296(wordPosition : felt)-> (__warp_3 : Uint256){
}
func positions_514ea4bf(key : Uint256)-> (_liquidity : felt, feeGrowthInside0LastX128 : Uint256, feeGrowthInside1LastX128 : Uint256, tokensOwed0 : felt, tokensOwed1 : felt){
}
func observations_252c09d7(index : Uint256)-> (blockTimestamp : felt, tickCumulative : felt, secondsPerLiquidityCumulativeX128 : felt, initialized : felt){
}
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


// Contract Def IERC20Minimal@interface


@contract_interface
namespace IERC20Minimal_warped_interface{
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