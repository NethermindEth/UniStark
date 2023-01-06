%lang starknet


from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from warplib.dynamic_arrays_util import fixed_bytes256_to_felt_dynamic_array, felt_array_to_warp_memory_array, fixed_bytes256_to_felt_dynamic_array_spl
from warplib.maths.utils import felt_to_uint256
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from warplib.memory import wm_new, wm_to_felt_array
from warplib.keccak import felt_array_concat, pack_bytes_felt
from starkware.starknet.common.syscalls import emit_event, get_caller_address
from warplib.maths.add import warp_add256
from warplib.maths.ge import warp_ge256
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from starkware.cairo.common.dict import dict_write
from starkware.cairo.common.cairo_keccak.keccak import finalize_keccak
from warplib.maths.sub import warp_sub256


func WS0_READ_warp_id{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = readId(loc);
    return (read0,);
}

func WS1_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    let (read1) = WARP_STORAGE.read(loc + 1);
    return (Uint256(low=read0,high=read1),);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: Uint256) -> (res: Uint256){
    WARP_STORAGE.write(loc, value.low);
    WARP_STORAGE.write(loc + 1, value.high);
    return (value,);
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

func abi_encode1{bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(param0 : Uint256) -> (result_ptr : felt){
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

func _emit_Transfer_ddf252ad{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : felt, param1 : felt, param2 : Uint256){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x11e6ec91df3d153aa9bc9e4911cbfb251102e0ac5942e0dbf16443f5122846d);// keccak of event signature: Transfer(address,address,uint256)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode0(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode0(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode1(param2);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}

func _emit_Approval_8c5be1e5{syscall_ptr: felt*, bitwise_ptr : BitwiseBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*, keccak_ptr: felt*}(param0 : felt, param1 : felt, param2 : Uint256){
   alloc_locals;
   // keys arrays
   let keys_len: felt = 0;
   let (keys: felt*) = alloc();
   //Insert topic
    let (topic256: Uint256) = felt_to_uint256(0x93c69e112b32c8eaf6fbc376d5c21ba9e86c148fc97ada2a1f426267845230);// keccak of event signature: Approval(address,address,uint256)
    let (keys_len: felt) = fixed_bytes256_to_felt_dynamic_array_spl(keys_len, keys, 0, topic256);
   // keys: pack 31 byte felts into a single 248 bit felt
   let (keys_len: felt, keys: felt*) = pack_bytes_felt(31, 1, keys_len, keys);
   // data arrays
   let data_len: felt = 0;
   let (data: felt*) = alloc();
   let (mem_encode: felt) = abi_encode0(param0);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode0(param1);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   let (mem_encode: felt) = abi_encode1(param2);
   let (encode_bytes_len: felt, encode_bytes: felt*) = wm_to_felt_array(mem_encode);
   let (data_len: felt) = felt_array_concat(encode_bytes_len, 0, encode_bytes, data_len, data);
   // data: pack 31 bytes felts into a single 248 bits felt
   let (data_len: felt, data: felt*) = pack_bytes_felt(31, 1, data_len, data);
   emit_event(keys_len, keys, data_len, data);
   return ();
}

@storage_var
func WARP_MAPPING0(name: felt, index: felt) -> (resLoc : felt){
}
func WS0_INDEX_felt_to_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING0.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 2);
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


// Contract Def TestERC20


// @notice Event emitted when the approval amount for the spender of a given owner's tokens changes.
// @param owner The account that approved spending of its tokens
// @param spender The account for which the spending allowance was modified
// @param value The new allowance from the owner to the spender
// @event
// func Approval(owner : felt, spender : felt, value : Uint256){
// }

// @notice Event emitted when tokens are transferred from one address to another, either via `#transfer` or `#transferFrom`.
// @param from The account from which the tokens were sent, i.e. the balance decreased
// @param to The account to which the tokens were sent, i.e. the balance increased
// @param value The amount of tokens that were transferred
// @event
// func Transfer(__warp_5_from : felt, to : felt, value : Uint256){
// }

namespace TestERC20{

    // Dynamic variables - Arrays and Maps

    const __warp_0_balanceOf = 1;

    const __warp_1_allowance = 2;

    // Static variables


    func __warp_constructor_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_2_amountToMint : Uint256)-> (){
    alloc_locals;


        
        let (__warp_se_0) = get_caller_address();
        
        mint_40c10f19_internal(__warp_se_0, __warp_2_amountToMint);
        
        
        
        return ();

    }


    func mint_40c10f19_internal{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_3_to : felt, __warp_4_amount : Uint256)-> (){
    alloc_locals;


        
        let (__warp_se_1) = WS0_INDEX_felt_to_Uint256(__warp_0_balanceOf, __warp_3_to);
        
        let (__warp_se_2) = WS1_READ_Uint256(__warp_se_1);
        
        let (__warp_5_balanceNext) = warp_add256(__warp_se_2, __warp_4_amount);
        
        let (__warp_se_3) = warp_ge256(__warp_5_balanceNext, __warp_4_amount);
        
        with_attr error_message("overflow balance"){
            assert __warp_se_3 = 1;
        }
        
        let (__warp_se_4) = WS0_INDEX_felt_to_Uint256(__warp_0_balanceOf, __warp_3_to);
        
        WS_WRITE0(__warp_se_4, __warp_5_balanceNext);
        
        
        
        return ();

    }

}


    @external
    func transfer_a9059cbb{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_6_recipient : felt, __warp_7_amount : Uint256)-> (__warp_8 : felt){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        warp_external_input_check_int256(__warp_7_amount);
        
        warp_external_input_check_address(__warp_6_recipient);
        
        let (__warp_se_5) = get_caller_address();
        
        let (__warp_se_6) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_se_5);
        
        let (__warp_9_balanceBefore) = WS1_READ_Uint256(__warp_se_6);
        
        let (__warp_se_7) = warp_ge256(__warp_9_balanceBefore, __warp_7_amount);
        
        with_attr error_message("insufficient balance"){
            assert __warp_se_7 = 1;
        }
        
        let (__warp_se_8) = get_caller_address();
        
        let (__warp_se_9) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_se_8);
        
        let (__warp_se_10) = warp_sub256(__warp_9_balanceBefore, __warp_7_amount);
        
        WS_WRITE0(__warp_se_9, __warp_se_10);
        
        let (__warp_se_11) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_6_recipient);
        
        let (__warp_10_balanceRecipient) = WS1_READ_Uint256(__warp_se_11);
        
        let (__warp_se_12) = warp_add256(__warp_10_balanceRecipient, __warp_7_amount);
        
        let (__warp_se_13) = warp_ge256(__warp_se_12, __warp_10_balanceRecipient);
        
        with_attr error_message("recipient balance overflow"){
            assert __warp_se_13 = 1;
        }
        
        let (__warp_se_14) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_6_recipient);
        
        let (__warp_se_15) = warp_add256(__warp_10_balanceRecipient, __warp_7_amount);
        
        WS_WRITE0(__warp_se_14, __warp_se_15);
        
        let (__warp_se_16) = get_caller_address();
        
        _emit_Transfer_ddf252ad(__warp_se_16, __warp_6_recipient, __warp_7_amount);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return (1,);
    }
    }


    @external
    func approve_095ea7b3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_11_spender : felt, __warp_12_amount : Uint256)-> (__warp_13 : felt){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        warp_external_input_check_int256(__warp_12_amount);
        
        warp_external_input_check_address(__warp_11_spender);
        
        let (__warp_se_17) = get_caller_address();
        
        let (__warp_se_18) = WS1_INDEX_felt_to_warp_id(TestERC20.__warp_1_allowance, __warp_se_17);
        
        let (__warp_se_19) = WS0_READ_warp_id(__warp_se_18);
        
        let (__warp_se_20) = WS0_INDEX_felt_to_Uint256(__warp_se_19, __warp_11_spender);
        
        WS_WRITE0(__warp_se_20, __warp_12_amount);
        
        let (__warp_se_21) = get_caller_address();
        
        _emit_Approval_8c5be1e5(__warp_se_21, __warp_11_spender, __warp_12_amount);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return (1,);
    }
    }


    @external
    func transferFrom_23b872dd{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_14_sender : felt, __warp_15_recipient : felt, __warp_16_amount : Uint256)-> (__warp_17 : felt){
    alloc_locals;
    let (local keccak_ptr_start : felt*) = alloc();
    let keccak_ptr = keccak_ptr_start;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory, keccak_ptr{

        
        warp_external_input_check_int256(__warp_16_amount);
        
        warp_external_input_check_address(__warp_15_recipient);
        
        warp_external_input_check_address(__warp_14_sender);
        
        let (__warp_se_22) = WS1_INDEX_felt_to_warp_id(TestERC20.__warp_1_allowance, __warp_14_sender);
        
        let (__warp_se_23) = WS0_READ_warp_id(__warp_se_22);
        
        let (__warp_se_24) = get_caller_address();
        
        let (__warp_se_25) = WS0_INDEX_felt_to_Uint256(__warp_se_23, __warp_se_24);
        
        let (__warp_18_allowanceBefore) = WS1_READ_Uint256(__warp_se_25);
        
        let (__warp_se_26) = warp_ge256(__warp_18_allowanceBefore, __warp_16_amount);
        
        with_attr error_message("allowance insufficient"){
            assert __warp_se_26 = 1;
        }
        
        let (__warp_se_27) = WS1_INDEX_felt_to_warp_id(TestERC20.__warp_1_allowance, __warp_14_sender);
        
        let (__warp_se_28) = WS0_READ_warp_id(__warp_se_27);
        
        let (__warp_se_29) = get_caller_address();
        
        let (__warp_se_30) = WS0_INDEX_felt_to_Uint256(__warp_se_28, __warp_se_29);
        
        let (__warp_se_31) = warp_sub256(__warp_18_allowanceBefore, __warp_16_amount);
        
        WS_WRITE0(__warp_se_30, __warp_se_31);
        
        let (__warp_se_32) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_15_recipient);
        
        let (__warp_19_balanceRecipient) = WS1_READ_Uint256(__warp_se_32);
        
        let (__warp_se_33) = warp_add256(__warp_19_balanceRecipient, __warp_16_amount);
        
        let (__warp_se_34) = warp_ge256(__warp_se_33, __warp_19_balanceRecipient);
        
        with_attr error_message("overflow balance recipient"){
            assert __warp_se_34 = 1;
        }
        
        let (__warp_se_35) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_15_recipient);
        
        let (__warp_se_36) = warp_add256(__warp_19_balanceRecipient, __warp_16_amount);
        
        WS_WRITE0(__warp_se_35, __warp_se_36);
        
        let (__warp_se_37) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_14_sender);
        
        let (__warp_20_balanceSender) = WS1_READ_Uint256(__warp_se_37);
        
        let (__warp_se_38) = warp_ge256(__warp_20_balanceSender, __warp_16_amount);
        
        with_attr error_message("underflow balance sender"){
            assert __warp_se_38 = 1;
        }
        
        let (__warp_se_39) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_14_sender);
        
        let (__warp_se_40) = warp_sub256(__warp_20_balanceSender, __warp_16_amount);
        
        WS_WRITE0(__warp_se_39, __warp_se_40);
        
        _emit_Transfer_ddf252ad(__warp_14_sender, __warp_15_recipient, __warp_16_amount);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        finalize_keccak(keccak_ptr_start, keccak_ptr);
        
        return (1,);
    }
    }


    @view
    func balanceOf_70a08231{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_21__i0 : felt)-> (__warp_22 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_21__i0);
        
        let (__warp_se_41) = WS0_INDEX_felt_to_Uint256(TestERC20.__warp_0_balanceOf, __warp_21__i0);
        
        let (__warp_se_42) = WS1_READ_Uint256(__warp_se_41);
        
        
        
        return (__warp_se_42,);

    }


    @view
    func allowance_dd62ed3e{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_23__i0 : felt, __warp_24__i1 : felt)-> (__warp_25 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_24__i1);
        
        warp_external_input_check_address(__warp_23__i0);
        
        let (__warp_se_43) = WS1_INDEX_felt_to_warp_id(TestERC20.__warp_1_allowance, __warp_23__i0);
        
        let (__warp_se_44) = WS0_READ_warp_id(__warp_se_43);
        
        let (__warp_se_45) = WS0_INDEX_felt_to_Uint256(__warp_se_44, __warp_24__i1);
        
        let (__warp_se_46) = WS1_READ_Uint256(__warp_se_45);
        
        
        
        return (__warp_se_46,);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_2_amountToMint : Uint256){
    alloc_locals;
    WARP_USED_STORAGE.write(2);
    WARP_NAMEGEN.write(2);


        
        warp_external_input_check_int256(__warp_2_amountToMint);
        
        TestERC20.__warp_constructor_0(__warp_2_amountToMint);
        
        
        
        return ();

    }


    @external
    func mint_40c10f19{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_3_to : felt, __warp_4_amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_4_amount);
        
        warp_external_input_check_address(__warp_3_to);
        
        TestERC20.mint_40c10f19_internal(__warp_3_to, __warp_4_amount);
        
        let __warp_uv8 = ();
        
        
        
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