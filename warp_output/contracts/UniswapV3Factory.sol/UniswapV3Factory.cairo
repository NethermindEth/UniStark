%lang starknet


from warplib.memory import wm_alloc, wm_new, wm_to_felt_array
from starkware.cairo.common.dict import dict_write, dict_read
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.uint256 import Uint256
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int24
from warplib.dynamic_arrays_util import fixed_bytes256_to_felt_dynamic_array, felt_array_to_warp_memory_array, fixed_bytes256_to_felt_dynamic_array_spl
from warplib.maths.utils import felt_to_uint256
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.keccak import felt_array_concat, pack_bytes_felt, warp_keccak
from starkware.starknet.common.syscalls import emit_event, get_contract_address, get_caller_address, deploy
from warplib.maths.neq import warp_neq
from warplib.maths.lt import warp_lt
from warplib.maths.eq import warp_eq
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from starkware.cairo.common.cairo_keccak.keccak import finalize_keccak
from warplib.maths.gt_signed import warp_gt_signed24
from warplib.maths.lt_signed import warp_lt_signed24
from warplib.maths.bytes_conversions import warp_bytes_narrow_256


// @declare contracts/UniswapV3Pool.sol/UniswapV3Pool.cairo
const UniswapV3Pool_class_hash_a55bb112 = 0;


struct Parameters_01070596{
    factory : felt,
    token0 : felt,
    token1 : felt,
    fee : felt,
    tickSpacing : felt,
}


struct cd_dynarray_felt{
     len : felt ,
     ptr : felt*,
}

func WM0_struct_Parameters_01070596{range_check_ptr, warp_memory: DictAccess*}(member_factory: felt, member_token0: felt, member_token1: felt, member_fee: felt, member_tickSpacing: felt) -> (res:felt){
    alloc_locals;
    let (start) = wm_alloc(Uint256(0x5, 0x0));
dict_write{dict_ptr=warp_memory}(start, member_factory);
dict_write{dict_ptr=warp_memory}(start + 1, member_token0);
dict_write{dict_ptr=warp_memory}(start + 2, member_token1);
dict_write{dict_ptr=warp_memory}(start + 3, member_fee);
dict_write{dict_ptr=warp_memory}(start + 4, member_tickSpacing);
    return (start,);
}

func wm_to_storage0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(loc : felt, mem_loc: felt) -> (loc: felt){
    alloc_locals;
let (elem_mem_loc_0) = dict_read{dict_ptr=warp_memory}(mem_loc);
WARP_STORAGE.write(loc, elem_mem_loc_0);
let (elem_mem_loc_1) = dict_read{dict_ptr=warp_memory}(mem_loc + 1);
WARP_STORAGE.write(loc + 1, elem_mem_loc_1);
let (elem_mem_loc_2) = dict_read{dict_ptr=warp_memory}(mem_loc + 2);
WARP_STORAGE.write(loc + 2, elem_mem_loc_2);
let (elem_mem_loc_3) = dict_read{dict_ptr=warp_memory}(mem_loc + 3);
WARP_STORAGE.write(loc + 3, elem_mem_loc_3);
let (elem_mem_loc_4) = dict_read{dict_ptr=warp_memory}(mem_loc + 4);
WARP_STORAGE.write(loc + 4, elem_mem_loc_4);
    return (loc,);
}

func WS_STRUCT_Parameters_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc : felt){
   alloc_locals;
    WS1_DELETE(loc);
    WS1_DELETE(loc + 1);
    WS1_DELETE(loc + 2);
    WS2_DELETE(loc + 3);
    WS3_DELETE(loc + 4);
   return ();
}

