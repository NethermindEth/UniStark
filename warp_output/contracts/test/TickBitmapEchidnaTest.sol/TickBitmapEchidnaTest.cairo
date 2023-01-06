%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int24
from warplib.maths.external_input_check_bool import warp_external_input_check_bool
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.lt_signed import warp_lt_signed24
from warplib.maths.add_signed import warp_add_signed24
from warplib.maths.sub_signed import warp_sub_signed24
from warplib.maths.gt_signed import warp_gt_signed24
from warplib.maths.eq import warp_eq
from warplib.maths.ge_signed import warp_ge_signed24
from warplib.maths.le_signed import warp_le_signed24
from warplib.maths.shr_signed import warp_shr_signed24
from warplib.maths.int_conversions import warp_int24_to_int16, warp_int24_to_int8, warp_uint256
from warplib.maths.mod import warp_mod
from warplib.maths.mod_signed import warp_mod_signed24
from warplib.maths.div_signed_unsafe import warp_div_signed_unsafe24
from warplib.maths.shl import warp_shl256
from warplib.maths.xor import warp_xor256
from warplib.maths.neq import warp_neq, warp_neq256
from warplib.maths.sub_signed_unsafe import warp_sub_signed_unsafe24
from warplib.maths.add_signed_unsafe import warp_add_signed_unsafe24
from warplib.maths.sub_unsafe import warp_sub_unsafe256, warp_sub_unsafe8
from warplib.maths.add_unsafe import warp_add_unsafe256, warp_add_unsafe8
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.mul_signed_unsafe import warp_mul_signed_unsafe24
from warplib.maths.bitwise_not import warp_bitwise_not256
from warplib.maths.gt import warp_gt256
from warplib.maths.ge import warp_ge256
from warplib.maths.shr import warp_shr256


func WS0_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
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


// Contract Def TickBitmapEchidnaTest


namespace TickBitmapEchidnaTest{

    // Dynamic variables - Arrays and Maps

    const __warp_0_bitmap = 1;

    // Static variables


