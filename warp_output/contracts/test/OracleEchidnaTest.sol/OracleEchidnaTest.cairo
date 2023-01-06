%lang starknet


from warplib.memory import wm_read_felt, wm_read_256, wm_write_felt, wm_new, wm_index_dyn
from starkware.cairo.common.uint256 import uint256_sub, uint256_add, Uint256
from starkware.cairo.common.alloc import alloc
from warplib.maths.utils import narrow_safe, felt_to_uint256
from warplib.maths.external_input_check_ints import warp_external_input_check_int32, warp_external_input_check_int24, warp_external_input_check_int128, warp_external_input_check_int16
from starkware.cairo.common.dict import dict_write
from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.starknet.common.syscalls import deploy
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from warplib.maths.add import warp_add32, warp_add16
from warplib.maths.ge import warp_ge
from warplib.maths.lt import warp_lt
from warplib.maths.eq import warp_eq
from warplib.maths.le import warp_le, warp_le256
from warplib.maths.mod import warp_mod
from warplib.maths.neq import warp_neq
from warplib.maths.int_conversions import warp_uint256, warp_int24_to_int56
from warplib.maths.sub import warp_sub
from warplib.maths.gt import warp_gt
from warplib.maths.sub_signed import warp_sub_signed56
from warplib.maths.mod_signed import warp_mod_signed56
from warplib.maths.lt_signed import warp_lt_signed56
from warplib.maths.le_signed import warp_le_signed56
from warplib.maths.ge_signed import warp_ge_signed56
from warplib.maths.div_signed import warp_div_signed56
from warplib.maths.add_signed import warp_add_signed56
from warplib.maths.mul import warp_mul256
from warplib.maths.shl import warp_shl256
from warplib.maths.div import warp_div256


// @declare contracts/test/OracleTest.sol/OracleTest.cairo
const OracleTest_class_hash_ec99aac2 = 0;


struct InitializeParams_62e4fbcc{
    time : felt,
    tick : felt,
    liquidity : felt,
}


struct UpdateParams_a5eebe58{
    advanceTimeBy : felt,
    tick : felt,
    liquidity : felt,
}


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

func WS0_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
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

