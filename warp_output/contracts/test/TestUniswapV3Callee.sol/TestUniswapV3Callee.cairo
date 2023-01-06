%lang starknet


from warplib.memory import wm_read_felt, wm_read_256, wm_new, wm_to_felt_array
from starkware.cairo.common.uint256 import uint256_sub, uint256_add, Uint256
from starkware.cairo.common.alloc import alloc
from warplib.maths.utils import narrow_safe, felt_to_uint256
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int256, warp_external_input_check_int160, warp_external_input_check_int8, warp_external_input_check_int24, warp_external_input_check_int128
from starkware.cairo.common.dict import dict_write
from warplib.dynamic_arrays_util import byte_array_to_felt_value, byte_array_to_uint256_value, fixed_bytes256_to_felt_dynamic_array, felt_array_to_warp_memory_array, fixed_bytes256_to_felt_dynamic_array_spl
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.keccak import felt_array_concat, pack_bytes_felt
from starkware.starknet.common.syscalls import emit_event, get_caller_address
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from warplib.maths.negate import warp_negate256
from warplib.maths.eq import warp_eq256
from starkware.cairo.common.cairo_keccak.keccak import finalize_keccak
from warplib.maths.gt_signed import warp_gt_signed256
from warplib.maths.gt import warp_gt256
from warplib.maths.lt import warp_lt256


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

