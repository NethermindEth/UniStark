%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.eq import warp_eq, warp_eq256
from warplib.maths.add import warp_add8
from warplib.maths.exp import warp_exp256
from warplib.maths.lt import warp_lt256
from warplib.maths.ge import warp_ge256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.neq import warp_neq256
from warplib.maths.sub import warp_sub256
from warplib.maths.gt import warp_gt256
from warplib.maths.shr import warp_shr256
from warplib.maths.add_unsafe import warp_add_unsafe8
from warplib.maths.int_conversions import warp_uint256
from warplib.maths.sub_unsafe import warp_sub_unsafe8


// Contract Def BitMathEchidnaTest


namespace BitMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_mostSignificantBitInvariant_f94ac90e_1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_msb : felt, __warp_0_input : Uint256)-> (__warp_rc_0 : felt, __warp_1_msb : felt, __warp_0_input : Uint256){
    alloc_locals;


        
        let (__warp_se_0) = warp_eq(__warp_1_msb, 255);
        
        if (__warp_se_0 != 0){
        
            
            let __warp_rc_0 = 1;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_1_msb = __warp_1_msb;
            
            let __warp_0_input = __warp_0_input;
            
            
            
            return (__warp_rc_0, __warp_1_msb, __warp_0_input);
        }else{
        
            
            let (__warp_se_1) = warp_add8(__warp_1_msb, 1);
            
            let (__warp_se_2) = warp_exp256(Uint256(low=2, high=0), __warp_se_1);
            
            let (__warp_se_3) = warp_lt256(__warp_0_input, __warp_se_2);
            
            let __warp_rc_0 = __warp_se_3;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_1_msb = __warp_1_msb;
            
            let __warp_0_input = __warp_0_input;
            
            
            
            return (__warp_rc_0, __warp_1_msb, __warp_0_input);
        }

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
        
            
            let (__warp_se_13) = warp_gt256(__warp_0_x, Uint256(low=0, high=0));
            
            assert __warp_se_13 = 1;
            