    func __warp_while16{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_i : felt, __warp_9_next : felt)-> (__warp_12_i : felt, __warp_9_next : felt){
    alloc_locals;


        
            
            let (__warp_se_0) = warp_lt_signed24(__warp_12_i, __warp_9_next);
            
                
                if (__warp_se_0 != 0){
                
                    
                        
                        let (__warp_pse_0) = isInitialized_2bdc2fd3(__warp_12_i);
                        
                        assert 1 - __warp_pse_0 = 1;
                    
                    let (__warp_pse_1) = warp_add_signed24(__warp_12_i, 1);
                    
                    let __warp_12_i = __warp_pse_1;
                    
                    warp_sub_signed24(__warp_pse_1, 1);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_12_i = __warp_12_i;
                    tempvar __warp_9_next = __warp_9_next;
                }else{
                
                    
                    let __warp_12_i = __warp_12_i;
                    
                    let __warp_9_next = __warp_9_next;
                    
                    
                    
                    return (__warp_12_i, __warp_9_next);
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_12_i = __warp_12_i;
                tempvar __warp_9_next = __warp_9_next;
        
        let (__warp_12_i, __warp_9_next) = __warp_while16(__warp_12_i, __warp_9_next);
        
        
        
        return (__warp_12_i, __warp_9_next);

    }


    func __warp_while15{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_11_i : felt, __warp_9_next : felt)-> (__warp_11_i : felt, __warp_9_next : felt){
    alloc_locals;


        
            
            let (__warp_se_1) = warp_gt_signed24(__warp_11_i, __warp_9_next);
            
                
                if (__warp_se_1 != 0){
                
                    
                        
                        let (__warp_pse_2) = isInitialized_2bdc2fd3(__warp_11_i);
                        
                        assert 1 - __warp_pse_2 = 1;
                    
                    let (__warp_pse_3) = warp_sub_signed24(__warp_11_i, 1);
                    
                    let __warp_11_i = __warp_pse_3;
                    
                    warp_add_signed24(__warp_pse_3, 1);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_11_i = __warp_11_i;
                    tempvar __warp_9_next = __warp_9_next;
                }else{
                
                    
                    let __warp_11_i = __warp_11_i;
                    
                    let __warp_9_next = __warp_9_next;
                    
                    
                    
                    return (__warp_11_i, __warp_9_next);
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_11_i = __warp_11_i;
                tempvar __warp_9_next = __warp_9_next;
        
        let (__warp_11_i, __warp_9_next) = __warp_while15(__warp_11_i, __warp_9_next);
        
        
        
        return (__warp_11_i, __warp_9_next);

    }


    func isInitialized_2bdc2fd3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_tick : felt)-> (__warp_2 : felt){
    alloc_locals;


        
        let (__warp_3_next, __warp_4_initialized) = nextInitializedTickWithinOneWord_a52a(__warp_0_bitmap, __warp_1_tick, 1, 1);
        
        let (__warp_se_2) = warp_eq(__warp_3_next, __warp_1_tick);
        
        if (__warp_se_2 != 0){
        
            
            
            
            return (__warp_4_initialized,);
        }else{
        
            
            
            
            return (0,);
        }

    }

    // @notice Computes the position in the mapping where the initialized bit for a tick lives
    // @param tick The tick for which to compute the position
    // @return wordPos The key in the mapping containing the word in which the bit is stored
    // @return bitPos The bit position in the word where the flag is stored
    func position_3e7b7779{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tick : felt)-> (__warp_1_wordPos : felt, __warp_2_bitPos : felt){
    alloc_locals;


        
        let __warp_2_bitPos = 0;
        
        let __warp_1_wordPos = 0;
        
            
            let (__warp_se_14) = warp_shr_signed24(__warp_0_tick, 8);
            
            let (__warp_se_15) = warp_int24_to_int16(__warp_se_14);
            
            let __warp_1_wordPos = __warp_se_15;
            
            let (__warp_se_16) = warp_mod(__warp_0_tick, 256);
            
            let (__warp_se_17) = warp_int24_to_int8(__warp_se_16);
            
            let __warp_2_bitPos = __warp_se_17;
        
        let __warp_1_wordPos = __warp_1_wordPos;
        
        let __warp_2_bitPos = __warp_2_bitPos;
        
        
        
        return (__warp_1_wordPos, __warp_2_bitPos);

    }

    // @notice Flips the initialized state for a given tick from false to true, or vice versa
    // @param self The mapping in which to flip the tick
    // @param tick The tick to flip
    // @param tickSpacing The spacing between usable ticks
    func flipTick_5b3a{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_3_self : felt, __warp_4_tick : felt, __warp_5_tickSpacing : felt)-> (){
    alloc_locals;


        
            
            let (__warp_se_18) = warp_mod_signed24(__warp_4_tick, __warp_5_tickSpacing);
            
            let (__warp_se_19) = warp_eq(__warp_se_18, 0);
            
            assert __warp_se_19 = 1;
            
            let (__warp_se_20) = warp_div_signed_unsafe24(__warp_4_tick, __warp_5_tickSpacing);
            
            let (__warp_6_wordPos, __warp_7_bitPos) = position_3e7b7779(__warp_se_20);
            
            let (__warp_8_mask) = warp_shl256(Uint256(low=1, high=0), __warp_7_bitPos);
            
            let __warp_cs_0 = __warp_6_wordPos;
            
            let (__warp_se_21) = WS0_INDEX_felt_to_Uint256(__warp_3_self, __warp_cs_0);
            
            let (__warp_se_22) = WS0_INDEX_felt_to_Uint256(__warp_3_self, __warp_cs_0);
            
            let (__warp_se_23) = WS0_READ_Uint256(__warp_se_22);
            
            let (__warp_se_24) = warp_xor256(__warp_se_23, __warp_8_mask);
            
            WS_WRITE0(__warp_se_21, __warp_se_24);
        
        
        
        return ();

    }


    func __warp_conditional_nextInitializedTickWithinOneWord_a52a_1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_tick : felt, __warp_11_tickSpacing : felt)-> (__warp_rc_0 : felt, __warp_10_tick : felt, __warp_11_tickSpacing : felt){
    alloc_locals;


        
        let (__warp_se_25) = warp_lt_signed24(__warp_10_tick, 0);
        
        if (__warp_se_25 != 0){
        
            
            let (__warp_se_26) = warp_mod_signed24(__warp_10_tick, __warp_11_tickSpacing);
            
            let (__warp_se_27) = warp_neq(__warp_se_26, 0);
            
            let __warp_rc_0 = __warp_se_27;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_10_tick = __warp_10_tick;
            
            let __warp_11_tickSpacing = __warp_11_tickSpacing;
            
            
            
            return (__warp_rc_0, __warp_10_tick, __warp_11_tickSpacing);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_10_tick = __warp_10_tick;
            
            let __warp_11_tickSpacing = __warp_11_tickSpacing;
            
            
            
            return (__warp_rc_0, __warp_10_tick, __warp_11_tickSpacing);
        }

    }