func abi_decode0{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(mem_ptr : felt) -> (result0 : felt){
  alloc_locals;
  let max_index_length: felt = 32;
  let mem_index: felt = 0;
// Param 0 decoding:
let (result0 : felt) = byte_array_to_felt_value(mem_index, mem_index + 32, mem_ptr, 0);
let mem_index = mem_index + 32;
  assert max_index_length - mem_index = 0;
 return (result0 = result0);
}

func abi_decode1{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(mem_ptr : felt) -> (result0 : felt,result1 : Uint256,result2 : Uint256){
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

func abi_encode0{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt) -> (result_ptr : felt){
  alloc_locals;
  let bytes_index : felt = 0;
  let bytes_offset : felt = 32;
  let (bytes_array : felt*) = alloc();
let (param0256) = felt_to_uint256(param0);
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param0256);
let bytes_index = bytes_index + 32;
  let (max_length256) = felt_to_uint256(bytes_offset);
  let (mem_ptr) = wm_new(max_length256, Uint256(0x1, 0x0));
  felt_array_to_warp_memory_array(0, bytes_array, 0, mem_ptr, bytes_offset);
  return (mem_ptr,);
}

func abi_encode1{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt, param1 : Uint256, param2 : Uint256) -> (result_ptr : felt){
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

func abi_encode2{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : Uint256) -> (result_ptr : felt){
  alloc_locals;
  let bytes_index : felt = 0;
  let bytes_offset : felt = 32;
  let (bytes_array : felt*) = alloc();
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param0);
let bytes_index = bytes_index + 32;
  let (max_length256) = felt_to_uint256(bytes_offset);
  let (mem_ptr) = wm_new(max_length256, Uint256(0x1, 0x0));
  felt_array_to_warp_memory_array(0, bytes_array, 0, mem_ptr, bytes_offset);
  return (mem_ptr,);
}

func abi_encode3{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : Uint256) -> (result_ptr : felt){
  alloc_locals;
  let bytes_index : felt = 0;
  let bytes_offset : felt = 32;
  let (bytes_array : felt*) = alloc();
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param0);
let bytes_index = bytes_index + 32;
  let (max_length256) = felt_to_uint256(bytes_offset);
  let (mem_ptr) = wm_new(max_length256, Uint256(0x1, 0x0));
  felt_array_to_warp_memory_array(0, bytes_array, 0, mem_ptr, bytes_offset);
  return (mem_ptr,);
}

func _emit_SwapCallback_d48241df{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : Uint256, param1 : Uint256){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x2be34bef30f2c490710087d13e66293e31ea14b693b0828dd70f434d3163559);// keccak of event signature: SwapCallback(int256,int256)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode2(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode2(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}

func _emit_MintCallback_a0968be0{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : Uint256, param1 : Uint256){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x1e2633477f9b75dd1d0e7421b45a743c2ee179332370a81d8fbcdcb0553483b);// keccak of event signature: MintCallback(uint256,uint256)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode3(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode3(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}

func _emit_FlashCallback_2b0391b4{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : Uint256, param1 : Uint256){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0xbfe0caabc998475afbbe925c2f0463cee745cd43ac5718dbb0c43543ba5e2c);// keccak of event signature: FlashCallback(uint256,uint256)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode3(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode3(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}


// Contract Def TestUniswapV3Callee


// @event
// func SwapCallback(amount0Delta : Uint256, amount1Delta : Uint256){
// }


// @event
// func MintCallback(amount0Owed : Uint256, amount1Owed : Uint256){
// }


// @event
// func FlashCallback(fee0 : Uint256, fee1 : Uint256){
// }

namespace TestUniswapV3Callee{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_uniswapV3SwapCallback_fa461e33_1{range_check_ptr : felt}(__warp_22_amount0Delta : Uint256, __warp_23_amount1Delta : Uint256)-> (__warp_rc_0 : felt, __warp_22_amount0Delta : Uint256, __warp_23_amount1Delta : Uint256){
    alloc_locals;


        
        let (__warp_se_20) = warp_eq256(__warp_22_amount0Delta, Uint256(low=0, high=0));
        
        if (__warp_se_20 != 0){
        
            
            let (__warp_se_21) = warp_eq256(__warp_23_amount1Delta, Uint256(low=0, high=0));
            
            let __warp_rc_0 = __warp_se_21;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_22_amount0Delta = __warp_22_amount0Delta;
            
            let __warp_23_amount1Delta = __warp_23_amount1Delta;
            
            
            
            return (__warp_rc_0, __warp_22_amount0Delta, __warp_23_amount1Delta);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_22_amount0Delta = __warp_22_amount0Delta;
            
            let __warp_23_amount1Delta = __warp_23_amount1Delta;
            
            
            
            return (__warp_rc_0, __warp_22_amount0Delta, __warp_23_amount1Delta);
        }

    }

    // @notice Cast a uint256 to a int256, revert on overflow
    // @param y The uint256 to be casted
    // @return z The casted integer, now type int256
    func toInt256_dfbe873b{range_check_ptr : felt}(__warp_4_y : Uint256)-> (__warp_5_z : Uint256){
    alloc_locals;


        
        let __warp_5_z = Uint256(low=0, high=0);
        
        let (__warp_se_49) = warp_lt256(__warp_4_y, Uint256(low=0, high=170141183460469231731687303715884105728));
        
        assert __warp_se_49 = 1;
        
        let __warp_5_z = __warp_4_y;
        
        
        
        return (__warp_5_z,);

    }

}


    @external
    func swapExact0For1_6dfc0ddb{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_pool : felt, __warp_1_amount0In : Uint256, __warp_2_recipient : felt, __warp_3_sqrtPriceLimitX96 : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int160(__warp_3_sqrtPriceLimitX96);
        
        warp_external_input_check_address(__warp_2_recipient);
        
        warp_external_input_check_int256(__warp_1_amount0In);
        
        warp_external_input_check_address(__warp_0_pool);
        
        let (__warp_pse_0) = TestUniswapV3Callee.toInt256_dfbe873b(__warp_1_amount0In);
        
        let (__warp_se_0) = get_caller_address();
        
        let (__warp_se_1) = abi_encode0(__warp_se_0);
        
        let (__warp_se_2) = wm_to_calldata0(__warp_se_1);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_0_pool, __warp_2_recipient, 1, __warp_pse_0, __warp_3_sqrtPriceLimitX96, __warp_se_2.len, __warp_se_2.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func swap0ForExact1_bac7bf78{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_4_pool : felt, __warp_5_amount1Out : Uint256, __warp_6_recipient : felt, __warp_7_sqrtPriceLimitX96 : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int160(__warp_7_sqrtPriceLimitX96);
        
        warp_external_input_check_address(__warp_6_recipient);
        
        warp_external_input_check_int256(__warp_5_amount1Out);
        
        warp_external_input_check_address(__warp_4_pool);
        
        let (__warp_pse_1) = TestUniswapV3Callee.toInt256_dfbe873b(__warp_5_amount1Out);
        
        let (__warp_se_3) = warp_negate256(__warp_pse_1);
        
        let (__warp_se_4) = get_caller_address();
        
        let (__warp_se_5) = abi_encode0(__warp_se_4);
        
        let (__warp_se_6) = wm_to_calldata0(__warp_se_5);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_4_pool, __warp_6_recipient, 1, __warp_se_3, __warp_7_sqrtPriceLimitX96, __warp_se_6.len, __warp_se_6.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func swapExact1For0_e2be9109{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_8_pool : felt, __warp_9_amount1In : Uint256, __warp_10_recipient : felt, __warp_11_sqrtPriceLimitX96 : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int160(__warp_11_sqrtPriceLimitX96);
        
        warp_external_input_check_address(__warp_10_recipient);
        
        warp_external_input_check_int256(__warp_9_amount1In);
        
        warp_external_input_check_address(__warp_8_pool);
        
        let (__warp_pse_2) = TestUniswapV3Callee.toInt256_dfbe873b(__warp_9_amount1In);
        
        let (__warp_se_7) = get_caller_address();
        
        let (__warp_se_8) = abi_encode0(__warp_se_7);
        
        let (__warp_se_9) = wm_to_calldata0(__warp_se_8);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_8_pool, __warp_10_recipient, 0, __warp_pse_2, __warp_11_sqrtPriceLimitX96, __warp_se_9.len, __warp_se_9.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func swap1ForExact0_f603482c{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_pool : felt, __warp_13_amount0Out : Uint256, __warp_14_recipient : felt, __warp_15_sqrtPriceLimitX96 : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int160(__warp_15_sqrtPriceLimitX96);
        
        warp_external_input_check_address(__warp_14_recipient);
        
        warp_external_input_check_int256(__warp_13_amount0Out);
        
        warp_external_input_check_address(__warp_12_pool);
        
        let (__warp_pse_3) = TestUniswapV3Callee.toInt256_dfbe873b(__warp_13_amount0Out);
        
        let (__warp_se_10) = warp_negate256(__warp_pse_3);
        
        let (__warp_se_11) = get_caller_address();
        
        let (__warp_se_12) = abi_encode0(__warp_se_11);
        
        let (__warp_se_13) = wm_to_calldata0(__warp_se_12);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_12_pool, __warp_14_recipient, 0, __warp_se_10, __warp_15_sqrtPriceLimitX96, __warp_se_13.len, __warp_se_13.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func swapToLowerSqrtPrice_2ec20bf9{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_16_pool : felt, __warp_17_sqrtPriceX96 : felt, __warp_18_recipient : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_address(__warp_18_recipient);
        
        warp_external_input_check_int160(__warp_17_sqrtPriceX96);
        
        warp_external_input_check_address(__warp_16_pool);
        
        let (__warp_se_14) = get_caller_address();
        
        let (__warp_se_15) = abi_encode0(__warp_se_14);
        
        let (__warp_se_16) = wm_to_calldata0(__warp_se_15);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_16_pool, __warp_18_recipient, 1, Uint256(low=340282366920938463463374607431768211455, high=170141183460469231731687303715884105727), __warp_17_sqrtPriceX96, __warp_se_16.len, __warp_se_16.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func swapToHigherSqrtPrice_9e77b805{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_19_pool : felt, __warp_20_sqrtPriceX96 : felt, __warp_21_recipient : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_address(__warp_21_recipient);
        
        warp_external_input_check_int160(__warp_20_sqrtPriceX96);
        
        warp_external_input_check_address(__warp_19_pool);
        
        let (__warp_se_17) = get_caller_address();
        
        let (__warp_se_18) = abi_encode0(__warp_se_17);
        
        let (__warp_se_19) = wm_to_calldata0(__warp_se_18);
        
        IUniswapV3Pool_warped_interface.swap_128acb08(__warp_19_pool, __warp_21_recipient, 0, Uint256(low=340282366920938463463374607431768211455, high=170141183460469231731687303715884105727), __warp_20_sqrtPriceX96, __warp_se_19.len, __warp_se_19.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func uniswapV3SwapCallback_fa461e33{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_22_amount0Delta : Uint256, __warp_23_amount1Delta : Uint256, __warp_24_data_len : felt, __warp_24_data : felt*)-> (){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        extern_input_check0(__warp_24_data_len, __warp_24_data);
        
        warp_external_input_check_int256(__warp_23_amount1Delta);
        
        warp_external_input_check_int256(__warp_22_amount0Delta);
        
        local __warp_24_data_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_24_data_len, __warp_24_data);
        
        let (__warp_se_22) = cd_to_memory0(__warp_24_data_dstruct);
        
        let (__warp_25_sender) = abi_decode0(__warp_se_22);
        
        _emit_SwapCallback_d48241df(__warp_22_amount0Delta, __warp_23_amount1Delta);
        
        let (__warp_se_23) = warp_gt_signed256(__warp_22_amount0Delta, Uint256(low=0, high=0));
        
            
            if (__warp_se_23 != 0){
            
                
                let (__warp_se_24) = get_caller_address();
                
                let (__warp_pse_4) = IUniswapV3Pool_warped_interface.token0_0dfe1681(__warp_se_24);
                
                let (__warp_se_25) = get_caller_address();
                
                IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_4, __warp_25_sender, __warp_se_25, __warp_22_amount0Delta);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
            }else{
            
                
                let (__warp_se_26) = warp_gt_signed256(__warp_23_amount1Delta, Uint256(low=0, high=0));
                
                    
                    if (__warp_se_26 != 0){
                    
                        
                        let (__warp_se_27) = get_caller_address();
                        
                        let (__warp_pse_5) = IUniswapV3Pool_warped_interface.token1_d21220a7(__warp_se_27);
                        
                        let (__warp_se_28) = get_caller_address();
                        
                        IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_5, __warp_25_sender, __warp_se_28, __warp_23_amount1Delta);
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar warp_memory = warp_memory;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar keccak_ptr = keccak_ptr;
                    }else{
                    
                        
                        let __warp_rc_0 = 0;
                        
                            
                            let (__warp_tv_0, __warp_tv_1, __warp_tv_2) = TestUniswapV3Callee.__warp_conditional_uniswapV3SwapCallback_fa461e33_1(__warp_22_amount0Delta, __warp_23_amount1Delta);
                            
                            let __warp_23_amount1Delta = __warp_tv_2;
                            
                            let __warp_22_amount0Delta = __warp_tv_1;
                            
                            let __warp_rc_0 = __warp_tv_0;
                        
                        assert __warp_rc_0 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar warp_memory = warp_memory;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar keccak_ptr = keccak_ptr;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar warp_memory = warp_memory;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar keccak_ptr = keccak_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar warp_memory = warp_memory;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar keccak_ptr = keccak_ptr;
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return ();
    }
    }


    @external
    func mint_7b4f5327{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_26_pool : felt, __warp_27_recipient : felt, __warp_28_tickLower : felt, __warp_29_tickUpper : felt, __warp_30_amount : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int128(__warp_30_amount);
        
        warp_external_input_check_int24(__warp_29_tickUpper);
        
        warp_external_input_check_int24(__warp_28_tickLower);
        
        warp_external_input_check_address(__warp_27_recipient);
        
        warp_external_input_check_address(__warp_26_pool);
        
        let (__warp_se_29) = get_caller_address();
        
        let (__warp_se_30) = abi_encode0(__warp_se_29);
        
        let (__warp_se_31) = wm_to_calldata0(__warp_se_30);
        
        IUniswapV3Pool_warped_interface.mint_3c8a7d8d(__warp_26_pool, __warp_27_recipient, __warp_28_tickLower, __warp_29_tickUpper, __warp_30_amount, __warp_se_31.len, __warp_se_31.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func uniswapV3MintCallback_d3487997{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_31_amount0Owed : Uint256, __warp_32_amount1Owed : Uint256, __warp_33_data_len : felt, __warp_33_data : felt*)-> (){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        extern_input_check0(__warp_33_data_len, __warp_33_data);
        
        warp_external_input_check_int256(__warp_32_amount1Owed);
        
        warp_external_input_check_int256(__warp_31_amount0Owed);
        
        local __warp_33_data_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_33_data_len, __warp_33_data);
        
        let (__warp_se_32) = cd_to_memory0(__warp_33_data_dstruct);
        
        let (__warp_34_sender) = abi_decode0(__warp_se_32);
        
        _emit_MintCallback_a0968be0(__warp_31_amount0Owed, __warp_32_amount1Owed);
        
        let (__warp_se_33) = warp_gt256(__warp_31_amount0Owed, Uint256(low=0, high=0));
        
            
            if (__warp_se_33 != 0){
            
                
                let (__warp_se_34) = get_caller_address();
                
                let (__warp_pse_6) = IUniswapV3Pool_warped_interface.token0_0dfe1681(__warp_se_34);
                
                let (__warp_se_35) = get_caller_address();
                
                IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_6, __warp_34_sender, __warp_se_35, __warp_31_amount0Owed);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
                tempvar __warp_34_sender = __warp_34_sender;
                tempvar __warp_32_amount1Owed = __warp_32_amount1Owed;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
                tempvar __warp_34_sender = __warp_34_sender;
                tempvar __warp_32_amount1Owed = __warp_32_amount1Owed;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar warp_memory = warp_memory;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar keccak_ptr = keccak_ptr;
            tempvar __warp_34_sender = __warp_34_sender;
            tempvar __warp_32_amount1Owed = __warp_32_amount1Owed;
        
        let (__warp_se_36) = warp_gt256(__warp_32_amount1Owed, Uint256(low=0, high=0));
        
            
            if (__warp_se_36 != 0){
            
                
                let (__warp_se_37) = get_caller_address();
                
                let (__warp_pse_7) = IUniswapV3Pool_warped_interface.token1_d21220a7(__warp_se_37);
                
                let (__warp_se_38) = get_caller_address();
                
                IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_7, __warp_34_sender, __warp_se_38, __warp_32_amount1Owed);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar warp_memory = warp_memory;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar keccak_ptr = keccak_ptr;
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return ();
    }
    }


    @external
    func flash_034b0f8f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_35_pool : felt, __warp_36_recipient : felt, __warp_37_amount0 : Uint256, __warp_38_amount1 : Uint256, __warp_39_pay0 : Uint256, __warp_40_pay1 : Uint256)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int256(__warp_40_pay1);
        
        warp_external_input_check_int256(__warp_39_pay0);
        
        warp_external_input_check_int256(__warp_38_amount1);
        
        warp_external_input_check_int256(__warp_37_amount0);
        
        warp_external_input_check_address(__warp_36_recipient);
        
        warp_external_input_check_address(__warp_35_pool);
        
        let (__warp_se_39) = get_caller_address();
        
        let (__warp_se_40) = abi_encode1(__warp_se_39, __warp_39_pay0, __warp_40_pay1);
        
        let (__warp_se_41) = wm_to_calldata0(__warp_se_40);
        
        IUniswapV3Pool_warped_interface.flash_490e6cbc(__warp_35_pool, __warp_36_recipient, __warp_37_amount0, __warp_38_amount1, __warp_se_41.len, __warp_se_41.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func uniswapV3FlashCallback_e9cbafb0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_41_fee0 : Uint256, __warp_42_fee1 : Uint256, __warp_43_data_len : felt, __warp_43_data : felt*)-> (){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        extern_input_check0(__warp_43_data_len, __warp_43_data);
        
        warp_external_input_check_int256(__warp_42_fee1);
        
        warp_external_input_check_int256(__warp_41_fee0);
        
        local __warp_43_data_dstruct : cd_dynarray_felt = cd_dynarray_felt(__warp_43_data_len, __warp_43_data);
        
        _emit_FlashCallback_2b0391b4(__warp_41_fee0, __warp_42_fee1);
        
        let (__warp_se_42) = cd_to_memory0(__warp_43_data_dstruct);
        
        let (__warp_td_0, __warp_45_pay0, __warp_46_pay1) = abi_decode1(__warp_se_42);
        
        let __warp_44_sender = __warp_td_0;
        
        let (__warp_se_43) = warp_gt256(__warp_45_pay0, Uint256(low=0, high=0));
        
            
            if (__warp_se_43 != 0){
            
                
                let (__warp_se_44) = get_caller_address();
                
                let (__warp_pse_8) = IUniswapV3Pool_warped_interface.token0_0dfe1681(__warp_se_44);
                
                let (__warp_se_45) = get_caller_address();
                
                IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_8, __warp_44_sender, __warp_se_45, __warp_45_pay0);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar warp_memory = warp_memory;
                tempvar keccak_ptr = keccak_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_44_sender = __warp_44_sender;
                tempvar __warp_46_pay1 = __warp_46_pay1;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar warp_memory = warp_memory;
                tempvar keccak_ptr = keccak_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_44_sender = __warp_44_sender;
                tempvar __warp_46_pay1 = __warp_46_pay1;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar warp_memory = warp_memory;
            tempvar keccak_ptr = keccak_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar __warp_44_sender = __warp_44_sender;
            tempvar __warp_46_pay1 = __warp_46_pay1;
        
        let (__warp_se_46) = warp_gt256(__warp_46_pay1, Uint256(low=0, high=0));
        
            
            if (__warp_se_46 != 0){
            
                
                let (__warp_se_47) = get_caller_address();
                
                let (__warp_pse_9) = IUniswapV3Pool_warped_interface.token1_d21220a7(__warp_se_47);
                
                let (__warp_se_48) = get_caller_address();
                
                IERC20Minimal_warped_interface.transferFrom_23b872dd(__warp_pse_9, __warp_44_sender, __warp_se_48, __warp_46_pay1);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar warp_memory = warp_memory;
                tempvar keccak_ptr = keccak_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar warp_memory = warp_memory;
                tempvar keccak_ptr = keccak_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar warp_memory = warp_memory;
            tempvar keccak_ptr = keccak_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
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