func WS1_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS2_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS3_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WSM0_Parameters_01070596_factory(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM1_Parameters_01070596_token0(loc: felt) -> (memberLoc: felt){
    return (loc + 1,);
}

func WSM2_Parameters_01070596_token1(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM3_Parameters_01070596_fee(loc: felt) -> (memberLoc: felt){
    return (loc + 3,);
}

func WSM4_Parameters_01070596_tickSpacing(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WS0_READ_warp_id{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = readId(loc);
    return (read0,);
}

func WS1_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}

func abi_encode0{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt, param1 : felt, param2 : felt) -> (result_ptr : felt){
  alloc_locals;
  let bytes_index : felt = 0;
  let bytes_offset : felt = 96;
  let (bytes_array : felt*) = alloc();
let (param0256) = felt_to_uint256(param0);
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param0256);
let bytes_index = bytes_index + 32;
let (param1256) = felt_to_uint256(param1);
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param1256);
let bytes_index = bytes_index + 32;
let (param2256) = felt_to_uint256(param2);
fixed_bytes256_to_felt_dynamic_array(bytes_index, bytes_array, 0, param2256);
let bytes_index = bytes_index + 32;
  let (max_length256) = felt_to_uint256(bytes_offset);
  let (mem_ptr) = wm_new(max_length256, Uint256(0x1, 0x0));
  felt_array_to_warp_memory_array(0, bytes_array, 0, mem_ptr, bytes_offset);
  return (mem_ptr,);
}