    // @notice Returns the next initialized tick contained in the same word (or adjacent word) as the tick that is either
    // to the left (less than or equal to) or right (greater than) of the given tick
    // @param self The mapping in which to compute the next initialized tick
    // @param tick The starting tick
    // @param tickSpacing The spacing between usable ticks
    // @param lte Whether to search for the next initialized tick to the left (less than or equal to the starting tick)
    // @return next The next initialized or uninitialized tick up to 256 ticks away from the current tick
    // @return initialized Whether the next tick is initialized, as the function only searches within up to 256 ticks
    func nextInitializedTickWithinOneWord_a52a{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_9_self : felt, __warp_10_tick : felt, __warp_11_tickSpacing : felt, __warp_12_lte : felt)-> (__warp_13_next : felt, __warp_14_initialized : felt){
    alloc_locals;


        
        let __warp_13_next = 0;
        
        let __warp_14_initialized = 0;
        
            
            let (__warp_15_compressed) = warp_div_signed_unsafe24(__warp_10_tick, __warp_11_tickSpacing);
            
            let __warp_rc_0 = 0;
            
                
                let (__warp_tv_4, __warp_tv_5, __warp_tv_6) = __warp_conditional_nextInitializedTickWithinOneWord_a52a_1(__warp_10_tick, __warp_11_tickSpacing);
                
                let __warp_11_tickSpacing = __warp_tv_6;
                
                let __warp_10_tick = __warp_tv_5;
                
                let __warp_rc_0 = __warp_tv_4;
            
                
                if (__warp_rc_0 != 0){
                
                    
                    let (__warp_pse_7) = warp_sub_signed_unsafe24(__warp_15_compressed, 1);
                    
                    let __warp_15_compressed = __warp_pse_7;
                    
                    warp_add_signed_unsafe24(__warp_pse_7, 1);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_14_initialized = __warp_14_initialized;
                    tempvar __warp_13_next = __warp_13_next;
                    tempvar __warp_12_lte = __warp_12_lte;
                    tempvar __warp_11_tickSpacing = __warp_11_tickSpacing;
                    tempvar __warp_15_compressed = __warp_15_compressed;
                    tempvar __warp_9_self = __warp_9_self;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_14_initialized = __warp_14_initialized;
                    tempvar __warp_13_next = __warp_13_next;
                    tempvar __warp_12_lte = __warp_12_lte;
                    tempvar __warp_11_tickSpacing = __warp_11_tickSpacing;
                    tempvar __warp_15_compressed = __warp_15_compressed;
                    tempvar __warp_9_self = __warp_9_self;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_14_initialized = __warp_14_initialized;
                tempvar __warp_13_next = __warp_13_next;
                tempvar __warp_12_lte = __warp_12_lte;
                tempvar __warp_11_tickSpacing = __warp_11_tickSpacing;
                tempvar __warp_15_compressed = __warp_15_compressed;
                tempvar __warp_9_self = __warp_9_self;
            
                
                if (__warp_12_lte != 0){
                
                    
                    let (__warp_16_wordPos, __warp_17_bitPos) = position_3e7b7779(__warp_15_compressed);
                    
                    let (__warp_se_28) = warp_shl256(Uint256(low=1, high=0), __warp_17_bitPos);
                    
                    let (__warp_se_29) = warp_sub_unsafe256(__warp_se_28, Uint256(low=1, high=0));
                    
                    let (__warp_se_30) = warp_shl256(Uint256(low=1, high=0), __warp_17_bitPos);
                    
                    let (__warp_18_mask) = warp_add_unsafe256(__warp_se_29, __warp_se_30);
                    
                    let (__warp_se_31) = WS0_INDEX_felt_to_Uint256(__warp_9_self, __warp_16_wordPos);
                    
                    let (__warp_se_32) = WS0_READ_Uint256(__warp_se_31);
                    
                    let (__warp_19_masked) = warp_bitwise_and256(__warp_se_32, __warp_18_mask);
                    
                    let (__warp_se_33) = warp_neq256(__warp_19_masked, Uint256(low=0, high=0));
                    
                    let __warp_14_initialized = __warp_se_33;
                    
                        
                        if (__warp_14_initialized != 0){
                        
                            
                            let (__warp_pse_8) = mostSignificantBit_e6bcbc65(__warp_19_masked);
                            
                            let (__warp_se_34) = warp_sub_signed_unsafe24(__warp_17_bitPos, __warp_pse_8);
                            
                            let (__warp_se_35) = warp_sub_signed_unsafe24(__warp_15_compressed, __warp_se_34);
                            
                            let (__warp_se_36) = warp_mul_signed_unsafe24(__warp_se_35, __warp_11_tickSpacing);
                            
                            let __warp_13_next = __warp_se_36;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar syscall_ptr = syscall_ptr;
                            tempvar pedersen_ptr = pedersen_ptr;
                            tempvar __warp_14_initialized = __warp_14_initialized;
                            tempvar __warp_13_next = __warp_13_next;
                        }else{
                        
                            
                            let (__warp_se_37) = warp_sub_signed_unsafe24(__warp_15_compressed, __warp_17_bitPos);
                            
                            let (__warp_se_38) = warp_mul_signed_unsafe24(__warp_se_37, __warp_11_tickSpacing);
                            
                            let __warp_13_next = __warp_se_38;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar syscall_ptr = syscall_ptr;
                            tempvar pedersen_ptr = pedersen_ptr;
                            tempvar __warp_14_initialized = __warp_14_initialized;
                            tempvar __warp_13_next = __warp_13_next;
                        }
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar __warp_14_initialized = __warp_14_initialized;
                        tempvar __warp_13_next = __warp_13_next;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_14_initialized = __warp_14_initialized;
                    tempvar __warp_13_next = __warp_13_next;
                }else{
                
                    
                    let (__warp_se_39) = warp_add_signed_unsafe24(__warp_15_compressed, 1);
                    
                    let (__warp_20_wordPos, __warp_21_bitPos) = position_3e7b7779(__warp_se_39);
                    
                    let (__warp_se_40) = warp_shl256(Uint256(low=1, high=0), __warp_21_bitPos);
                    
                    let (__warp_se_41) = warp_sub_unsafe256(__warp_se_40, Uint256(low=1, high=0));
                    
                    let (__warp_22_mask) = warp_bitwise_not256(__warp_se_41);
                    
                    let (__warp_se_42) = WS0_INDEX_felt_to_Uint256(__warp_9_self, __warp_20_wordPos);
                    
                    let (__warp_se_43) = WS0_READ_Uint256(__warp_se_42);
                    
                    let (__warp_23_masked) = warp_bitwise_and256(__warp_se_43, __warp_22_mask);
                    
                    let (__warp_se_44) = warp_neq256(__warp_23_masked, Uint256(low=0, high=0));
                    
                    let __warp_14_initialized = __warp_se_44;
                    
                        
                        if (__warp_14_initialized != 0){
                        
                            
                            let (__warp_pse_9) = leastSignificantBit_d230d23f(__warp_23_masked);
                            
                            let (__warp_se_45) = warp_add_signed_unsafe24(__warp_15_compressed, 1);
                            
                            let (__warp_se_46) = warp_sub_signed_unsafe24(__warp_pse_9, __warp_21_bitPos);
                            
                            let (__warp_se_47) = warp_add_signed_unsafe24(__warp_se_45, __warp_se_46);
                            
                            let (__warp_se_48) = warp_mul_signed_unsafe24(__warp_se_47, __warp_11_tickSpacing);
                            
                            let __warp_13_next = __warp_se_48;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar syscall_ptr = syscall_ptr;
                            tempvar pedersen_ptr = pedersen_ptr;
                            tempvar __warp_14_initialized = __warp_14_initialized;
                            tempvar __warp_13_next = __warp_13_next;
                        }else{
                        
                            
                            let (__warp_se_49) = warp_add_signed_unsafe24(__warp_15_compressed, 1);
                            
                            let (__warp_se_50) = warp_sub_signed_unsafe24(255, __warp_21_bitPos);
                            
                            let (__warp_se_51) = warp_add_signed_unsafe24(__warp_se_49, __warp_se_50);
                            
                            let (__warp_se_52) = warp_mul_signed_unsafe24(__warp_se_51, __warp_11_tickSpacing);
                            
                            let __warp_13_next = __warp_se_52;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar syscall_ptr = syscall_ptr;
                            tempvar pedersen_ptr = pedersen_ptr;
                            tempvar __warp_14_initialized = __warp_14_initialized;
                            tempvar __warp_13_next = __warp_13_next;
                        }
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar __warp_14_initialized = __warp_14_initialized;
                        tempvar __warp_13_next = __warp_13_next;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_14_initialized = __warp_14_initialized;
                    tempvar __warp_13_next = __warp_13_next;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_14_initialized = __warp_14_initialized;
                tempvar __warp_13_next = __warp_13_next;
        
        let __warp_13_next = __warp_13_next;
        
        let __warp_14_initialized = __warp_14_initialized;
        
        
        
        return (__warp_13_next, __warp_14_initialized);

    }

    // @notice Returns the index of the most significant bit of the number,
    //     where the least significant bit is at index 0 and the most significant bit is at index 255
    // @dev The function satisfies the property:
    //     x >= 2**mostSignificantBit(x) and x < 2**(mostSignificantBit(x)+1)
    // @param x the value for which to compute the most significant bit, must be greater than 0
    // @return r the index of the most significant bit
    func mostSignificantBit_e6bcbc65{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256)-> (__warp_1_r : felt){
    alloc_locals;


        
        let __warp_1_r = 0;
        
            
            let (__warp_se_53) = warp_gt256(__warp_0_x, Uint256(low=0, high=0));
            
            assert __warp_se_53 = 1;
            
            let (__warp_se_54) = warp_ge256(__warp_0_x, Uint256(low=0, high=1));
            
                
                if (__warp_se_54 != 0){
                
                    
                    let (__warp_se_55) = warp_shr256(__warp_0_x, 128);
                    
                    let __warp_0_x = __warp_se_55;
                    
                    let (__warp_se_56) = warp_add_unsafe8(__warp_1_r, 128);
                    
                    let __warp_1_r = __warp_se_56;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_57) = warp_ge256(__warp_0_x, Uint256(low=18446744073709551616, high=0));
            
                
                if (__warp_se_57 != 0){
                
                    
                    let (__warp_se_58) = warp_shr256(__warp_0_x, 64);
                    
                    let __warp_0_x = __warp_se_58;
                    
                    let (__warp_se_59) = warp_add_unsafe8(__warp_1_r, 64);
                    
                    let __warp_1_r = __warp_se_59;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_60) = warp_ge256(__warp_0_x, Uint256(low=4294967296, high=0));
            
                
                if (__warp_se_60 != 0){
                
                    
                    let (__warp_se_61) = warp_shr256(__warp_0_x, 32);
                    
                    let __warp_0_x = __warp_se_61;
                    
                    let (__warp_se_62) = warp_add_unsafe8(__warp_1_r, 32);
                    
                    let __warp_1_r = __warp_se_62;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_63) = warp_ge256(__warp_0_x, Uint256(low=65536, high=0));
            
                
                if (__warp_se_63 != 0){
                
                    
                    let (__warp_se_64) = warp_shr256(__warp_0_x, 16);
                    
                    let __warp_0_x = __warp_se_64;
                    
                    let (__warp_se_65) = warp_add_unsafe8(__warp_1_r, 16);
                    
                    let __warp_1_r = __warp_se_65;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_66) = warp_ge256(__warp_0_x, Uint256(low=256, high=0));
            
                
                if (__warp_se_66 != 0){
                
                    
                    let (__warp_se_67) = warp_shr256(__warp_0_x, 8);
                    
                    let __warp_0_x = __warp_se_67;
                    
                    let (__warp_se_68) = warp_add_unsafe8(__warp_1_r, 8);
                    
                    let __warp_1_r = __warp_se_68;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_69) = warp_ge256(__warp_0_x, Uint256(low=16, high=0));
            
                
                if (__warp_se_69 != 0){
                
                    
                    let (__warp_se_70) = warp_shr256(__warp_0_x, 4);
                    
                    let __warp_0_x = __warp_se_70;
                    
                    let (__warp_se_71) = warp_add_unsafe8(__warp_1_r, 4);
                    
                    let __warp_1_r = __warp_se_71;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_72) = warp_ge256(__warp_0_x, Uint256(low=4, high=0));
            
                
                if (__warp_se_72 != 0){
                
                    
                    let (__warp_se_73) = warp_shr256(__warp_0_x, 2);
                    
                    let __warp_0_x = __warp_se_73;
                    
                    let (__warp_se_74) = warp_add_unsafe8(__warp_1_r, 2);
                    
                    let __warp_1_r = __warp_se_74;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                    tempvar __warp_0_x = __warp_0_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
                tempvar __warp_0_x = __warp_0_x;
            
            let (__warp_se_75) = warp_ge256(__warp_0_x, Uint256(low=2, high=0));
            
                
                if (__warp_se_75 != 0){
                
                    
                    let (__warp_se_76) = warp_add_unsafe8(__warp_1_r, 1);
                    
                    let __warp_1_r = __warp_se_76;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_r = __warp_1_r;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_r = __warp_1_r;
        
        
        
        return (__warp_1_r,);

    }

    // @notice Returns the index of the least significant bit of the number,
    //     where the least significant bit is at index 0 and the most significant bit is at index 255
    // @dev The function satisfies the property:
    //     (x & 2**leastSignificantBit(x)) != 0 and (x & (2**(leastSignificantBit(x)) - 1)) == 0)
    // @param x the value for which to compute the least significant bit, must be greater than 0
    // @return r the index of the least significant bit
    func leastSignificantBit_d230d23f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_x : Uint256)-> (__warp_3_r : felt){
    alloc_locals;


        
        let __warp_3_r = 0;
        
            
            let (__warp_se_77) = warp_gt256(__warp_2_x, Uint256(low=0, high=0));
            
            assert __warp_se_77 = 1;
            
            let __warp_3_r = 255;
            
            let (__warp_se_78) = warp_uint256(340282366920938463463374607431768211455);
            
            let (__warp_se_79) = warp_bitwise_and256(__warp_2_x, __warp_se_78);
            
            let (__warp_se_80) = warp_gt256(__warp_se_79, Uint256(low=0, high=0));
            
                
                if (__warp_se_80 != 0){
                
                    
                    let (__warp_se_81) = warp_sub_unsafe8(__warp_3_r, 128);
                    
                    let __warp_3_r = __warp_se_81;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_82) = warp_shr256(__warp_2_x, 128);
                    
                    let __warp_2_x = __warp_se_82;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_83) = warp_uint256(18446744073709551615);
            
            let (__warp_se_84) = warp_bitwise_and256(__warp_2_x, __warp_se_83);
            
            let (__warp_se_85) = warp_gt256(__warp_se_84, Uint256(low=0, high=0));
            
                
                if (__warp_se_85 != 0){
                
                    
                    let (__warp_se_86) = warp_sub_unsafe8(__warp_3_r, 64);
                    
                    let __warp_3_r = __warp_se_86;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_87) = warp_shr256(__warp_2_x, 64);
                    
                    let __warp_2_x = __warp_se_87;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_88) = warp_uint256(4294967295);
            
            let (__warp_se_89) = warp_bitwise_and256(__warp_2_x, __warp_se_88);
            
            let (__warp_se_90) = warp_gt256(__warp_se_89, Uint256(low=0, high=0));
            
                
                if (__warp_se_90 != 0){
                
                    
                    let (__warp_se_91) = warp_sub_unsafe8(__warp_3_r, 32);
                    
                    let __warp_3_r = __warp_se_91;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_92) = warp_shr256(__warp_2_x, 32);
                    
                    let __warp_2_x = __warp_se_92;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_93) = warp_uint256(65535);
            
            let (__warp_se_94) = warp_bitwise_and256(__warp_2_x, __warp_se_93);
            
            let (__warp_se_95) = warp_gt256(__warp_se_94, Uint256(low=0, high=0));
            
                
                if (__warp_se_95 != 0){
                
                    
                    let (__warp_se_96) = warp_sub_unsafe8(__warp_3_r, 16);
                    
                    let __warp_3_r = __warp_se_96;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_97) = warp_shr256(__warp_2_x, 16);
                    
                    let __warp_2_x = __warp_se_97;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_98) = warp_uint256(255);
            
