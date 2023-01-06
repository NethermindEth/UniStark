%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.gt import warp_gt256
from warplib.maths.mulmod import warp_mulmod
from warplib.maths.sub import warp_sub256
from warplib.maths.eq import warp_eq256
from warplib.maths.le import warp_le256
from warplib.maths.lt import warp_lt256
from warplib.maths.ge import warp_ge256
from warplib.maths.mul_unsafe import warp_mul_unsafe256
from warplib.maths.sub_unsafe import warp_sub_unsafe256
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.negate import warp_negate256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.bitwise_or import warp_bitwise_or256
from warplib.maths.xor import warp_xor256


// Contract Def FullMathEchidnaTest


namespace FullMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_checkMulDiv_bf08c391_1{range_check_ptr : felt}(__warp_5_x : Uint256, __warp_6_y : Uint256)-> (__warp_rc_0 : felt, __warp_5_x : Uint256, __warp_6_y : Uint256){
    alloc_locals;


        
        let (__warp_se_6) = warp_eq256(__warp_5_x, Uint256(low=0, high=0));
        
        if (__warp_se_6 != 0){
        
            
            let __warp_rc_0 = 1;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_5_x = __warp_5_x;
            
            let __warp_6_y = __warp_6_y;
            
            
            
            return (__warp_rc_0, __warp_5_x, __warp_6_y);
        }else{
        
            
            let (__warp_se_7) = warp_eq256(__warp_6_y, Uint256(low=0, high=0));
            
            let __warp_rc_0 = __warp_se_7;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_5_x = __warp_5_x;
            
            let __warp_6_y = __warp_6_y;
            
            
            
            return (__warp_rc_0, __warp_5_x, __warp_6_y);
        }

    }


    func __warp_conditional_checkMulDivRoundingUp_79eee487_3{range_check_ptr : felt}(__warp_11_x : Uint256, __warp_12_y : Uint256)-> (__warp_rc_2 : felt, __warp_11_x : Uint256, __warp_12_y : Uint256){
    alloc_locals;


        
        let (__warp_se_16) = warp_eq256(__warp_11_x, Uint256(low=0, high=0));
        
        if (__warp_se_16 != 0){
        
            
            let __warp_rc_2 = 1;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_11_x = __warp_11_x;
            
            let __warp_12_y = __warp_12_y;
            
            
            
            return (__warp_rc_2, __warp_11_x, __warp_12_y);
        }else{
        
            
            let (__warp_se_17) = warp_eq256(__warp_12_y, Uint256(low=0, high=0));
            
            let __warp_rc_2 = __warp_se_17;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_11_x = __warp_11_x;
            
            let __warp_12_y = __warp_12_y;
            
            
            
            return (__warp_rc_2, __warp_11_x, __warp_12_y);
        }

    }

    // @notice Calculates floor(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    // @param a The multiplicand
    // @param b The multiplier
    // @param denominator The divisor
    // @return result The 256-bit result
    // @dev Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv
    func mulDiv_aa9a0912{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_a : Uint256, __warp_1_b : Uint256, __warp_2_denominator : Uint256)-> (__warp_3_result : Uint256){
    alloc_locals;


        
        let __warp_3_result = Uint256(low=0, high=0);
        
        let __warp_4_prod0 = Uint256(low=0, high=0);
        
            
            let (__warp_se_26) = warp_mul_unsafe256(__warp_0_a, __warp_1_b);
            
            let __warp_4_prod0 = __warp_se_26;
            
            let (__warp_5_mm) = warp_mulmod(__warp_0_a, __warp_1_b, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
            
            let __warp_6_prod1 = Uint256(low=0, high=0);
            
            let (__warp_se_27) = warp_sub_unsafe256(__warp_5_mm, __warp_4_prod0);
            
            let __warp_6_prod1 = __warp_se_27;
            
            let (__warp_se_28) = warp_lt256(__warp_5_mm, __warp_4_prod0);
            
                
                if (__warp_se_28 != 0){
                
                    
                    let (__warp_se_29) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_29;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_result = __warp_3_result;
                    tempvar __warp_4_prod0 = __warp_4_prod0;
                    tempvar __warp_2_denominator = __warp_2_denominator;
                    tempvar __warp_6_prod1 = __warp_6_prod1;
                    tempvar __warp_0_a = __warp_0_a;
                    tempvar __warp_1_b = __warp_1_b;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_result = __warp_3_result;
                    tempvar __warp_4_prod0 = __warp_4_prod0;
                    tempvar __warp_2_denominator = __warp_2_denominator;
                    tempvar __warp_6_prod1 = __warp_6_prod1;
                    tempvar __warp_0_a = __warp_0_a;
                    tempvar __warp_1_b = __warp_1_b;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_result = __warp_3_result;
                tempvar __warp_4_prod0 = __warp_4_prod0;
                tempvar __warp_2_denominator = __warp_2_denominator;
                tempvar __warp_6_prod1 = __warp_6_prod1;
                tempvar __warp_0_a = __warp_0_a;
                tempvar __warp_1_b = __warp_1_b;
            
            let (__warp_se_30) = warp_eq256(__warp_6_prod1, Uint256(low=0, high=0));
            
                
                if (__warp_se_30 != 0){
                
                    
                    let (__warp_se_31) = warp_gt256(__warp_2_denominator, Uint256(low=0, high=0));
                    
                    assert __warp_se_31 = 1;
                    
                    let (__warp_se_32) = warp_div_unsafe256(__warp_4_prod0, __warp_2_denominator);
                    
                    let __warp_3_result = __warp_se_32;
                    
                    
                    
                    return (__warp_3_result,);
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_result = __warp_3_result;
                    tempvar __warp_4_prod0 = __warp_4_prod0;
                    tempvar __warp_2_denominator = __warp_2_denominator;
                    tempvar __warp_6_prod1 = __warp_6_prod1;
                    tempvar __warp_0_a = __warp_0_a;
                    tempvar __warp_1_b = __warp_1_b;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_result = __warp_3_result;
                tempvar __warp_4_prod0 = __warp_4_prod0;
                tempvar __warp_2_denominator = __warp_2_denominator;
                tempvar __warp_6_prod1 = __warp_6_prod1;
                tempvar __warp_0_a = __warp_0_a;
                tempvar __warp_1_b = __warp_1_b;
            
            let (__warp_se_33) = warp_gt256(__warp_2_denominator, __warp_6_prod1);
            
            assert __warp_se_33 = 1;
            
            let __warp_7_remainder = Uint256(low=0, high=0);
            
            let (__warp_se_34) = warp_mulmod(__warp_0_a, __warp_1_b, __warp_2_denominator);
            
            let __warp_7_remainder = __warp_se_34;
            
            let (__warp_se_35) = warp_gt256(__warp_7_remainder, __warp_4_prod0);
            
                
                if (__warp_se_35 != 0){
                
                    
                    let (__warp_se_36) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_36;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_result = __warp_3_result;
                    tempvar __warp_4_prod0 = __warp_4_prod0;
                    tempvar __warp_2_denominator = __warp_2_denominator;
                    tempvar __warp_6_prod1 = __warp_6_prod1;
                    tempvar __warp_7_remainder = __warp_7_remainder;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_result = __warp_3_result;
                    tempvar __warp_4_prod0 = __warp_4_prod0;
                    tempvar __warp_2_denominator = __warp_2_denominator;
                    tempvar __warp_6_prod1 = __warp_6_prod1;
                    tempvar __warp_7_remainder = __warp_7_remainder;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_result = __warp_3_result;
                tempvar __warp_4_prod0 = __warp_4_prod0;
                tempvar __warp_2_denominator = __warp_2_denominator;
                tempvar __warp_6_prod1 = __warp_6_prod1;
                tempvar __warp_7_remainder = __warp_7_remainder;
            
            let (__warp_se_37) = warp_sub_unsafe256(__warp_4_prod0, __warp_7_remainder);
            
            let __warp_4_prod0 = __warp_se_37;
            
            let (__warp_se_38) = warp_negate256(__warp_2_denominator);
            
            let (__warp_8_twos) = warp_bitwise_and256(__warp_se_38, __warp_2_denominator);
            
            let (__warp_se_39) = warp_div_unsafe256(__warp_2_denominator, __warp_8_twos);
            
            let __warp_2_denominator = __warp_se_39;
            
            let (__warp_se_40) = warp_div_unsafe256(__warp_4_prod0, __warp_8_twos);
            
            let __warp_4_prod0 = __warp_se_40;
            
            let (__warp_se_41) = warp_sub_unsafe256(Uint256(low=0, high=0), __warp_8_twos);
            
            let (__warp_se_42) = warp_div_unsafe256(__warp_se_41, __warp_8_twos);
            
            let (__warp_se_43) = warp_add_unsafe256(__warp_se_42, Uint256(low=1, high=0));
            
            let __warp_8_twos = __warp_se_43;
            
            let (__warp_se_44) = warp_mul_unsafe256(__warp_6_prod1, __warp_8_twos);
            
            let (__warp_se_45) = warp_bitwise_or256(__warp_4_prod0, __warp_se_44);
            
            let __warp_4_prod0 = __warp_se_45;
            
            let (__warp_se_46) = warp_mul_unsafe256(Uint256(low=3, high=0), __warp_2_denominator);
            
            let (__warp_9_inv) = warp_xor256(__warp_se_46, Uint256(low=2, high=0));
            
            let (__warp_se_47) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_48) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_47);
            
            let (__warp_se_49) = warp_mul_unsafe256(__warp_9_inv, __warp_se_48);
            
            let __warp_9_inv = __warp_se_49;
            
            let (__warp_se_50) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_51) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_50);
            
            let (__warp_se_52) = warp_mul_unsafe256(__warp_9_inv, __warp_se_51);
            
            let __warp_9_inv = __warp_se_52;
            
            let (__warp_se_53) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_54) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_53);
            
            let (__warp_se_55) = warp_mul_unsafe256(__warp_9_inv, __warp_se_54);
            
            let __warp_9_inv = __warp_se_55;
            
            let (__warp_se_56) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_57) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_56);
            
            let (__warp_se_58) = warp_mul_unsafe256(__warp_9_inv, __warp_se_57);
            
            let __warp_9_inv = __warp_se_58;
            
            let (__warp_se_59) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_60) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_59);
            
            let (__warp_se_61) = warp_mul_unsafe256(__warp_9_inv, __warp_se_60);
            
            let __warp_9_inv = __warp_se_61;
            
            let (__warp_se_62) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_63) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_62);
            
            let (__warp_se_64) = warp_mul_unsafe256(__warp_9_inv, __warp_se_63);
            
            let __warp_9_inv = __warp_se_64;
            
            let (__warp_se_65) = warp_mul_unsafe256(__warp_4_prod0, __warp_9_inv);
            
            let __warp_3_result = __warp_se_65;
        
        
        
        return (__warp_3_result,);

    }

    // @notice Calculates ceil(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    // @param a The multiplicand
    // @param b The multiplier
    // @param denominator The divisor
    // @return result The 256-bit result
    func mulDivRoundingUp_0af8b27f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_a : Uint256, __warp_11_b : Uint256, __warp_12_denominator : Uint256)-> (__warp_13_result : Uint256){
    alloc_locals;


        
        let __warp_13_result = Uint256(low=0, high=0);
        
        let (__warp_pse_0) = mulDiv_aa9a0912(__warp_10_a, __warp_11_b, __warp_12_denominator);
        
        let __warp_13_result = __warp_pse_0;
        
            
            let (__warp_se_66) = warp_mulmod(__warp_10_a, __warp_11_b, __warp_12_denominator);
            
            let (__warp_se_67) = warp_gt256(__warp_se_66, Uint256(low=0, high=0));
            
                
                if (__warp_se_67 != 0){
                
                    
                    let (__warp_se_68) = warp_lt256(__warp_13_result, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
                    
                    assert __warp_se_68 = 1;
                    
                    let (__warp_pse_1) = warp_add_unsafe256(__warp_13_result, Uint256(low=1, high=0));
                    
                    let __warp_13_result = __warp_pse_1;
                    
                    warp_sub_unsafe256(__warp_pse_1, Uint256(low=1, high=0));
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_13_result = __warp_13_result;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_13_result = __warp_13_result;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_13_result = __warp_13_result;
        
        
        
        return (__warp_13_result,);

    }

}


    @view
    func checkMulDivRounding_695363a3{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_y : Uint256, __warp_2_d : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_2_d);
        
        warp_external_input_check_int256(__warp_1_y);
        
        warp_external_input_check_int256(__warp_0_x);
        
        let (__warp_se_0) = warp_gt256(__warp_2_d, Uint256(low=0, high=0));
        
        assert __warp_se_0 = 1;
        
        let (__warp_3_ceiled) = FullMathEchidnaTest.mulDivRoundingUp_0af8b27f(__warp_0_x, __warp_1_y, __warp_2_d);
        
        let (__warp_4_floored) = FullMathEchidnaTest.mulDiv_aa9a0912(__warp_0_x, __warp_1_y, __warp_2_d);
        
        let (__warp_se_1) = warp_mulmod(__warp_0_x, __warp_1_y, __warp_2_d);
        
        let (__warp_se_2) = warp_gt256(__warp_se_1, Uint256(low=0, high=0));
        
            
            if (__warp_se_2 != 0){
            
                
                let (__warp_se_3) = warp_sub256(__warp_3_ceiled, __warp_4_floored);
                
                let (__warp_se_4) = warp_eq256(__warp_se_3, Uint256(low=1, high=0));
                
                assert __warp_se_4 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_5) = warp_eq256(__warp_3_ceiled, __warp_4_floored);
                
                assert __warp_se_5 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
        
        
        
        return ();

    }


    @view
    func checkMulDiv_bf08c391{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_x : Uint256, __warp_6_y : Uint256, __warp_7_d : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_7_d);
        
        warp_external_input_check_int256(__warp_6_y);
        
        warp_external_input_check_int256(__warp_5_x);
        
        let (__warp_se_8) = warp_gt256(__warp_7_d, Uint256(low=0, high=0));
        
        assert __warp_se_8 = 1;
        
        let (__warp_8_z) = FullMathEchidnaTest.mulDiv_aa9a0912(__warp_5_x, __warp_6_y, __warp_7_d);
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_tv_1, __warp_tv_2) = FullMathEchidnaTest.__warp_conditional_checkMulDiv_bf08c391_1(__warp_5_x, __warp_6_y);
            
            let __warp_6_y = __warp_tv_2;
            
            let __warp_5_x = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
            
            if (__warp_rc_0 != 0){
            
                
                let (__warp_se_9) = warp_eq256(__warp_8_z, Uint256(low=0, high=0));
                
                assert __warp_se_9 = 1;
                
                
                
                return ();
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_7_d = __warp_7_d;
                tempvar __warp_6_y = __warp_6_y;
                tempvar __warp_5_x = __warp_5_x;
                tempvar __warp_8_z = __warp_8_z;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_7_d = __warp_7_d;
            tempvar __warp_6_y = __warp_6_y;
            tempvar __warp_5_x = __warp_5_x;
            tempvar __warp_8_z = __warp_8_z;
        
        let (__warp_9_x2) = FullMathEchidnaTest.mulDiv_aa9a0912(__warp_8_z, __warp_7_d, __warp_6_y);
        
        let (__warp_10_y2) = FullMathEchidnaTest.mulDiv_aa9a0912(__warp_8_z, __warp_7_d, __warp_5_x);
        
        let (__warp_se_10) = warp_le256(__warp_9_x2, __warp_5_x);
        
        assert __warp_se_10 = 1;
        
        let (__warp_se_11) = warp_le256(__warp_10_y2, __warp_6_y);
        
        assert __warp_se_11 = 1;
        
        let (__warp_se_12) = warp_sub256(__warp_5_x, __warp_9_x2);
        
        let (__warp_se_13) = warp_lt256(__warp_se_12, __warp_7_d);
        
        assert __warp_se_13 = 1;
        
        let (__warp_se_14) = warp_sub256(__warp_6_y, __warp_10_y2);
        
        let (__warp_se_15) = warp_lt256(__warp_se_14, __warp_7_d);
        
        assert __warp_se_15 = 1;
        
        
        
        return ();

    }


    @view
    func checkMulDivRoundingUp_79eee487{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_11_x : Uint256, __warp_12_y : Uint256, __warp_13_d : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_13_d);
        
        warp_external_input_check_int256(__warp_12_y);
        
        warp_external_input_check_int256(__warp_11_x);
        
        let (__warp_se_18) = warp_gt256(__warp_13_d, Uint256(low=0, high=0));
        
        assert __warp_se_18 = 1;
        
        let (__warp_14_z) = FullMathEchidnaTest.mulDivRoundingUp_0af8b27f(__warp_11_x, __warp_12_y, __warp_13_d);
        
        let __warp_rc_2 = 0;
        
            
            let (__warp_tv_3, __warp_tv_4, __warp_tv_5) = FullMathEchidnaTest.__warp_conditional_checkMulDivRoundingUp_79eee487_3(__warp_11_x, __warp_12_y);
            
            let __warp_12_y = __warp_tv_5;
            
            let __warp_11_x = __warp_tv_4;
            
            let __warp_rc_2 = __warp_tv_3;
        
            
            if (__warp_rc_2 != 0){
            
                
                let (__warp_se_19) = warp_eq256(__warp_14_z, Uint256(low=0, high=0));
                
                assert __warp_se_19 = 1;
                
                
                
                return ();
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_13_d = __warp_13_d;
                tempvar __warp_12_y = __warp_12_y;
                tempvar __warp_11_x = __warp_11_x;
                tempvar __warp_14_z = __warp_14_z;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_13_d = __warp_13_d;
            tempvar __warp_12_y = __warp_12_y;
            tempvar __warp_11_x = __warp_11_x;
            tempvar __warp_14_z = __warp_14_z;
        
        let (__warp_15_x2) = FullMathEchidnaTest.mulDiv_aa9a0912(__warp_14_z, __warp_13_d, __warp_12_y);
        
        let (__warp_16_y2) = FullMathEchidnaTest.mulDiv_aa9a0912(__warp_14_z, __warp_13_d, __warp_11_x);
        
        let (__warp_se_20) = warp_ge256(__warp_15_x2, __warp_11_x);
        
        assert __warp_se_20 = 1;
        
        let (__warp_se_21) = warp_ge256(__warp_16_y2, __warp_12_y);
        
        assert __warp_se_21 = 1;
        
        let (__warp_se_22) = warp_sub256(__warp_15_x2, __warp_11_x);
        
        let (__warp_se_23) = warp_lt256(__warp_se_22, __warp_13_d);
        
        assert __warp_se_23 = 1;
        
        let (__warp_se_24) = warp_sub256(__warp_16_y2, __warp_12_y);
        
        let (__warp_se_25) = warp_lt256(__warp_se_24, __warp_13_d);
        
        assert __warp_se_25 = 1;
        
        
        
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