            let (__warp_se_14) = warp_ge256(__warp_0_x, Uint256(low=0, high=1));
            
                
                if (__warp_se_14 != 0){
                
                    
                    let (__warp_se_15) = warp_shr256(__warp_0_x, 128);
                    
                    let __warp_0_x = __warp_se_15;
                    
                    let (__warp_se_16) = warp_add_unsafe8(__warp_1_r, 128);
                    
                    let __warp_1_r = __warp_se_16;
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
            
            let (__warp_se_17) = warp_ge256(__warp_0_x, Uint256(low=18446744073709551616, high=0));
            
                
                if (__warp_se_17 != 0){
                
                    
                    let (__warp_se_18) = warp_shr256(__warp_0_x, 64);
                    
                    let __warp_0_x = __warp_se_18;
                    
                    let (__warp_se_19) = warp_add_unsafe8(__warp_1_r, 64);
                    
                    let __warp_1_r = __warp_se_19;
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
            
            let (__warp_se_20) = warp_ge256(__warp_0_x, Uint256(low=4294967296, high=0));
            
                
                if (__warp_se_20 != 0){
                
                    
                    let (__warp_se_21) = warp_shr256(__warp_0_x, 32);
                    
                    let __warp_0_x = __warp_se_21;
                    
                    let (__warp_se_22) = warp_add_unsafe8(__warp_1_r, 32);
                    
                    let __warp_1_r = __warp_se_22;
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
            
            let (__warp_se_23) = warp_ge256(__warp_0_x, Uint256(low=65536, high=0));
            
                
                if (__warp_se_23 != 0){
                
                    
                    let (__warp_se_24) = warp_shr256(__warp_0_x, 16);
                    
                    let __warp_0_x = __warp_se_24;
                    
                    let (__warp_se_25) = warp_add_unsafe8(__warp_1_r, 16);
                    
                    let __warp_1_r = __warp_se_25;
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
            
            let (__warp_se_26) = warp_ge256(__warp_0_x, Uint256(low=256, high=0));
            
                
                if (__warp_se_26 != 0){
                
                    
                    let (__warp_se_27) = warp_shr256(__warp_0_x, 8);
                    
                    let __warp_0_x = __warp_se_27;
                    
                    let (__warp_se_28) = warp_add_unsafe8(__warp_1_r, 8);
                    
                    let __warp_1_r = __warp_se_28;
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
            
            let (__warp_se_29) = warp_ge256(__warp_0_x, Uint256(low=16, high=0));
            
                
                if (__warp_se_29 != 0){
                
                    
                    let (__warp_se_30) = warp_shr256(__warp_0_x, 4);
                    
                    let __warp_0_x = __warp_se_30;
                    
                    let (__warp_se_31) = warp_add_unsafe8(__warp_1_r, 4);
                    
                    let __warp_1_r = __warp_se_31;
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
            
            let (__warp_se_32) = warp_ge256(__warp_0_x, Uint256(low=4, high=0));
            
                
                if (__warp_se_32 != 0){
                
                    
                    let (__warp_se_33) = warp_shr256(__warp_0_x, 2);
                    
                    let __warp_0_x = __warp_se_33;
                    
                    let (__warp_se_34) = warp_add_unsafe8(__warp_1_r, 2);
                    
                    let __warp_1_r = __warp_se_34;
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
            
            let (__warp_se_35) = warp_ge256(__warp_0_x, Uint256(low=2, high=0));
            
                
                if (__warp_se_35 != 0){
                
                    
                    let (__warp_se_36) = warp_add_unsafe8(__warp_1_r, 1);
                    
                    let __warp_1_r = __warp_se_36;
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
        
            
            let (__warp_se_37) = warp_gt256(__warp_2_x, Uint256(low=0, high=0));
            
            assert __warp_se_37 = 1;
            
            let __warp_3_r = 255;
            
            let (__warp_se_38) = warp_uint256(340282366920938463463374607431768211455);
            
            let (__warp_se_39) = warp_bitwise_and256(__warp_2_x, __warp_se_38);
            
            let (__warp_se_40) = warp_gt256(__warp_se_39, Uint256(low=0, high=0));
            
                
                if (__warp_se_40 != 0){
                
                    
                    let (__warp_se_41) = warp_sub_unsafe8(__warp_3_r, 128);
                    
                    let __warp_3_r = __warp_se_41;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_42) = warp_shr256(__warp_2_x, 128);
                    
                    let __warp_2_x = __warp_se_42;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_43) = warp_uint256(18446744073709551615);
            
            let (__warp_se_44) = warp_bitwise_and256(__warp_2_x, __warp_se_43);
            
            let (__warp_se_45) = warp_gt256(__warp_se_44, Uint256(low=0, high=0));
            
                
                if (__warp_se_45 != 0){
                
                    
                    let (__warp_se_46) = warp_sub_unsafe8(__warp_3_r, 64);
                    
                    let __warp_3_r = __warp_se_46;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_47) = warp_shr256(__warp_2_x, 64);
                    
                    let __warp_2_x = __warp_se_47;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_48) = warp_uint256(4294967295);
            
            let (__warp_se_49) = warp_bitwise_and256(__warp_2_x, __warp_se_48);
            
            let (__warp_se_50) = warp_gt256(__warp_se_49, Uint256(low=0, high=0));
            
                
                if (__warp_se_50 != 0){
                
                    
                    let (__warp_se_51) = warp_sub_unsafe8(__warp_3_r, 32);
                    
                    let __warp_3_r = __warp_se_51;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_52) = warp_shr256(__warp_2_x, 32);
                    
                    let __warp_2_x = __warp_se_52;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_53) = warp_uint256(65535);
            
            let (__warp_se_54) = warp_bitwise_and256(__warp_2_x, __warp_se_53);
            
            let (__warp_se_55) = warp_gt256(__warp_se_54, Uint256(low=0, high=0));
            
                
                if (__warp_se_55 != 0){
                
                    
                    let (__warp_se_56) = warp_sub_unsafe8(__warp_3_r, 16);
                    
                    let __warp_3_r = __warp_se_56;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_57) = warp_shr256(__warp_2_x, 16);
                    
                    let __warp_2_x = __warp_se_57;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_58) = warp_uint256(255);
            
            let (__warp_se_59) = warp_bitwise_and256(__warp_2_x, __warp_se_58);
            
            let (__warp_se_60) = warp_gt256(__warp_se_59, Uint256(low=0, high=0));
            
                
                if (__warp_se_60 != 0){
                
                    
                    let (__warp_se_61) = warp_sub_unsafe8(__warp_3_r, 8);
                    
                    let __warp_3_r = __warp_se_61;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_62) = warp_shr256(__warp_2_x, 8);
                    
                    let __warp_2_x = __warp_se_62;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_63) = warp_bitwise_and256(__warp_2_x, Uint256(low=15, high=0));
            
            let (__warp_se_64) = warp_gt256(__warp_se_63, Uint256(low=0, high=0));
            
                
                if (__warp_se_64 != 0){
                
                    
                    let (__warp_se_65) = warp_sub_unsafe8(__warp_3_r, 4);
                    
                    let __warp_3_r = __warp_se_65;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_66) = warp_shr256(__warp_2_x, 4);
                    
                    let __warp_2_x = __warp_se_66;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_67) = warp_bitwise_and256(__warp_2_x, Uint256(low=3, high=0));
            
            let (__warp_se_68) = warp_gt256(__warp_se_67, Uint256(low=0, high=0));
            
                
                if (__warp_se_68 != 0){
                
                    
                    let (__warp_se_69) = warp_sub_unsafe8(__warp_3_r, 2);
                    
                    let __warp_3_r = __warp_se_69;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }else{
                
                    
                    let (__warp_se_70) = warp_shr256(__warp_2_x, 2);
                    
                    let __warp_2_x = __warp_se_70;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_r = __warp_3_r;
                    tempvar __warp_2_x = __warp_2_x;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_r = __warp_3_r;
                tempvar __warp_2_x = __warp_2_x;
            
            let (__warp_se_71) = warp_bitwise_and256(__warp_2_x, Uint256(low=1, high=0));
            
            let (__warp_se_72) = warp_gt256(__warp_se_71, Uint256(low=0, high=0));
            
                
                if (__warp_se_72 != 0){
                
                    
                    let (__warp_se_73) = warp_sub_unsafe8(__warp_3_r, 1);
                    
                    let __warp_3_r = __warp_se_73;
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


    @view
    func mostSignificantBitInvariant_f94ac90e{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_input : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_0_input);
        
        let (__warp_1_msb) = BitMathEchidnaTest.mostSignificantBit_e6bcbc65(__warp_0_input);
        
        let (__warp_se_4) = warp_exp256(Uint256(low=2, high=0), __warp_1_msb);
        
        let (__warp_se_5) = warp_ge256(__warp_0_input, __warp_se_4);
        
        assert __warp_se_5 = 1;
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_tv_1, __warp_tv_2) = BitMathEchidnaTest.__warp_conditional_mostSignificantBitInvariant_f94ac90e_1(__warp_1_msb, __warp_0_input);
            
            let __warp_0_input = __warp_tv_2;
            
            let __warp_1_msb = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
        assert __warp_rc_0 = 1;
        
        
        
        return ();

    }


    @view
    func leastSignificantBitInvariant_2d711e0c{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_input : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_2_input);
        
        let (__warp_3_lsb) = BitMathEchidnaTest.leastSignificantBit_d230d23f(__warp_2_input);
        
        let (__warp_se_6) = warp_exp256(Uint256(low=2, high=0), __warp_3_lsb);
        
        let (__warp_se_7) = warp_bitwise_and256(__warp_2_input, __warp_se_6);
        
        let (__warp_se_8) = warp_neq256(__warp_se_7, Uint256(low=0, high=0));
        
        assert __warp_se_8 = 1;
        
        let (__warp_se_9) = warp_exp256(Uint256(low=2, high=0), __warp_3_lsb);
        
        let (__warp_se_10) = warp_sub256(__warp_se_9, Uint256(low=1, high=0));
        
        let (__warp_se_11) = warp_bitwise_and256(__warp_2_input, __warp_se_10);
        
        let (__warp_se_12) = warp_eq256(__warp_se_11, Uint256(low=0, high=0));
        
        assert __warp_se_12 = 1;
        
        
        
        return ();

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