            let (__warp_se_99) = warp_bitwise_and256(__warp_2_x, __warp_se_98);
            
            let (__warp_se_100) = warp_gt256(__warp_se_99, Uint256(low=0, high=0));
            
                
                if (__warp_se_100 != 0){
                
                    
                    let (__warp_se_101) = warp_sub_unsafe8(__warp_3_r, 8);
                    
                    let __warp_3_r = __warp_se_101;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_102) = warp_shr256(__warp_2_x, 8);
                    
                    let __warp_2_x = __warp_se_102;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_103) = warp_bitwise_and256(__warp_2_x, Uint256(low=15, high=0));
            
            let (__warp_se_104) = warp_gt256(__warp_se_103, Uint256(low=0, high=0));
            
                
                if (__warp_se_104 != 0){
                
                    
                    let (__warp_se_105) = warp_sub_unsafe8(__warp_3_r, 4);
                    
                    let __warp_3_r = __warp_se_105;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_106) = warp_shr256(__warp_2_x, 4);
                    
                    let __warp_2_x = __warp_se_106;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_107) = warp_bitwise_and256(__warp_2_x, Uint256(low=3, high=0));
            
            let (__warp_se_108) = warp_gt256(__warp_se_107, Uint256(low=0, high=0));
            
                
                if (__warp_se_108 != 0){
                
                    
                    let (__warp_se_109) = warp_sub_unsafe8(__warp_3_r, 2);
                    
                    let __warp_3_r = __warp_se_109;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_110) = warp_shr256(__warp_2_x, 2);
                    
                    let __warp_2_x = __warp_se_110;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_111) = warp_bitwise_and256(__warp_2_x, Uint256(low=1, high=0));
            
            let (__warp_se_112) = warp_gt256(__warp_se_111, Uint256(low=0, high=0));
            
                
                if (__warp_se_112 != 0){
                
                    
                    let (__warp_se_113) = warp_sub_unsafe8(__warp_3_r, 1);
                    
                    let __warp_3_r = __warp_se_113;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
        
        
        
        return (__warp_3_r,);

    }

}


    @external
    func flipTick_8815912f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_tick : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_5_tick);
        
        let (__warp_6_before) = TickBitmapEchidnaTest.isInitialized_2bdc2fd3(__warp_5_tick);
        
        TickBitmapEchidnaTest.flipTick_5b3a(TickBitmapEchidnaTest.__warp_0_bitmap, __warp_5_tick, 1);
        
        let (__warp_pse_4) = TickBitmapEchidnaTest.isInitialized_2bdc2fd3(__warp_5_tick);
        
        let (__warp_se_3) = warp_eq(__warp_pse_4, 1 - __warp_6_before);
        
        assert __warp_se_3 = 1;
        
        
        
        return ();

    }


    @view
    func checkNextInitializedTickWithinOneWordInvariants_2854ac0a{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_7_tick : felt, __warp_8_lte : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_8_lte);
        
        warp_external_input_check_int24(__warp_7_tick);
        
        let (__warp_9_next, __warp_10_initialized) = TickBitmapEchidnaTest.nextInitializedTickWithinOneWord_a52a(TickBitmapEchidnaTest.__warp_0_bitmap, __warp_7_tick, 1, __warp_8_lte);
        
            
            if (__warp_8_lte != 0){
            
                
                let (__warp_se_4) = warp_ge_signed24(__warp_7_tick, 8388864);
                
                assert __warp_se_4 = 1;
                
                let (__warp_se_5) = warp_le_signed24(__warp_9_next, __warp_7_tick);
                
                assert __warp_se_5 = 1;
                
                let (__warp_se_6) = warp_sub_signed24(__warp_7_tick, __warp_9_next);
                
                let (__warp_se_7) = warp_lt_signed24(__warp_se_6, 256);
                
                assert __warp_se_7 = 1;
                
                    
                    let __warp_11_i = __warp_7_tick;
                    
                        
                        let (__warp_tv_0, __warp_tv_1) = TickBitmapEchidnaTest.__warp_while15(__warp_11_i, __warp_9_next);
                        
                        let __warp_9_next = __warp_tv_1;
                        
                        let __warp_11_i = __warp_tv_0;
                
                let (__warp_pse_5) = TickBitmapEchidnaTest.isInitialized_2bdc2fd3(__warp_9_next);
                
                let (__warp_se_8) = warp_eq(__warp_pse_5, __warp_10_initialized);
                
                assert __warp_se_8 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
            }else{
            
                
                let (__warp_se_9) = warp_lt_signed24(__warp_7_tick, 8388351);
                
                assert __warp_se_9 = 1;
                
                let (__warp_se_10) = warp_gt_signed24(__warp_9_next, __warp_7_tick);
                
                assert __warp_se_10 = 1;
                
                let (__warp_se_11) = warp_sub_signed24(__warp_9_next, __warp_7_tick);
                
                let (__warp_se_12) = warp_le_signed24(__warp_se_11, 256);
                
                assert __warp_se_12 = 1;
                
                    
                    let (__warp_12_i) = warp_add_signed24(__warp_7_tick, 1);
                    
                        
                        let (__warp_tv_2, __warp_tv_3) = TickBitmapEchidnaTest.__warp_while16(__warp_12_i, __warp_9_next);
                        
                        let __warp_9_next = __warp_tv_3;
                        
                        let __warp_12_i = __warp_tv_2;
                
                let (__warp_pse_6) = TickBitmapEchidnaTest.isInitialized_2bdc2fd3(__warp_9_next);
                
                let (__warp_se_13) = warp_eq(__warp_pse_6, __warp_10_initialized);
                
                assert __warp_se_13 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
        
        
        
        return ();

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(1);
    WARP_NAMEGEN.write(1);


        
        
        
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