func abi_encode1{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt) -> (result_ptr : felt){
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

func abi_encode2{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt) -> (result_ptr : felt){
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

func abi_encode3{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : felt) -> (result_ptr : felt){
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

func _emit_PoolCreated_783cca1c{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : felt, param1 : felt, param2 : felt, param3 : felt, param4 : felt){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x2a3dabd424bcc432772a818d8ad071c4c66c172c7a2542c488b85faf0603e62);// keccak of event signature: PoolCreated(address,address,uint24,int24,address)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode1(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode1(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode2(param2);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode3(param3);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode1(param4);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}

func _emit_OwnerChanged_b532073b{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : felt, param1 : felt){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x84a75ec711ce260f593608b0730fc343ba44826ccaa0ae0d267b4957afdda2);// keccak of event signature: OwnerChanged(address,address)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode1(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode1(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}

func _emit_FeeAmountEnabled_c66a3fdf{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : felt, param1 : felt){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x2d2b6e2b303180c552a382cd4f836e05c3c6c24823d5b847233383cd537e5c3);// keccak of event signature: FeeAmountEnabled(uint24,int24)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode2(param0);
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

func encode_as_felt0() -> (calldata_array : cd_dynarray_felt){
   alloc_locals;
   let total_size : felt = 0;
   let (decode_array : felt*) = alloc();
   let result = cd_dynarray_felt(total_size, decode_array);
   return (result,);
}

@storage_var
func WARP_MAPPING0(name: felt, index: felt) -> (resLoc : felt){
}
func WS0_INDEX_felt_to_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING0.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 1);
        WARP_MAPPING0.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

@storage_var
func WARP_MAPPING1(name: felt, index: felt) -> (resLoc : felt){
}
func WS1_INDEX_felt_to_warp_id{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING1.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 1);
        WARP_MAPPING1.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}


// Contract Def UniswapV3Factory

// @title Canonical Uniswap V3 factory
// @notice Deploys Uniswap V3 pools and manages ownership and control over pool protocol fees

// @notice Emitted when a new fee amount is enabled for pool creation via the factory
// @param fee The enabled fee, denominated in hundredths of a bip
// @param tickSpacing The minimum number of ticks between initialized ticks for pools created with the given fee
// @event
// func FeeAmountEnabled(fee : felt, tickSpacing : felt){
// }

// @notice Emitted when a pool is created
// @param token0 The first token of the pool by address sort order
// @param token1 The second token of the pool by address sort order
// @param fee The fee collected upon every swap in the pool, denominated in hundredths of a bip
// @param tickSpacing The minimum number of ticks between initialized ticks
// @param pool The address of the created pool
// @event
// func PoolCreated(token0 : felt, token1 : felt, fee : felt, tickSpacing : felt, pool : felt){
// }

// @notice Emitted when the owner of the factory is changed
// @param oldOwner The owner before the owner was changed
// @param newOwner The owner after the owner was changed
// @event
// func OwnerChanged(oldOwner : felt, newOwner : felt){
// }

namespace UniswapV3Factory{

    // Dynamic variables - Arrays and Maps

    const __warp_1_feeAmountTickSpacing = 1;

    const __warp_2_getPool = 2;

    // Static variables

    const __warp_0_owner = 0;

    const __warp_0_parameters = 3;

    const __warp_0_original = 8;


    func __warp_modifier_noDelegateCall_createPool_a1671295_6{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*, keccak_ptr : felt*}(__warp_parameter___warp_3_tokenA1 : felt, __warp_parameter___warp_4_tokenB2 : felt, __warp_parameter___warp_5_fee3 : felt, __warp_parameter___warp_6_pool_m_capture4 : felt)-> (__warp_ret_parameter___warp_6_pool5 : felt){
    alloc_locals;


        
        let __warp_ret_parameter___warp_6_pool5 = 0;
        
        checkNotDelegateCall_8233c275();
        
        let (__warp_pse_0) = __warp_original_function_createPool_a1671295_0(__warp_parameter___warp_3_tokenA1, __warp_parameter___warp_4_tokenB2, __warp_parameter___warp_5_fee3, __warp_parameter___warp_6_pool_m_capture4);
        
        let __warp_ret_parameter___warp_6_pool5 = __warp_pse_0;
        
        
        
        return (__warp_ret_parameter___warp_6_pool5,);

    }

    // @inheritdoc IUniswapV3Factory
    func __warp_original_function_createPool_a1671295_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*, keccak_ptr : felt*}(__warp_3_tokenA : felt, __warp_4_tokenB : felt, __warp_5_fee : felt, __warp_6_pool_m_capture : felt)-> (__warp_6_pool : felt){
    alloc_locals;


        
        let __warp_6_pool = 0;
        
        let __warp_6_pool = __warp_6_pool_m_capture;
        
        let (__warp_se_0) = warp_neq(__warp_3_tokenA, __warp_4_tokenB);
        
        assert __warp_se_0 = 1;
        
        let __warp_7_token0 = __warp_4_tokenB;
        
        let __warp_8_token1 = __warp_3_tokenA;
        
        let (__warp_se_1) = warp_lt(__warp_3_tokenA, __warp_4_tokenB);
        
            
            if (__warp_se_1 != 0){
            
                
                    
                    let __warp_tv_0 = __warp_3_tokenA;
                    
                    let __warp_tv_1 = __warp_4_tokenB;
                    
                    let __warp_8_token1 = __warp_tv_1;
                    
                    let __warp_7_token0 = __warp_tv_0;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
                tempvar __warp_6_pool = __warp_6_pool;
                tempvar __warp_7_token0 = __warp_7_token0;
                tempvar __warp_8_token1 = __warp_8_token1;
                tempvar __warp_5_fee = __warp_5_fee;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar keccak_ptr = keccak_ptr;
                tempvar __warp_6_pool = __warp_6_pool;
                tempvar __warp_7_token0 = __warp_7_token0;
                tempvar __warp_8_token1 = __warp_8_token1;
                tempvar __warp_5_fee = __warp_5_fee;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar warp_memory = warp_memory;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar keccak_ptr = keccak_ptr;
            tempvar __warp_6_pool = __warp_6_pool;
            tempvar __warp_7_token0 = __warp_7_token0;
            tempvar __warp_8_token1 = __warp_8_token1;
            tempvar __warp_5_fee = __warp_5_fee;
        
        let (__warp_se_2) = warp_neq(__warp_7_token0, 0);
        
        assert __warp_se_2 = 1;
        
        let (__warp_se_3) = WS0_INDEX_felt_to_felt(__warp_1_feeAmountTickSpacing, __warp_5_fee);
        
        let (__warp_9_tickSpacing) = WS1_READ_felt(__warp_se_3);
        
        let (__warp_se_4) = warp_neq(__warp_9_tickSpacing, 0);
        
        assert __warp_se_4 = 1;
        
        let (__warp_se_5) = WS1_INDEX_felt_to_warp_id(__warp_2_getPool, __warp_7_token0);
        
        let (__warp_se_6) = WS0_READ_warp_id(__warp_se_5);
        
        let (__warp_se_7) = WS1_INDEX_felt_to_warp_id(__warp_se_6, __warp_8_token1);
        
        let (__warp_se_8) = WS0_READ_warp_id(__warp_se_7);
        
        let (__warp_se_9) = WS0_INDEX_felt_to_felt(__warp_se_8, __warp_5_fee);
        
        let (__warp_se_10) = WS1_READ_felt(__warp_se_9);
        
        let (__warp_se_11) = warp_eq(__warp_se_10, 0);
        
        assert __warp_se_11 = 1;
        
        let (__warp_se_12) = get_contract_address();
        
        let (__warp_pse_1) = deploy_fad5359f(__warp_se_12, __warp_7_token0, __warp_8_token1, __warp_5_fee, __warp_9_tickSpacing);
        
        let __warp_6_pool = __warp_pse_1;
        
        let (__warp_se_13) = WS1_INDEX_felt_to_warp_id(__warp_2_getPool, __warp_7_token0);
        
        let (__warp_se_14) = WS0_READ_warp_id(__warp_se_13);
        
        let (__warp_se_15) = WS1_INDEX_felt_to_warp_id(__warp_se_14, __warp_8_token1);
        
        let (__warp_se_16) = WS0_READ_warp_id(__warp_se_15);
        
        let (__warp_se_17) = WS0_INDEX_felt_to_felt(__warp_se_16, __warp_5_fee);
        
        WS_WRITE0(__warp_se_17, __warp_6_pool);
        
        let (__warp_se_18) = WS1_INDEX_felt_to_warp_id(__warp_2_getPool, __warp_8_token1);
        
        let (__warp_se_19) = WS0_READ_warp_id(__warp_se_18);
        
        let (__warp_se_20) = WS1_INDEX_felt_to_warp_id(__warp_se_19, __warp_7_token0);
        
        let (__warp_se_21) = WS0_READ_warp_id(__warp_se_20);
        
        let (__warp_se_22) = WS0_INDEX_felt_to_felt(__warp_se_21, __warp_5_fee);
        
        WS_WRITE0(__warp_se_22, __warp_6_pool);
        
        _emit_PoolCreated_783cca1c(__warp_7_token0, __warp_8_token1, __warp_5_fee, __warp_9_tickSpacing, __warp_6_pool);
        
        
        
        return (__warp_6_pool,);

    }


    func __warp_constructor_1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*, keccak_ptr : felt*}()-> (){
    alloc_locals;


        
        let (__warp_se_23) = get_caller_address();
        
        WS_WRITE0(__warp_0_owner, __warp_se_23);
        
        let (__warp_se_24) = get_caller_address();
        
        _emit_OwnerChanged_b532073b(0, __warp_se_24);
        
        let (__warp_se_25) = WS0_INDEX_felt_to_felt(__warp_1_feeAmountTickSpacing, 500);
        
        WS_WRITE0(__warp_se_25, 10);
        
        _emit_FeeAmountEnabled_c66a3fdf(500, 10);
        
        let (__warp_se_26) = WS0_INDEX_felt_to_felt(__warp_1_feeAmountTickSpacing, 3000);
        
        WS_WRITE0(__warp_se_26, 60);
        
        _emit_FeeAmountEnabled_c66a3fdf(3000, 60);
        
        let (__warp_se_27) = WS0_INDEX_felt_to_felt(__warp_1_feeAmountTickSpacing, 10000);
        
        WS_WRITE0(__warp_se_27, 200);
        
        _emit_FeeAmountEnabled_c66a3fdf(10000, 200);
        
        
        
        return ();

    }


    func __warp_conditional_enableFeeAmount_8a7c195f_1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_tickSpacing : felt)-> (__warp_rc_0 : felt, __warp_12_tickSpacing : felt){
    alloc_locals;


        
        let (__warp_se_32) = warp_gt_signed24(__warp_12_tickSpacing, 0);
        
        if (__warp_se_32 != 0){
        
            
            let (__warp_se_33) = warp_lt_signed24(__warp_12_tickSpacing, 16384);
            
            let __warp_rc_0 = __warp_se_33;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_12_tickSpacing = __warp_12_tickSpacing;
            
            
            
            return (__warp_rc_0, __warp_12_tickSpacing);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_12_tickSpacing = __warp_12_tickSpacing;
            
            
            
            return (__warp_rc_0, __warp_12_tickSpacing);
        }

    }


    func __warp_constructor_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        let (__warp_se_51) = get_contract_address();
        
        WS_WRITE0(__warp_0_original, __warp_se_51);
        
        
        
        return ();

    }

    // @dev Private method is used instead of inlining into modifier because modifiers are copied into each method,
    //     and the use of immutable means the address bytes are copied in every place the modifier is used.
    func checkNotDelegateCall_8233c275{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        let (__warp_se_52) = get_contract_address();
        
        let (__warp_se_53) = WS1_READ_felt(__warp_0_original);
        
        let (__warp_se_54) = warp_eq(__warp_se_52, __warp_se_53);
        
        assert __warp_se_54 = 1;
        
        
        
        return ();

    }

    // @dev Deploys a pool with the given parameters by transiently setting the parameters storage slot and then
    // clearing it after deploying the pool.
    // @param factory The contract address of the Uniswap V3 factory
    // @param token0 The first token of the pool by address sort order
    // @param token1 The second token of the pool by address sort order
    // @param fee The fee collected upon every swap in the pool, denominated in hundredths of a bip
    // @param tickSpacing The spacing between usable ticks
    func deploy_fad5359f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*, keccak_ptr : felt*}(__warp_1_factory : felt, __warp_2_token0 : felt, __warp_3_token1 : felt, __warp_4_fee : felt, __warp_5_tickSpacing : felt)-> (__warp_6_pool : felt){
    alloc_locals;


        
        let __warp_6_pool = 0;
        
        let (__warp_se_55) = WM0_struct_Parameters_01070596(__warp_1_factory, __warp_2_token0, __warp_3_token1, __warp_4_fee, __warp_5_tickSpacing);
        
        wm_to_storage0(__warp_0_parameters, __warp_se_55);
        
        let (__warp_se_56) = abi_encode0(__warp_2_token0, __warp_3_token1, __warp_4_fee);
        
        let (__warp_se_57) = warp_keccak(__warp_se_56);
        
        let (__warp_se_58) = warp_bytes_narrow_256(__warp_se_57, 8);
        
        let (__warp_se_59) = encode_as_felt0();
        
        let (__warp_se_60) = deploy(UniswapV3Pool_class_hash_a55bb112,__warp_se_58,__warp_se_59.len, __warp_se_59.ptr,0);
        
        let __warp_6_pool = __warp_se_60;
        
        WS_STRUCT_Parameters_DELETE(__warp_0_parameters);
        
        
        
        return (__warp_6_pool,);

    }

}

    // @inheritdoc IUniswapV3Factory
    @external
    func createPool_a1671295{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_3_tokenA : felt, __warp_4_tokenB : felt, __warp_5_fee : felt)-> (__warp_6_pool : felt){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        warp_external_input_check_int24(__warp_5_fee);
        
        warp_external_input_check_address(__warp_4_tokenB);
        
        warp_external_input_check_address(__warp_3_tokenA);
        
        let __warp_6_pool = 0;
        
        let (__warp_pse_2) = UniswapV3Factory.__warp_modifier_noDelegateCall_createPool_a1671295_6(__warp_3_tokenA, __warp_4_tokenB, __warp_5_fee, __warp_6_pool);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return (__warp_pse_2,);
    }
    }

    // @inheritdoc IUniswapV3Factory
    @external
    func setOwner_13af4035{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10__owner : felt)-> (){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        warp_external_input_check_address(__warp_10__owner);
        
        let (__warp_se_28) = get_caller_address();
        
        let (__warp_se_29) = WS1_READ_felt(UniswapV3Factory.__warp_0_owner);
        
        let (__warp_se_30) = warp_eq(__warp_se_28, __warp_se_29);
        
        assert __warp_se_30 = 1;
        
        let (__warp_se_31) = WS1_READ_felt(UniswapV3Factory.__warp_0_owner);
        
        _emit_OwnerChanged_b532073b(__warp_se_31, __warp_10__owner);
        
        WS_WRITE0(UniswapV3Factory.__warp_0_owner, __warp_10__owner);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return ();
    }
    }

    // @inheritdoc IUniswapV3Factory
    @external
    func enableFeeAmount_8a7c195f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_11_fee : felt, __warp_12_tickSpacing : felt)-> (){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        warp_external_input_check_int24(__warp_12_tickSpacing);
        
        warp_external_input_check_int24(__warp_11_fee);
        
        let (__warp_se_34) = get_caller_address();
        
        let (__warp_se_35) = WS1_READ_felt(UniswapV3Factory.__warp_0_owner);
        
        let (__warp_se_36) = warp_eq(__warp_se_34, __warp_se_35);
        
        assert __warp_se_36 = 1;
        
        let (__warp_se_37) = warp_lt(__warp_11_fee, 1000000);
        
        assert __warp_se_37 = 1;
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_2, __warp_tv_3) = UniswapV3Factory.__warp_conditional_enableFeeAmount_8a7c195f_1(__warp_12_tickSpacing);
            
            let __warp_12_tickSpacing = __warp_tv_3;
            
            let __warp_rc_0 = __warp_tv_2;
        
        assert __warp_rc_0 = 1;
        
        let (__warp_se_38) = WS0_INDEX_felt_to_felt(UniswapV3Factory.__warp_1_feeAmountTickSpacing, __warp_11_fee);
        
        let (__warp_se_39) = WS1_READ_felt(__warp_se_38);
        
        let (__warp_se_40) = warp_eq(__warp_se_39, 0);
        
        assert __warp_se_40 = 1;
        
        let (__warp_se_41) = WS0_INDEX_felt_to_felt(UniswapV3Factory.__warp_1_feeAmountTickSpacing, __warp_11_fee);
        
        WS_WRITE0(__warp_se_41, __warp_12_tickSpacing);
        
        _emit_FeeAmountEnabled_c66a3fdf(__warp_11_fee, __warp_12_tickSpacing);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return ();
    }
    }


    @view
    func owner_8da5cb5b{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_13 : felt){
    alloc_locals;


        
        let (__warp_se_42) = WS1_READ_felt(UniswapV3Factory.__warp_0_owner);
        
        
        
        return (__warp_se_42,);

    }


    @view
    func feeAmountTickSpacing_22afcccb{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_14__i0 : felt)-> (__warp_15 : felt){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_14__i0);
        
        let (__warp_se_43) = WS0_INDEX_felt_to_felt(UniswapV3Factory.__warp_1_feeAmountTickSpacing, __warp_14__i0);
        
        let (__warp_se_44) = WS1_READ_felt(__warp_se_43);
        
        
        
        return (__warp_se_44,);

    }


    @view
    func getPool_1698ee82{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_16__i0 : felt, __warp_17__i1 : felt, __warp_18__i2 : felt)-> (__warp_19 : felt){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_18__i2);
        
        warp_external_input_check_address(__warp_17__i1);
        
        warp_external_input_check_address(__warp_16__i0);
        
        let (__warp_se_45) = WS1_INDEX_felt_to_warp_id(UniswapV3Factory.__warp_2_getPool, __warp_16__i0);
        
        let (__warp_se_46) = WS0_READ_warp_id(__warp_se_45);
        
        let (__warp_se_47) = WS1_INDEX_felt_to_warp_id(__warp_se_46, __warp_17__i1);
        
        let (__warp_se_48) = WS0_READ_warp_id(__warp_se_47);
        
        let (__warp_se_49) = WS0_INDEX_felt_to_felt(__warp_se_48, __warp_18__i2);
        
        let (__warp_se_50) = WS1_READ_felt(__warp_se_49);
        
        
        
        return (__warp_se_50,);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(){
    alloc_locals;
    WARP_USED_STORAGE.write(9);
    WARP_NAMEGEN.write(2);
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        UniswapV3Factory.__warp_constructor_0();
        
        UniswapV3Factory.__warp_constructor_1();
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return ();
    }
    }


    @view
    func parameters_89035730{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_7 : felt, __warp_8 : felt, __warp_9 : felt, __warp_10 : felt, __warp_11 : felt){
    alloc_locals;


        
        let __warp_12__temp0 = UniswapV3Factory.__warp_0_parameters;
        
        let (__warp_se_61) = WSM0_Parameters_01070596_factory(__warp_12__temp0);
        
        let (__warp_7) = WS1_READ_felt(__warp_se_61);
        
        let (__warp_se_62) = WSM1_Parameters_01070596_token0(__warp_12__temp0);
        
        let (__warp_8) = WS1_READ_felt(__warp_se_62);
        
        let (__warp_se_63) = WSM2_Parameters_01070596_token1(__warp_12__temp0);
        
        let (__warp_9) = WS1_READ_felt(__warp_se_63);
        
        let (__warp_se_64) = WSM3_Parameters_01070596_fee(__warp_12__temp0);
        
        let (__warp_10) = WS1_READ_felt(__warp_se_64);
        
        let (__warp_se_65) = WSM4_Parameters_01070596_tickSpacing(__warp_12__temp0);
        
        let (__warp_11) = WS1_READ_felt(__warp_se_65);
        
        
        
        return (__warp_7, __warp_8, __warp_9, __warp_10, __warp_11);

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