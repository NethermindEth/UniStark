%lang starknet


from warplib.memory import wm_alloc, wm_new
from starkware.cairo.common.dict import dict_write, dict_read
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.uint256 import Uint256
from warplib.dynamic_arrays_util import fixed_bytes256_to_felt_dynamic_array, felt_array_to_warp_memory_array
from warplib.maths.utils import felt_to_uint256
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin


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

func WS0_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
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

func encode_as_felt0() -> (calldata_array : cd_dynarray_felt){
   alloc_locals;
   let total_size : felt = 0;
   let (decode_array : felt*) = alloc();
   let result = cd_dynarray_felt(total_size, decode_array);
   return (result,);
}


// Contract Def UniswapV3PoolDeployer


namespace UniswapV3PoolDeployer{

    // Dynamic variables - Arrays and Maps

    // Static variables

    const __warp_0_parameters = 0;

}


    @view
    func parameters_89035730{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_7 : felt, __warp_8 : felt, __warp_9 : felt, __warp_10 : felt, __warp_11 : felt){
    alloc_locals;


        
        let __warp_12__temp0 = UniswapV3PoolDeployer.__warp_0_parameters;
        
        let (__warp_se_0) = WSM0_Parameters_01070596_factory(__warp_12__temp0);
        
        let (__warp_7) = WS0_READ_felt(__warp_se_0);
        
        let (__warp_se_1) = WSM1_Parameters_01070596_token0(__warp_12__temp0);
        
        let (__warp_8) = WS0_READ_felt(__warp_se_1);
        
        let (__warp_se_2) = WSM2_Parameters_01070596_token1(__warp_12__temp0);
        
        let (__warp_9) = WS0_READ_felt(__warp_se_2);
        
        let (__warp_se_3) = WSM3_Parameters_01070596_fee(__warp_12__temp0);
        
        let (__warp_10) = WS0_READ_felt(__warp_se_3);
        
        let (__warp_se_4) = WSM4_Parameters_01070596_tickSpacing(__warp_12__temp0);
        
        let (__warp_11) = WS0_READ_felt(__warp_se_4);
        
        
        
        return (__warp_7, __warp_8, __warp_9, __warp_10, __warp_11);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(5);


        
        
        
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