func cd_to_memory1_elem{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(calldata: felt*, mem_start: felt, length: felt){
    alloc_locals;
    if (length == 0){
        return ();
    }
dict_write{dict_ptr=warp_memory}(mem_start, calldata[0]);
    return cd_to_memory1_elem(calldata + 1, mem_start + 1, length - 1);
}
func cd_to_memory1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(calldata : cd_dynarray_felt) -> (mem_loc: felt){
    alloc_locals;
    let (len256) = felt_to_uint256(calldata.len);
    let (mem_start) = wm_new(len256, Uint256(0x1, 0x0));
    cd_to_memory1_elem(calldata.ptr, mem_start + 2, calldata.len);
    return (mem_start,);
}

func encode_as_felt0() -> (calldata_array : cd_dynarray_felt){
   alloc_locals;
   let total_size : felt = 0;
   let (decode_array : felt*) = alloc();
   let result = cd_dynarray_felt(total_size, decode_array);
   return (result,);
}


// Contract Def OracleEchidnaTest


namespace OracleEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    const __warp_0_oracle = 0;

    const __warp_1_initialized = 1;

    const __warp_2_timePassed = 2;


    func __warp_constructor_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        let (__warp_se_0) = encode_as_felt0();
        
        let (__warp_se_1) = deploy(OracleTest_class_hash_ec99aac2,0,__warp_se_0.len, __warp_se_0.ptr,0);
        
        WS_WRITE0(__warp_0_oracle, __warp_se_1);
        
        
        
        return ();

    }


    func limitTimePassed_4c3ac80b{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_6_by : felt)-> (){
    alloc_locals;


        
        let (__warp_se_3) = WS0_READ_felt(__warp_2_timePassed);
        
        let (__warp_se_4) = warp_add32(__warp_se_3, __warp_6_by);
        
        let (__warp_se_5) = WS0_READ_felt(__warp_2_timePassed);
        
        let (__warp_se_6) = warp_ge(__warp_se_4, __warp_se_5);
        
        assert __warp_se_6 = 1;
        
        let (__warp_se_7) = WS0_READ_felt(__warp_2_timePassed);
        
        let (__warp_se_8) = warp_add32(__warp_se_7, __warp_6_by);
        
        WS_WRITE0(__warp_2_timePassed, __warp_se_8);
        
        
        
        return ();

    }


    func __warp_conditional_echidna_indexAlwaysLtCardinality_ae13714b_1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_rc_0 : felt){
    alloc_locals;


        
        let (__warp_se_12) = WS0_READ_felt(__warp_0_oracle);
        
        let (__warp_pse_0) = OracleTest_warped_interface.index_2986c0e5(__warp_se_12);
        
        let (__warp_se_13) = WS0_READ_felt(__warp_0_oracle);
        
        let (__warp_pse_1) = OracleTest_warped_interface.cardinality_dbffe9ad(__warp_se_13);
        
        let (__warp_se_14) = warp_lt(__warp_pse_0, __warp_pse_1);
        
        if (__warp_se_14 != 0){
        
            
            let __warp_rc_0 = 1;
            
            
            
            return (__warp_rc_0,);
        }else{
        
            
            let (__warp_se_15) = WS0_READ_felt(__warp_1_initialized);
            
            let __warp_rc_0 = 1 - __warp_se_15;
            
            
            
            return (__warp_rc_0,);
        }

    }


    func __warp_conditional_echidna_AlwaysInitialized_91e2b63c_3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_22_isInitialized : felt)-> (__warp_rc_2 : felt, __warp_22_isInitialized : felt){
    alloc_locals;


        
        let (__warp_se_16) = WS0_READ_felt(__warp_0_oracle);
        
        let (__warp_pse_3) = OracleTest_warped_interface.cardinality_dbffe9ad(__warp_se_16);
        
        let (__warp_se_17) = warp_eq(__warp_pse_3, 0);
        
        if (__warp_se_17 != 0){
        
            
            let __warp_rc_2 = 1;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_22_isInitialized = __warp_22_isInitialized;
            
            
            
            return (__warp_rc_2, __warp_22_isInitialized);
        }else{
        
            
            let __warp_rc_2 = __warp_22_isInitialized;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_22_isInitialized = __warp_22_isInitialized;
            
            
            
            return (__warp_rc_2, __warp_22_isInitialized);
        }

    }


    func __warp_conditional_checkTwoAdjacentObservationsTickCumulativeModTimeElapsedAlways0_e9f71da9_5{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_26_index : felt, __warp_27_cardinality : felt)-> (__warp_rc_4 : felt, __warp_26_index : felt, __warp_27_cardinality : felt){
    alloc_locals;


        
        let (__warp_se_26) = warp_lt(__warp_26_index, __warp_27_cardinality);
        
        if (__warp_se_26 != 0){
        
            
            let (__warp_se_27) = WS0_READ_felt(__warp_0_oracle);
            
            let (__warp_pse_6) = OracleTest_warped_interface.index_2986c0e5(__warp_se_27);
            
            let (__warp_se_28) = warp_add16(__warp_pse_6, 1);
            
            let (__warp_se_29) = warp_mod(__warp_se_28, __warp_27_cardinality);
            
            let (__warp_se_30) = warp_neq(__warp_26_index, __warp_se_29);
            
            let __warp_rc_4 = __warp_se_30;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_26_index = __warp_26_index;
            
            let __warp_27_cardinality = __warp_27_cardinality;
            
            
            
            return (__warp_rc_4, __warp_26_index, __warp_27_cardinality);
        }else{
        
            
            let __warp_rc_4 = 0;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_26_index = __warp_26_index;
            
            let __warp_27_cardinality = __warp_27_cardinality;
            
            
            
            return (__warp_rc_4, __warp_26_index, __warp_27_cardinality);
        }

    }


    func conditional_349fe82b{range_check_ptr : felt}(__warp_35_index : felt, __warp_36_cardinality : felt)-> (__warp_37 : felt){
    alloc_locals;


        
        let (__warp_se_40) = warp_eq(__warp_35_index, 0);
        
        if (__warp_se_40 != 0){
        
            
            let (__warp_se_41) = warp_sub(__warp_36_cardinality, 1);
            
            
            
            return (__warp_se_41,);
        }else{
        
            
            let (__warp_se_42) = warp_sub(__warp_35_index, 1);
            
            
            
            return (__warp_se_42,);
        }

    }


    func __warp_conditional_checkTimeWeightedAveragesAlwaysFitsType_a9583576_7{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_42_numerator : felt, __warp_38_secondsAgo : felt)-> (__warp_rc_6 : felt, __warp_42_numerator : felt, __warp_38_secondsAgo : felt){
    alloc_locals;


        
        let (__warp_se_43) = warp_lt_signed56(__warp_42_numerator, 0);
        
        if (__warp_se_43 != 0){
        
            
            let (__warp_se_44) = warp_mod_signed56(__warp_42_numerator, __warp_38_secondsAgo);
            
            let (__warp_se_45) = warp_neq(__warp_se_44, 0);
            
            let __warp_rc_6 = __warp_se_45;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_42_numerator = __warp_42_numerator;
            
            let __warp_38_secondsAgo = __warp_38_secondsAgo;
            
            
            
            return (__warp_rc_6, __warp_42_numerator, __warp_38_secondsAgo);
        }else{
        
            
            let __warp_rc_6 = 0;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_42_numerator = __warp_42_numerator;
            
            let __warp_38_secondsAgo = __warp_38_secondsAgo;
            
            
            
            return (__warp_rc_6, __warp_42_numerator, __warp_38_secondsAgo);
        }

    }


    func __warp_conditional_checkTimeWeightedAveragesAlwaysFitsType_a9583576_9{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_43_timeWeightedTick : felt)-> (__warp_rc_8 : felt, __warp_43_timeWeightedTick : felt){
    alloc_locals;


        
        let (__warp_se_46) = warp_int24_to_int56(8388607);
        
        let (__warp_se_47) = warp_le_signed56(__warp_43_timeWeightedTick, __warp_se_46);
        
        if (__warp_se_47 != 0){
        
            
            let (__warp_se_48) = warp_int24_to_int56(8388608);
            
            let (__warp_se_49) = warp_ge_signed56(__warp_43_timeWeightedTick, __warp_se_48);
            
            let __warp_rc_8 = __warp_se_49;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_43_timeWeightedTick = __warp_43_timeWeightedTick;
            
            
            
            return (__warp_rc_8, __warp_43_timeWeightedTick);
        }else{
        
            
            let __warp_rc_8 = 0;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_43_timeWeightedTick = __warp_43_timeWeightedTick;
            
            
            
            return (__warp_rc_8, __warp_43_timeWeightedTick);
        }

    }

}


    @external
    func initialize_4d50e016{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_3_time : felt, __warp_4_tick : felt, __warp_5_liquidity : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int128(__warp_5_liquidity);
        
        warp_external_input_check_int24(__warp_4_tick);
        
        warp_external_input_check_int32(__warp_3_time);
        
        let (__warp_se_2) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        OracleTest_warped_interface.initialize_daf50f6b(__warp_se_2, InitializeParams_62e4fbcc(__warp_3_time, __warp_4_tick, __warp_5_liquidity));
        
        WS_WRITE0(OracleEchidnaTest.__warp_1_initialized, 1);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func advanceTime_f7fd2cfa{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_7_by : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int32(__warp_7_by);
        
        OracleEchidnaTest.limitTimePassed_4c3ac80b(__warp_7_by);
        
        let (__warp_se_9) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        OracleTest_warped_interface.advanceTime_f7fd2cfa(__warp_se_9, __warp_7_by);
        
        
        
        return ();

    }


    @external
    func update_f7fe5510{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_8_advanceTimeBy : felt, __warp_9_tick : felt, __warp_10_liquidity : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int128(__warp_10_liquidity);
        
        warp_external_input_check_int24(__warp_9_tick);
        
        warp_external_input_check_int32(__warp_8_advanceTimeBy);
        
        OracleEchidnaTest.limitTimePassed_4c3ac80b(__warp_8_advanceTimeBy);
        
        let (__warp_se_10) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        OracleTest_warped_interface.update_65829dc5(__warp_se_10, UpdateParams_a5eebe58(__warp_8_advanceTimeBy, __warp_9_tick, __warp_10_liquidity));
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @external
    func grow_761eb23e{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_11_cardinality : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int16(__warp_11_cardinality);
        
        let (__warp_se_11) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        OracleTest_warped_interface.grow_761eb23e(__warp_se_11, __warp_11_cardinality);
        
        
        
        return ();

    }


    @view
    func echidna_indexAlwaysLtCardinality_ae13714b{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_20 : felt){
    alloc_locals;


        
        let __warp_rc_0 = 0;
        
        let (__warp_pse_2) = OracleEchidnaTest.__warp_conditional_echidna_indexAlwaysLtCardinality_ae13714b_1();
        
        let __warp_rc_0 = __warp_pse_2;
        
        
        
        return (__warp_rc_0,);

    }


    @view
    func echidna_AlwaysInitialized_91e2b63c{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_21 : felt){
    alloc_locals;


        
        let (__warp_se_18) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_gv2, __warp_gv3, __warp_gv4, __warp_22_isInitialized) = OracleTest_warped_interface.observations_252c09d7(__warp_se_18, Uint256(low=0, high=0));
        
        let __warp_rc_2 = 0;
        
            
            let (__warp_tv_2, __warp_tv_3) = OracleEchidnaTest.__warp_conditional_echidna_AlwaysInitialized_91e2b63c_3(__warp_22_isInitialized);
            
            let __warp_22_isInitialized = __warp_tv_3;
            
            let __warp_rc_2 = __warp_tv_2;
        
        
        
        return (__warp_rc_2,);

    }


    @view
    func echidna_cardinalityAlwaysLteNext_de327739{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_23 : felt){
    alloc_locals;


        
        let (__warp_se_19) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_pse_4) = OracleTest_warped_interface.cardinality_dbffe9ad(__warp_se_19);
        
        let (__warp_se_20) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_pse_5) = OracleTest_warped_interface.cardinalityNext_dd158c18(__warp_se_20);
        
        let (__warp_se_21) = warp_le(__warp_pse_4, __warp_pse_5);
        
        
        
        return (__warp_se_21,);

    }


    @view
    func echidna_canAlwaysObserve0IfInitialized_ae505b52{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}()-> (__warp_24 : felt){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        let (__warp_se_22) = WS0_READ_felt(OracleEchidnaTest.__warp_1_initialized);
        
            
            if (1 - __warp_se_22 != 0){
            
                
                default_dict_finalize(warp_memory_start, warp_memory, 0);
                
                
                return (1,);
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
        
        let (__warp_25_arr) = wm_new(Uint256(low=1, high=0), Uint256(low=1, high=0));
        
        let (__warp_se_23) = wm_index_dyn(__warp_25_arr, Uint256(low=0, high=0), Uint256(low=1, high=0));
        
        wm_write_felt(__warp_se_23, 0);
        
        let (__warp_se_24) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_se_25) = wm_to_calldata0(__warp_25_arr);
        
        OracleTest_warped_interface.observe_883bdbfd(__warp_se_24, __warp_se_25.len, __warp_se_25.ptr);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return (1,);
    }
    }


    @view
    func checkTwoAdjacentObservationsTickCumulativeModTimeElapsedAlways0_e9f71da9{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_26_index : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int16(__warp_26_index);
        
        let (__warp_se_31) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_27_cardinality) = OracleTest_warped_interface.cardinality_dbffe9ad(__warp_se_31);
        
        let __warp_rc_4 = 0;
        
            
            let (__warp_tv_4, __warp_tv_5, __warp_tv_6) = OracleEchidnaTest.__warp_conditional_checkTwoAdjacentObservationsTickCumulativeModTimeElapsedAlways0_e9f71da9_5(__warp_26_index, __warp_27_cardinality);
            
            let __warp_27_cardinality = __warp_tv_6;
            
            let __warp_26_index = __warp_tv_5;
            
            let __warp_rc_4 = __warp_tv_4;
        
        assert __warp_rc_4 = 1;
        
        let (__warp_pse_7) = OracleEchidnaTest.conditional_349fe82b(__warp_26_index, __warp_27_cardinality);
        
        let (__warp_se_32) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_se_33) = warp_uint256(__warp_pse_7);
        
        let (__warp_28_blockTimestamp0, __warp_29_tickCumulative0, __warp_gv5, __warp_30_initialized0) = OracleTest_warped_interface.observations_252c09d7(__warp_se_32, __warp_se_33);
        
        let (__warp_se_34) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_se_35) = warp_uint256(__warp_26_index);
        
        let (__warp_31_blockTimestamp1, __warp_32_tickCumulative1, __warp_gv6, __warp_33_initialized1) = OracleTest_warped_interface.observations_252c09d7(__warp_se_34, __warp_se_35);
        
        assert __warp_30_initialized0 = 1;
        
        assert __warp_33_initialized1 = 1;
        
        let (__warp_34_timeElapsed) = warp_sub(__warp_31_blockTimestamp1, __warp_28_blockTimestamp0);
        
        let (__warp_se_36) = warp_gt(__warp_34_timeElapsed, 0);
        
        assert __warp_se_36 = 1;
        
        let (__warp_se_37) = warp_sub_signed56(__warp_32_tickCumulative1, __warp_29_tickCumulative0);
        
        let (__warp_se_38) = warp_mod_signed56(__warp_se_37, __warp_34_timeElapsed);
        
        let (__warp_se_39) = warp_eq(__warp_se_38, 0);
        
        assert __warp_se_39 = 1;
        
        
        
        return ();

    }


    @view
    func checkTimeWeightedAveragesAlwaysFitsType_a9583576{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_38_secondsAgo : felt)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int32(__warp_38_secondsAgo);
        
        let (__warp_se_50) = WS0_READ_felt(OracleEchidnaTest.__warp_1_initialized);
        
        assert __warp_se_50 = 1;
        
        let (__warp_se_51) = warp_gt(__warp_38_secondsAgo, 0);
        
        assert __warp_se_51 = 1;
        
        let (__warp_39_secondsAgos) = wm_new(Uint256(low=2, high=0), Uint256(low=1, high=0));
        
        let (__warp_se_52) = wm_index_dyn(__warp_39_secondsAgos, Uint256(low=0, high=0), Uint256(low=1, high=0));
        
        wm_write_felt(__warp_se_52, __warp_38_secondsAgo);
        
        let (__warp_se_53) = wm_index_dyn(__warp_39_secondsAgos, Uint256(low=1, high=0), Uint256(low=1, high=0));
        
        wm_write_felt(__warp_se_53, 0);
        
        let (__warp_se_54) = WS0_READ_felt(OracleEchidnaTest.__warp_0_oracle);
        
        let (__warp_se_55) = wm_to_calldata0(__warp_39_secondsAgos);
        
        let (__warp_td_2_cd_raw_len, __warp_td_2_cd_raw, __warp_td_3_cd_raw_len, __warp_td_3_cd_raw) = OracleTest_warped_interface.observe_883bdbfd(__warp_se_54, __warp_se_55.len, __warp_se_55.ptr);
        
        local __warp_td_3_cd : cd_dynarray_felt = cd_dynarray_felt(__warp_td_3_cd_raw_len, __warp_td_3_cd_raw);
        
        local __warp_td_2_cd : cd_dynarray_felt = cd_dynarray_felt(__warp_td_2_cd_raw_len, __warp_td_2_cd_raw);
        
        let (__warp_td_3) = cd_to_memory0(__warp_td_3_cd);
        
        let (__warp_td_2) = cd_to_memory1(__warp_td_2_cd);
        
        let __warp_40_tickCumulatives = __warp_td_2;
        
        let __warp_41_secondsPerLiquidityCumulativeX128s = __warp_td_3;
        
        let (__warp_se_56) = wm_index_dyn(__warp_40_tickCumulatives, Uint256(low=1, high=0), Uint256(low=1, high=0));
        
        let (__warp_se_57) = wm_read_felt(__warp_se_56);
        
        let (__warp_se_58) = wm_index_dyn(__warp_40_tickCumulatives, Uint256(low=0, high=0), Uint256(low=1, high=0));
        
        let (__warp_se_59) = wm_read_felt(__warp_se_58);
        
        let (__warp_42_numerator) = warp_sub_signed56(__warp_se_57, __warp_se_59);
        
        let (__warp_43_timeWeightedTick) = warp_div_signed56(__warp_42_numerator, __warp_38_secondsAgo);
        
        let __warp_rc_6 = 0;
        
            
            let (__warp_tv_7, __warp_tv_8, __warp_tv_9) = OracleEchidnaTest.__warp_conditional_checkTimeWeightedAveragesAlwaysFitsType_a9583576_7(__warp_42_numerator, __warp_38_secondsAgo);
            
            let __warp_38_secondsAgo = __warp_tv_9;
            
            let __warp_42_numerator = __warp_tv_8;
            
            let __warp_rc_6 = __warp_tv_7;
        
            
            if (__warp_rc_6 != 0){
            
                
                let (__warp_pse_8) = warp_sub_signed56(__warp_43_timeWeightedTick, 1);
                
                let __warp_43_timeWeightedTick = __warp_pse_8;
                
                warp_add_signed56(__warp_pse_8, 1);
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_41_secondsPerLiquidityCumulativeX128s = __warp_41_secondsPerLiquidityCumulativeX128s;
                tempvar __warp_38_secondsAgo = __warp_38_secondsAgo;
                tempvar __warp_43_timeWeightedTick = __warp_43_timeWeightedTick;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar warp_memory = warp_memory;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_41_secondsPerLiquidityCumulativeX128s = __warp_41_secondsPerLiquidityCumulativeX128s;
                tempvar __warp_38_secondsAgo = __warp_38_secondsAgo;
                tempvar __warp_43_timeWeightedTick = __warp_43_timeWeightedTick;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar warp_memory = warp_memory;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_41_secondsPerLiquidityCumulativeX128s = __warp_41_secondsPerLiquidityCumulativeX128s;
            tempvar __warp_38_secondsAgo = __warp_38_secondsAgo;
            tempvar __warp_43_timeWeightedTick = __warp_43_timeWeightedTick;
        
        let __warp_rc_8 = 0;
        
            
            let (__warp_tv_10, __warp_tv_11) = OracleEchidnaTest.__warp_conditional_checkTimeWeightedAveragesAlwaysFitsType_a9583576_9(__warp_43_timeWeightedTick);
            
            let __warp_43_timeWeightedTick = __warp_tv_11;
            
            let __warp_rc_8 = __warp_tv_10;
        
        assert __warp_rc_8 = 1;
        
        let (__warp_se_60) = warp_uint256(__warp_38_secondsAgo);
        
        let (__warp_se_61) = warp_uint256(1461501637330902918203684832716283019655932542975);
        
        let (__warp_se_62) = warp_mul256(__warp_se_60, __warp_se_61);
        
        let (__warp_se_63) = wm_index_dyn(__warp_41_secondsPerLiquidityCumulativeX128s, Uint256(low=1, high=0), Uint256(low=1, high=0));
        
        let (__warp_se_64) = wm_read_felt(__warp_se_63);
        
        let (__warp_se_65) = wm_index_dyn(__warp_41_secondsPerLiquidityCumulativeX128s, Uint256(low=0, high=0), Uint256(low=1, high=0));
        
        let (__warp_se_66) = wm_read_felt(__warp_se_65);
        
        let (__warp_se_67) = warp_sub(__warp_se_64, __warp_se_66);
        
        let (__warp_se_68) = warp_uint256(__warp_se_67);
        
        let (__warp_se_69) = warp_shl256(__warp_se_68, 32);
        
        let (__warp_44_timeWeightedHarmonicMeanLiquidity) = warp_div256(__warp_se_62, __warp_se_69);
        
        let (__warp_se_70) = warp_uint256(340282366920938463463374607431768211455);
        
        let (__warp_se_71) = warp_le256(__warp_44_timeWeightedHarmonicMeanLiquidity, __warp_se_70);
        
        assert __warp_se_71 = 1;
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(3);


        
        OracleEchidnaTest.__warp_constructor_0();
        
        
        
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


// Contract Def OracleTest@interface


@contract_interface
namespace OracleTest_warped_interface{
func initialize_daf50f6b(__warp_7_params : InitializeParams_62e4fbcc)-> (){
}
func advanceTime_f7fd2cfa(__warp_8_by : felt)-> (){
}
func update_65829dc5(__warp_9_params : UpdateParams_a5eebe58)-> (){
}
func batchUpdate_d81740db(__warp_10_params_len : felt, __warp_10_params : UpdateParams_a5eebe58*)-> (){
}
func grow_761eb23e(__warp_18__cardinalityNext : felt)-> (){
}
func observe_883bdbfd(__warp_19_secondsAgos_len : felt, __warp_19_secondsAgos : felt*)-> (tickCumulatives_len : felt, tickCumulatives : felt*, secondsPerLiquidityCumulativeX128s_len : felt, secondsPerLiquidityCumulativeX128s : felt*){
}
func observations_252c09d7(__warp_20__i0 : Uint256)-> (__warp_21 : felt, __warp_22 : felt, __warp_23 : felt, __warp_24 : felt){
}
func time_16ada547()-> (__warp_26 : felt){
}
func tick_3eaf5d9f()-> (__warp_27 : felt){
}
func liquidity_1a686502()-> (__warp_28 : felt){
}
func index_2986c0e5()-> (__warp_29 : felt){
}
func cardinality_dbffe9ad()-> (__warp_30 : felt){
}
func cardinalityNext_dd158c18()-> (__warp_31 : felt){
}
}