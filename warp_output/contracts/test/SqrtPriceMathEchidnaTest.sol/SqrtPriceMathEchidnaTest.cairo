%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256, warp_external_input_check_int160, warp_external_input_check_int128
from warplib.maths.external_input_check_bool import warp_external_input_check_bool
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.gt import warp_gt256, warp_gt
from warplib.maths.ge import warp_ge256, warp_ge
from warplib.maths.sub import warp_sub256, warp_sub
from warplib.maths.lt import warp_lt256, warp_lt
from warplib.maths.eq import warp_eq256, warp_eq
from warplib.maths.mulmod import warp_mulmod
from warplib.maths.le import warp_le, warp_le256
from warplib.maths.mul import warp_mul160, warp_mul256
from warplib.maths.div import warp_div, warp_div256
from warplib.maths.int_conversions import warp_uint256, warp_int256_to_int160
from warplib.maths.shl import warp_shl256
from warplib.maths.lt_signed import warp_lt_signed128
from warplib.maths.le_signed import warp_le_signed256
from warplib.maths.gt_signed import warp_gt_signed128, warp_gt_signed256
from warplib.maths.mul_unsafe import warp_mul_unsafe256
from warplib.maths.sub_unsafe import warp_sub_unsafe256, warp_sub_unsafe160
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.negate import warp_negate256, warp_negate128
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.bitwise_or import warp_bitwise_or256
from warplib.maths.xor import warp_xor256
from warplib.maths.mod import warp_mod256


// Contract Def SqrtPriceMathEchidnaTest


namespace SqrtPriceMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_getAmount0DeltaInvariants_3001e65e_1{range_check_ptr : felt}(__warp_25_sqrtP : felt, __warp_26_sqrtQ : felt)-> (__warp_rc_0 : felt, __warp_25_sqrtP : felt, __warp_26_sqrtQ : felt){
    alloc_locals;


        
        let (__warp_se_31) = warp_gt(__warp_25_sqrtP, 0);
        
        if (__warp_se_31 != 0){
        
            
            let (__warp_se_32) = warp_gt(__warp_26_sqrtQ, 0);
            
            let __warp_rc_0 = __warp_se_32;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_25_sqrtP = __warp_25_sqrtP;
            
            let __warp_26_sqrtQ = __warp_26_sqrtQ;
            
            
            
            return (__warp_rc_0, __warp_25_sqrtP, __warp_26_sqrtQ);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_25_sqrtP = __warp_25_sqrtP;
            
            let __warp_26_sqrtQ = __warp_26_sqrtQ;
            
            
            
            return (__warp_rc_0, __warp_25_sqrtP, __warp_26_sqrtQ);
        }

    }


    func __warp_conditional_getAmount0DeltaEquivalency_8e13a4b9_3{range_check_ptr : felt}(__warp_30_sqrtP : felt, __warp_31_sqrtQ : felt)-> (__warp_rc_2 : felt, __warp_30_sqrtP : felt, __warp_31_sqrtQ : felt){
    alloc_locals;


        
        let (__warp_se_38) = warp_gt(__warp_30_sqrtP, 0);
        
        if (__warp_se_38 != 0){
        
            
            let (__warp_se_39) = warp_gt(__warp_31_sqrtQ, 0);
            
            let __warp_rc_2 = __warp_se_39;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_30_sqrtP = __warp_30_sqrtP;
            
            let __warp_31_sqrtQ = __warp_31_sqrtQ;
            
            
            
            return (__warp_rc_2, __warp_30_sqrtP, __warp_31_sqrtQ);
        }else{
        
            
            let __warp_rc_2 = 0;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_30_sqrtP = __warp_30_sqrtP;
            
            let __warp_31_sqrtQ = __warp_31_sqrtQ;
            
            
            
            return (__warp_rc_2, __warp_30_sqrtP, __warp_31_sqrtQ);
        }

    }


    func __warp_conditional_getAmount1DeltaInvariants_c8569d88_5{range_check_ptr : felt}(__warp_39_sqrtP : felt, __warp_40_sqrtQ : felt)-> (__warp_rc_4 : felt, __warp_39_sqrtP : felt, __warp_40_sqrtQ : felt){
    alloc_locals;


        
        let (__warp_se_49) = warp_gt(__warp_39_sqrtP, 0);
        
        if (__warp_se_49 != 0){
        
            
            let (__warp_se_50) = warp_gt(__warp_40_sqrtQ, 0);
            
            let __warp_rc_4 = __warp_se_50;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_39_sqrtP = __warp_39_sqrtP;
            
            let __warp_40_sqrtQ = __warp_40_sqrtQ;
            
            
            
            return (__warp_rc_4, __warp_39_sqrtP, __warp_40_sqrtQ);
        }else{
        
            
            let __warp_rc_4 = 0;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_39_sqrtP = __warp_39_sqrtP;
            
            let __warp_40_sqrtQ = __warp_40_sqrtQ;
            
            
            
            return (__warp_rc_4, __warp_39_sqrtP, __warp_40_sqrtQ);
        }

    }


    func __warp_conditional_getAmount0DeltaSignedInvariants_b29f199e_7{range_check_ptr : felt}(__warp_44_sqrtP : felt, __warp_45_sqrtQ : felt)-> (__warp_rc_6 : felt, __warp_44_sqrtP : felt, __warp_45_sqrtQ : felt){
    alloc_locals;


        
        let (__warp_se_56) = warp_gt(__warp_44_sqrtP, 0);
        
        if (__warp_se_56 != 0){
        
            
            let (__warp_se_57) = warp_gt(__warp_45_sqrtQ, 0);
            
            let __warp_rc_6 = __warp_se_57;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_44_sqrtP = __warp_44_sqrtP;
            
            let __warp_45_sqrtQ = __warp_45_sqrtQ;
            
            
            
            return (__warp_rc_6, __warp_44_sqrtP, __warp_45_sqrtQ);
        }else{
        
            
            let __warp_rc_6 = 0;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_44_sqrtP = __warp_44_sqrtP;
            
            let __warp_45_sqrtQ = __warp_45_sqrtQ;
            
            
            
            return (__warp_rc_6, __warp_44_sqrtP, __warp_45_sqrtQ);
        }

    }


    func __warp_conditional_getAmount1DeltaSignedInvariants_6e6238d7_9{range_check_ptr : felt}(__warp_48_sqrtP : felt, __warp_49_sqrtQ : felt)-> (__warp_rc_8 : felt, __warp_48_sqrtP : felt, __warp_49_sqrtQ : felt){
    alloc_locals;


        
        let (__warp_se_66) = warp_gt(__warp_48_sqrtP, 0);
        
        if (__warp_se_66 != 0){
        
            
            let (__warp_se_67) = warp_gt(__warp_49_sqrtQ, 0);
            
            let __warp_rc_8 = __warp_se_67;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_48_sqrtP = __warp_48_sqrtP;
            
            let __warp_49_sqrtQ = __warp_49_sqrtQ;
            
            
            
            return (__warp_rc_8, __warp_48_sqrtP, __warp_49_sqrtQ);
        }else{
        
            
            let __warp_rc_8 = 0;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_48_sqrtP = __warp_48_sqrtP;
            
            let __warp_49_sqrtQ = __warp_49_sqrtQ;
            
            
            
            return (__warp_rc_8, __warp_48_sqrtP, __warp_49_sqrtQ);
        }

    }


    func __warp_conditional_getOutOfRangeMintInvariants_b712c47c_11{range_check_ptr : felt}(__warp_52_sqrtA : felt, __warp_53_sqrtB : felt)-> (__warp_rc_10 : felt, __warp_52_sqrtA : felt, __warp_53_sqrtB : felt){
    alloc_locals;


        
        let (__warp_se_76) = warp_gt(__warp_52_sqrtA, 0);
        
        if (__warp_se_76 != 0){
        
            
            let (__warp_se_77) = warp_gt(__warp_53_sqrtB, 0);
            
            let __warp_rc_10 = __warp_se_77;
            
            let __warp_rc_10 = __warp_rc_10;
            
            let __warp_52_sqrtA = __warp_52_sqrtA;
            
            let __warp_53_sqrtB = __warp_53_sqrtB;
            
            
            
            return (__warp_rc_10, __warp_52_sqrtA, __warp_53_sqrtB);
        }else{
        
            
            let __warp_rc_10 = 0;
            
            let __warp_rc_10 = __warp_rc_10;
            
            let __warp_52_sqrtA = __warp_52_sqrtA;
            
            let __warp_53_sqrtB = __warp_53_sqrtB;
            
            
            
            return (__warp_rc_10, __warp_52_sqrtA, __warp_53_sqrtB);
        }

    }


    func __warp_conditional_getInRangeMintInvariants_39933d51_13{range_check_ptr : felt}(__warp_57_sqrtLower : felt, __warp_58_sqrtCurrent : felt, __warp_59_sqrtUpper : felt)-> (__warp_rc_12 : felt, __warp_57_sqrtLower : felt, __warp_58_sqrtCurrent : felt, __warp_59_sqrtUpper : felt){
    alloc_locals;


        
        let (__warp_se_84) = warp_le(__warp_57_sqrtLower, __warp_58_sqrtCurrent);
        
        if (__warp_se_84 != 0){
        
            
            let (__warp_se_85) = warp_le(__warp_58_sqrtCurrent, __warp_59_sqrtUpper);
            
            let __warp_rc_12 = __warp_se_85;
            
            let __warp_rc_12 = __warp_rc_12;
            
            let __warp_57_sqrtLower = __warp_57_sqrtLower;
            
            let __warp_58_sqrtCurrent = __warp_58_sqrtCurrent;
            
            let __warp_59_sqrtUpper = __warp_59_sqrtUpper;
            
            
            
            return (__warp_rc_12, __warp_57_sqrtLower, __warp_58_sqrtCurrent, __warp_59_sqrtUpper);
        }else{
        
            
            let __warp_rc_12 = 0;
            
            let __warp_rc_12 = __warp_rc_12;
            
            let __warp_57_sqrtLower = __warp_57_sqrtLower;
            
            let __warp_58_sqrtCurrent = __warp_58_sqrtCurrent;
            
            let __warp_59_sqrtUpper = __warp_59_sqrtUpper;
            
            
            
            return (__warp_rc_12, __warp_57_sqrtLower, __warp_58_sqrtCurrent, __warp_59_sqrtUpper);
        }

    }


    func __warp_conditional_getInRangeMintInvariants_39933d51_15{range_check_ptr : felt}(__warp_61_amount0 : Uint256, __warp_62_amount1 : Uint256)-> (__warp_rc_14 : felt, __warp_61_amount0 : Uint256, __warp_62_amount1 : Uint256){
    alloc_locals;


        
        let (__warp_se_86) = warp_gt_signed256(__warp_61_amount0, Uint256(low=0, high=0));
        
        if (__warp_se_86 != 0){
        
            
            let __warp_rc_14 = 1;
            
            let __warp_rc_14 = __warp_rc_14;
            
            let __warp_61_amount0 = __warp_61_amount0;
            
            let __warp_62_amount1 = __warp_62_amount1;
            
            
            
            return (__warp_rc_14, __warp_61_amount0, __warp_62_amount1);
        }else{
        
            
            let (__warp_se_87) = warp_gt_signed256(__warp_62_amount1, Uint256(low=0, high=0));
            
            let __warp_rc_14 = __warp_se_87;
            
            let __warp_rc_14 = __warp_rc_14;
            
            let __warp_61_amount0 = __warp_61_amount0;
            
            let __warp_62_amount1 = __warp_62_amount1;
            
            
            
            return (__warp_rc_14, __warp_61_amount0, __warp_62_amount1);
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
        
            
            let (__warp_se_91) = warp_mul_unsafe256(__warp_0_a, __warp_1_b);
            
            let __warp_4_prod0 = __warp_se_91;
            
            let (__warp_5_mm) = warp_mulmod(__warp_0_a, __warp_1_b, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
            
            let __warp_6_prod1 = Uint256(low=0, high=0);
            
            let (__warp_se_92) = warp_sub_unsafe256(__warp_5_mm, __warp_4_prod0);
            
            let __warp_6_prod1 = __warp_se_92;
            
            let (__warp_se_93) = warp_lt256(__warp_5_mm, __warp_4_prod0);
            
                
                if (__warp_se_93 != 0){
                
                    
                    let (__warp_se_94) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_94;
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
            
            let (__warp_se_95) = warp_eq256(__warp_6_prod1, Uint256(low=0, high=0));
            
                
                if (__warp_se_95 != 0){
                
                    
                    let (__warp_se_96) = warp_gt256(__warp_2_denominator, Uint256(low=0, high=0));
                    
                    assert __warp_se_96 = 1;
                    
                    let (__warp_se_97) = warp_div_unsafe256(__warp_4_prod0, __warp_2_denominator);
                    
                    let __warp_3_result = __warp_se_97;
                    
                    
                    
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
            
            let (__warp_se_98) = warp_gt256(__warp_2_denominator, __warp_6_prod1);
            
            assert __warp_se_98 = 1;
            
            let __warp_7_remainder = Uint256(low=0, high=0);
            
            let (__warp_se_99) = warp_mulmod(__warp_0_a, __warp_1_b, __warp_2_denominator);
            
            let __warp_7_remainder = __warp_se_99;
            
            let (__warp_se_100) = warp_gt256(__warp_7_remainder, __warp_4_prod0);
            
                
                if (__warp_se_100 != 0){
                
                    
                    let (__warp_se_101) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_101;
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
            
            let (__warp_se_102) = warp_sub_unsafe256(__warp_4_prod0, __warp_7_remainder);
            
            let __warp_4_prod0 = __warp_se_102;
            
            let (__warp_se_103) = warp_negate256(__warp_2_denominator);
            
            let (__warp_8_twos) = warp_bitwise_and256(__warp_se_103, __warp_2_denominator);
            
            let (__warp_se_104) = warp_div_unsafe256(__warp_2_denominator, __warp_8_twos);
            
            let __warp_2_denominator = __warp_se_104;
            
            let (__warp_se_105) = warp_div_unsafe256(__warp_4_prod0, __warp_8_twos);
            
            let __warp_4_prod0 = __warp_se_105;
            
            let (__warp_se_106) = warp_sub_unsafe256(Uint256(low=0, high=0), __warp_8_twos);
            
            let (__warp_se_107) = warp_div_unsafe256(__warp_se_106, __warp_8_twos);
            
            let (__warp_se_108) = warp_add_unsafe256(__warp_se_107, Uint256(low=1, high=0));
            
            let __warp_8_twos = __warp_se_108;
            
            let (__warp_se_109) = warp_mul_unsafe256(__warp_6_prod1, __warp_8_twos);
            
            let (__warp_se_110) = warp_bitwise_or256(__warp_4_prod0, __warp_se_109);
            
            let __warp_4_prod0 = __warp_se_110;
            
            let (__warp_se_111) = warp_mul_unsafe256(Uint256(low=3, high=0), __warp_2_denominator);
            
            let (__warp_9_inv) = warp_xor256(__warp_se_111, Uint256(low=2, high=0));
            
            let (__warp_se_112) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_113) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_112);
            
            let (__warp_se_114) = warp_mul_unsafe256(__warp_9_inv, __warp_se_113);
            
            let __warp_9_inv = __warp_se_114;
            
            let (__warp_se_115) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_116) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_115);
            
            let (__warp_se_117) = warp_mul_unsafe256(__warp_9_inv, __warp_se_116);
            
            let __warp_9_inv = __warp_se_117;
            
            let (__warp_se_118) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_119) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_118);
            
            let (__warp_se_120) = warp_mul_unsafe256(__warp_9_inv, __warp_se_119);
            
            let __warp_9_inv = __warp_se_120;
            
            let (__warp_se_121) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_122) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_121);
            
            let (__warp_se_123) = warp_mul_unsafe256(__warp_9_inv, __warp_se_122);
            
            let __warp_9_inv = __warp_se_123;
            
            let (__warp_se_124) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_125) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_124);
            
            let (__warp_se_126) = warp_mul_unsafe256(__warp_9_inv, __warp_se_125);
            
            let __warp_9_inv = __warp_se_126;
            
            let (__warp_se_127) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_128) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_127);
            
            let (__warp_se_129) = warp_mul_unsafe256(__warp_9_inv, __warp_se_128);
            
            let __warp_9_inv = __warp_se_129;
            
            let (__warp_se_130) = warp_mul_unsafe256(__warp_4_prod0, __warp_9_inv);
            
            let __warp_3_result = __warp_se_130;
        
        
        
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
        
        let (__warp_pse_10) = mulDiv_aa9a0912(__warp_10_a, __warp_11_b, __warp_12_denominator);
        
        let __warp_13_result = __warp_pse_10;
        
            
            let (__warp_se_131) = warp_mulmod(__warp_10_a, __warp_11_b, __warp_12_denominator);
            
            let (__warp_se_132) = warp_gt256(__warp_se_131, Uint256(low=0, high=0));
            
                
                if (__warp_se_132 != 0){
                
                    
                    let (__warp_se_133) = warp_lt256(__warp_13_result, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
                    
                    assert __warp_se_133 = 1;
                    
                    let (__warp_pse_11) = warp_add_unsafe256(__warp_13_result, Uint256(low=1, high=0));
                    
                    let __warp_13_result = __warp_pse_11;
                    
                    warp_sub_unsafe256(__warp_pse_11, Uint256(low=1, high=0));
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


    func __warp_conditional_getNextSqrtPriceFromAmount0RoundingUp_157f652f_17{range_check_ptr : felt}(__warp_8_product : Uint256, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt, __warp_5_numerator1 : Uint256)-> (__warp_rc_16 : felt, __warp_8_product : Uint256, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt, __warp_5_numerator1 : Uint256){
    alloc_locals;


        
        let (__warp_se_134) = warp_uint256(__warp_0_sqrtPX96);
        
        let (__warp_pse_16) = warp_mul256(__warp_2_amount, __warp_se_134);
        
        let __warp_8_product = __warp_pse_16;
        
        let (__warp_se_135) = warp_div256(__warp_pse_16, __warp_2_amount);
        
        let (__warp_se_136) = warp_uint256(__warp_0_sqrtPX96);
        
        let (__warp_se_137) = warp_eq256(__warp_se_135, __warp_se_136);
        
        if (__warp_se_137 != 0){
        
            
            let (__warp_se_138) = warp_gt256(__warp_5_numerator1, __warp_8_product);
            
            let __warp_rc_16 = __warp_se_138;
            
            let __warp_rc_16 = __warp_rc_16;
            
            let __warp_8_product = __warp_8_product;
            
            let __warp_2_amount = __warp_2_amount;
            
            let __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
            
            let __warp_5_numerator1 = __warp_5_numerator1;
            
            
            
            return (__warp_rc_16, __warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
        }else{
        
            
            let __warp_rc_16 = 0;
            
            let __warp_rc_16 = __warp_rc_16;
            
            let __warp_8_product = __warp_8_product;
            
            let __warp_2_amount = __warp_2_amount;
            
            let __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
            
            let __warp_5_numerator1 = __warp_5_numerator1;
            
            
            
            return (__warp_rc_16, __warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
        }

    }

    // @notice Gets the next sqrt price given a delta of token0
    // @dev Always rounds up, because in the exact output case (increasing price) we need to move the price at least
    // far enough to get the desired output amount, and in the exact input case (decreasing price) we need to move the
    // price less in order to not send too much output.
    // The most precise formula for this is liquidity * sqrtPX96 / (liquidity +- amount * sqrtPX96),
    // if this is impossible because of overflow, we calculate liquidity / (liquidity / sqrtPX96 +- amount).
    // @param sqrtPX96 The starting price, i.e. before accounting for the token0 delta
    // @param liquidity The amount of usable liquidity
    // @param amount How much of token0 to add or remove from virtual reserves
    // @param add Whether to add or remove the amount of token0
    // @return The price after adding or removing amount, depending on add
    func getNextSqrtPriceFromAmount0RoundingUp_157f652f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_sqrtPX96 : felt, __warp_1_liquidity : felt, __warp_2_amount : Uint256, __warp_3_add : felt)-> (__warp_4 : felt){
    alloc_locals;


        
            
            let (__warp_se_139) = warp_eq256(__warp_2_amount, Uint256(low=0, high=0));
            
                
                if (__warp_se_139 != 0){
                
                    
                    
                    
                    return (__warp_0_sqrtPX96,);
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_3_add = __warp_3_add;
                    tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                    tempvar __warp_2_amount = __warp_2_amount;
                    tempvar __warp_1_liquidity = __warp_1_liquidity;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_3_add = __warp_3_add;
                tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                tempvar __warp_2_amount = __warp_2_amount;
                tempvar __warp_1_liquidity = __warp_1_liquidity;
            
            let (__warp_se_140) = warp_uint256(__warp_1_liquidity);
            
            let (__warp_5_numerator1) = warp_shl256(__warp_se_140, 96);
            
            if (__warp_3_add != 0){
            
                
                let __warp_6_product = Uint256(low=0, high=0);
                
                let (__warp_se_141) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_pse_12) = warp_mul_unsafe256(__warp_2_amount, __warp_se_141);
                
                let __warp_6_product = __warp_pse_12;
                
                let (__warp_se_142) = warp_div_unsafe256(__warp_pse_12, __warp_2_amount);
                
                let (__warp_se_143) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_se_144) = warp_eq256(__warp_se_142, __warp_se_143);
                
                    
                    if (__warp_se_144 != 0){
                    
                        
                        let (__warp_7_denominator) = warp_add_unsafe256(__warp_5_numerator1, __warp_6_product);
                        
                        let (__warp_se_145) = warp_ge256(__warp_7_denominator, __warp_5_numerator1);
                        
                            
                            if (__warp_se_145 != 0){
                            
                                
                                let (__warp_se_146) = warp_uint256(__warp_0_sqrtPX96);
                                
                                let (__warp_pse_13) = mulDivRoundingUp_0af8b27f(__warp_5_numerator1, __warp_se_146, __warp_7_denominator);
                                
                                let (__warp_se_147) = warp_int256_to_int160(__warp_pse_13);
                                
                                
                                
                                return (__warp_se_147,);
                            }else{
                            
                                tempvar range_check_ptr = range_check_ptr;
                                tempvar bitwise_ptr = bitwise_ptr;
                                tempvar __warp_5_numerator1 = __warp_5_numerator1;
                                tempvar __warp_2_amount = __warp_2_amount;
                                tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                            }
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar __warp_5_numerator1 = __warp_5_numerator1;
                            tempvar __warp_2_amount = __warp_2_amount;
                            tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_5_numerator1 = __warp_5_numerator1;
                        tempvar __warp_2_amount = __warp_2_amount;
                        tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                    }else{
                    
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_5_numerator1 = __warp_5_numerator1;
                        tempvar __warp_2_amount = __warp_2_amount;
                        tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_numerator1 = __warp_5_numerator1;
                    tempvar __warp_2_amount = __warp_2_amount;
                    tempvar __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
                
                let (__warp_se_148) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_se_149) = warp_div_unsafe256(__warp_5_numerator1, __warp_se_148);
                
                let (__warp_pse_14) = add_771602f7(__warp_se_149, __warp_2_amount);
                
                let (__warp_pse_15) = divRoundingUp_40226b32(__warp_5_numerator1, __warp_pse_14);
                
                let (__warp_se_150) = warp_int256_to_int160(__warp_pse_15);
                
                
                
                return (__warp_se_150,);
            }else{
            
                
                let __warp_8_product = Uint256(low=0, high=0);
                
                let __warp_rc_16 = 0;
                
                    
                    let (__warp_tv_25, __warp_tv_26, __warp_tv_27, __warp_tv_28, __warp_tv_29) = __warp_conditional_getNextSqrtPriceFromAmount0RoundingUp_157f652f_17(__warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
                    
                    let __warp_5_numerator1 = __warp_tv_29;
                    
                    let __warp_0_sqrtPX96 = __warp_tv_28;
                    
                    let __warp_2_amount = __warp_tv_27;
                    
                    let __warp_8_product = __warp_tv_26;
                    
                    let __warp_rc_16 = __warp_tv_25;
                
                assert __warp_rc_16 = 1;
                
                let (__warp_9_denominator) = warp_sub_unsafe256(__warp_5_numerator1, __warp_8_product);
                
                let (__warp_se_151) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_pse_17) = mulDivRoundingUp_0af8b27f(__warp_5_numerator1, __warp_se_151, __warp_9_denominator);
                
                let (__warp_pse_18) = toUint160_dfef6beb(__warp_pse_17);
                
                
                
                return (__warp_pse_18,);
            }

    }

    // @notice Gets the next sqrt price given a delta of token1
    // @dev Always rounds down, because in the exact output case (decreasing price) we need to move the price at least
    // far enough to get the desired output amount, and in the exact input case (increasing price) we need to move the
    // price less in order to not send too much output.
    // The formula we compute is within <1 wei of the lossless version: sqrtPX96 +- amount / liquidity
    // @param sqrtPX96 The starting price, i.e., before accounting for the token1 delta
    // @param liquidity The amount of usable liquidity
    // @param amount How much of token1 to add, or remove, from virtual reserves
    // @param add Whether to add, or remove, the amount of token1
    // @return The price after adding or removing `amount`
    func getNextSqrtPriceFromAmount1RoundingDown_fb4de288{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_sqrtPX96 : felt, __warp_11_liquidity : felt, __warp_12_amount : Uint256, __warp_13_add : felt)-> (__warp_14 : felt){
    alloc_locals;


        
            
            if (__warp_13_add != 0){
            
                
                let __warp_15_quotient = Uint256(low=0, high=0);
                
                let (__warp_se_152) = warp_uint256(1461501637330902918203684832716283019655932542975);
                
                let (__warp_se_153) = warp_le256(__warp_12_amount, __warp_se_152);
                
                    
                    if (__warp_se_153 != 0){
                    
                        
                        let (__warp_se_154) = warp_shl256(__warp_12_amount, 96);
                        
                        let (__warp_se_155) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_se_156) = warp_div_unsafe256(__warp_se_154, __warp_se_155);
                        
                        let __warp_15_quotient = __warp_se_156;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_15_quotient = __warp_15_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }else{
                    
                        
                        let (__warp_se_157) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_pse_19) = mulDiv_aa9a0912(__warp_12_amount, Uint256(low=79228162514264337593543950336, high=0), __warp_se_157);
                        
                        let __warp_15_quotient = __warp_pse_19;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_15_quotient = __warp_15_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_15_quotient = __warp_15_quotient;
                    tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                
                let (__warp_se_158) = warp_uint256(__warp_10_sqrtPX96);
                
                let (__warp_pse_20) = add_771602f7(__warp_se_158, __warp_15_quotient);
                
                let (__warp_pse_21) = toUint160_dfef6beb(__warp_pse_20);
                
                
                
                return (__warp_pse_21,);
            }else{
            
                
                let __warp_16_quotient = Uint256(low=0, high=0);
                
                let (__warp_se_159) = warp_uint256(1461501637330902918203684832716283019655932542975);
                
                let (__warp_se_160) = warp_le256(__warp_12_amount, __warp_se_159);
                
                    
                    if (__warp_se_160 != 0){
                    
                        
                        let (__warp_se_161) = warp_shl256(__warp_12_amount, 96);
                        
                        let (__warp_se_162) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_pse_22) = divRoundingUp_40226b32(__warp_se_161, __warp_se_162);
                        
                        let __warp_16_quotient = __warp_pse_22;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_16_quotient = __warp_16_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }else{
                    
                        
                        let (__warp_se_163) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_pse_23) = mulDivRoundingUp_0af8b27f(__warp_12_amount, Uint256(low=79228162514264337593543950336, high=0), __warp_se_163);
                        
                        let __warp_16_quotient = __warp_pse_23;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_16_quotient = __warp_16_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_16_quotient = __warp_16_quotient;
                    tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                
                let (__warp_se_164) = warp_uint256(__warp_10_sqrtPX96);
                
                let (__warp_se_165) = warp_gt256(__warp_se_164, __warp_16_quotient);
                
                assert __warp_se_165 = 1;
                
                let (__warp_se_166) = warp_uint256(__warp_10_sqrtPX96);
                
                let (__warp_se_167) = warp_sub_unsafe256(__warp_se_166, __warp_16_quotient);
                
                let (__warp_se_168) = warp_int256_to_int160(__warp_se_167);
                
                
                
                return (__warp_se_168,);
            }

    }

    // @notice Gets the next sqrt price given an input amount of token0 or token1
    // @dev Throws if price or liquidity are 0, or if the next price is out of bounds
    // @param sqrtPX96 The starting price, i.e., before accounting for the input amount
    // @param liquidity The amount of usable liquidity
    // @param amountIn How much of token0, or token1, is being swapped in
    // @param zeroForOne Whether the amount in is token0 or token1
    // @return sqrtQX96 The price after adding the input amount to token0 or token1
    func getNextSqrtPriceFromInput_aa58276a{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_17_sqrtPX96 : felt, __warp_18_liquidity : felt, __warp_19_amountIn : Uint256, __warp_20_zeroForOne : felt)-> (sqrtQX96 : felt){
    alloc_locals;


        
        let (__warp_se_169) = warp_gt(__warp_17_sqrtPX96, 0);
        
        assert __warp_se_169 = 1;
        
        let (__warp_se_170) = warp_gt(__warp_18_liquidity, 0);
        
        assert __warp_se_170 = 1;
        
        if (__warp_20_zeroForOne != 0){
        
            
            let (__warp_pse_24) = getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_17_sqrtPX96, __warp_18_liquidity, __warp_19_amountIn, 1);
            
            
            
            return (__warp_pse_24,);
        }else{
        
            
            let (__warp_pse_25) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_17_sqrtPX96, __warp_18_liquidity, __warp_19_amountIn, 1);
            
            
            
            return (__warp_pse_25,);
        }

    }

    // @notice Gets the next sqrt price given an output amount of token0 or token1
    // @dev Throws if price or liquidity are 0 or the next price is out of bounds
    // @param sqrtPX96 The starting price before accounting for the output amount
    // @param liquidity The amount of usable liquidity
    // @param amountOut How much of token0, or token1, is being swapped out
    // @param zeroForOne Whether the amount out is token0 or token1
    // @return sqrtQX96 The price after removing the output amount of token0 or token1
    func getNextSqrtPriceFromOutput_fedf2b5f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_21_sqrtPX96 : felt, __warp_22_liquidity : felt, __warp_23_amountOut : Uint256, __warp_24_zeroForOne : felt)-> (sqrtQX96 : felt){
    alloc_locals;


        
        let (__warp_se_171) = warp_gt(__warp_21_sqrtPX96, 0);
        
        assert __warp_se_171 = 1;
        
        let (__warp_se_172) = warp_gt(__warp_22_liquidity, 0);
        
        assert __warp_se_172 = 1;
        
        if (__warp_24_zeroForOne != 0){
        
            
            let (__warp_pse_26) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_21_sqrtPX96, __warp_22_liquidity, __warp_23_amountOut, 0);
            
            
            
            return (__warp_pse_26,);
        }else{
        
            
            let (__warp_pse_27) = getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_21_sqrtPX96, __warp_22_liquidity, __warp_23_amountOut, 0);
            
            
            
            return (__warp_pse_27,);
        }

    }

    // @notice Gets the amount0 delta between two prices
    // @dev Calculates liquidity / sqrt(lower) - liquidity / sqrt(upper),
    // i.e. liquidity * (sqrt(upper) - sqrt(lower)) / (sqrt(upper) * sqrt(lower))
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The amount of usable liquidity
    // @param roundUp Whether to round the amount up or down
    // @return amount0 Amount of token0 required to cover a position of size liquidity between the two passed prices
    func getAmount0Delta_2c32d4b6{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_25_sqrtRatioAX96 : felt, __warp_26_sqrtRatioBX96 : felt, __warp_27_liquidity : felt, __warp_28_roundUp : felt)-> (amount0 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_173) = warp_gt(__warp_25_sqrtRatioAX96, __warp_26_sqrtRatioBX96);
            
                
                if (__warp_se_173 != 0){
                
                    
                    let __warp_tv_30 = __warp_26_sqrtRatioBX96;
                    
                    let __warp_tv_31 = __warp_25_sqrtRatioAX96;
                    
                    let __warp_26_sqrtRatioBX96 = __warp_tv_31;
                    
                    let __warp_25_sqrtRatioAX96 = __warp_tv_30;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_28_roundUp = __warp_28_roundUp;
                    tempvar __warp_25_sqrtRatioAX96 = __warp_25_sqrtRatioAX96;
                    tempvar __warp_26_sqrtRatioBX96 = __warp_26_sqrtRatioBX96;
                    tempvar __warp_27_liquidity = __warp_27_liquidity;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_28_roundUp = __warp_28_roundUp;
                    tempvar __warp_25_sqrtRatioAX96 = __warp_25_sqrtRatioAX96;
                    tempvar __warp_26_sqrtRatioBX96 = __warp_26_sqrtRatioBX96;
                    tempvar __warp_27_liquidity = __warp_27_liquidity;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_28_roundUp = __warp_28_roundUp;
                tempvar __warp_25_sqrtRatioAX96 = __warp_25_sqrtRatioAX96;
                tempvar __warp_26_sqrtRatioBX96 = __warp_26_sqrtRatioBX96;
                tempvar __warp_27_liquidity = __warp_27_liquidity;
            
            let (__warp_se_174) = warp_uint256(__warp_27_liquidity);
            
            let (__warp_29_numerator1) = warp_shl256(__warp_se_174, 96);
            
            let (__warp_se_175) = warp_sub_unsafe160(__warp_26_sqrtRatioBX96, __warp_25_sqrtRatioAX96);
            
            let (__warp_30_numerator2) = warp_uint256(__warp_se_175);
            
            let (__warp_se_176) = warp_gt(__warp_25_sqrtRatioAX96, 0);
            
            assert __warp_se_176 = 1;
            
            if (__warp_28_roundUp != 0){
            
                
                let (__warp_se_177) = warp_uint256(__warp_26_sqrtRatioBX96);
                
                let (__warp_pse_28) = mulDivRoundingUp_0af8b27f(__warp_29_numerator1, __warp_30_numerator2, __warp_se_177);
                
                let (__warp_se_178) = warp_uint256(__warp_25_sqrtRatioAX96);
                
                let (__warp_pse_29) = divRoundingUp_40226b32(__warp_pse_28, __warp_se_178);
                
                
                
                return (__warp_pse_29,);
            }else{
            
                
                let (__warp_se_179) = warp_uint256(__warp_26_sqrtRatioBX96);
                
                let (__warp_pse_30) = mulDiv_aa9a0912(__warp_29_numerator1, __warp_30_numerator2, __warp_se_179);
                
                let (__warp_se_180) = warp_uint256(__warp_25_sqrtRatioAX96);
                
                let (__warp_se_181) = warp_div_unsafe256(__warp_pse_30, __warp_se_180);
                
                
                
                return (__warp_se_181,);
            }

    }

    // @notice Gets the amount1 delta between two prices
    // @dev Calculates liquidity * (sqrt(upper) - sqrt(lower))
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The amount of usable liquidity
    // @param roundUp Whether to round the amount up, or down
    // @return amount1 Amount of token1 required to cover a position of size liquidity between the two passed prices
    func getAmount1Delta_48a0c5bd{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_31_sqrtRatioAX96 : felt, __warp_32_sqrtRatioBX96 : felt, __warp_33_liquidity : felt, __warp_34_roundUp : felt)-> (amount1 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_182) = warp_gt(__warp_31_sqrtRatioAX96, __warp_32_sqrtRatioBX96);
            
                
                if (__warp_se_182 != 0){
                
                    
                    let __warp_tv_32 = __warp_32_sqrtRatioBX96;
                    
                    let __warp_tv_33 = __warp_31_sqrtRatioAX96;
                    
                    let __warp_32_sqrtRatioBX96 = __warp_tv_33;
                    
                    let __warp_31_sqrtRatioAX96 = __warp_tv_32;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_34_roundUp = __warp_34_roundUp;
                    tempvar __warp_32_sqrtRatioBX96 = __warp_32_sqrtRatioBX96;
                    tempvar __warp_31_sqrtRatioAX96 = __warp_31_sqrtRatioAX96;
                    tempvar __warp_33_liquidity = __warp_33_liquidity;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_34_roundUp = __warp_34_roundUp;
                    tempvar __warp_32_sqrtRatioBX96 = __warp_32_sqrtRatioBX96;
                    tempvar __warp_31_sqrtRatioAX96 = __warp_31_sqrtRatioAX96;
                    tempvar __warp_33_liquidity = __warp_33_liquidity;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_34_roundUp = __warp_34_roundUp;
                tempvar __warp_32_sqrtRatioBX96 = __warp_32_sqrtRatioBX96;
                tempvar __warp_31_sqrtRatioAX96 = __warp_31_sqrtRatioAX96;
                tempvar __warp_33_liquidity = __warp_33_liquidity;
            
            if (__warp_34_roundUp != 0){
            
                
                let (__warp_se_183) = warp_uint256(__warp_33_liquidity);
                
                let (__warp_se_184) = warp_sub_unsafe160(__warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                
                let (__warp_se_185) = warp_uint256(__warp_se_184);
                
                let (__warp_pse_31) = mulDivRoundingUp_0af8b27f(__warp_se_183, __warp_se_185, Uint256(low=79228162514264337593543950336, high=0));
                
                
                
                return (__warp_pse_31,);
            }else{
            
                
                let (__warp_se_186) = warp_uint256(__warp_33_liquidity);
                
                let (__warp_se_187) = warp_sub_unsafe160(__warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                
                let (__warp_se_188) = warp_uint256(__warp_se_187);
                
                let (__warp_pse_32) = mulDiv_aa9a0912(__warp_se_186, __warp_se_188, Uint256(low=79228162514264337593543950336, high=0));
                
                
                
                return (__warp_pse_32,);
            }

    }

    // @notice Helper that gets signed token0 delta
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The change in liquidity for which to compute the amount0 delta
    // @return amount0 Amount of token0 corresponding to the passed liquidityDelta between the two prices
    func getAmount0Delta_c932699b{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_35_sqrtRatioAX96 : felt, __warp_36_sqrtRatioBX96 : felt, __warp_37_liquidity : felt)-> (amount0 : Uint256){
    alloc_locals;


        
        let (__warp_se_189) = warp_lt_signed128(__warp_37_liquidity, 0);
        
        if (__warp_se_189 != 0){
        
            
            let (__warp_se_190) = warp_negate128(__warp_37_liquidity);
            
            let (__warp_pse_33) = getAmount0Delta_2c32d4b6(__warp_35_sqrtRatioAX96, __warp_36_sqrtRatioBX96, __warp_se_190, 0);
            
            let (__warp_pse_34) = toInt256_dfbe873b(__warp_pse_33);
            
            let (__warp_se_191) = warp_negate256(__warp_pse_34);
            
            
            
            return (__warp_se_191,);
        }else{
        
            
            let (__warp_pse_35) = getAmount0Delta_2c32d4b6(__warp_35_sqrtRatioAX96, __warp_36_sqrtRatioBX96, __warp_37_liquidity, 1);
            
            let (__warp_pse_36) = toInt256_dfbe873b(__warp_pse_35);
            
            
            
            return (__warp_pse_36,);
        }

    }

    // @notice Helper that gets signed token1 delta
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The change in liquidity for which to compute the amount1 delta
    // @return amount1 Amount of token1 corresponding to the passed liquidityDelta between the two prices
    func getAmount1Delta_00c11862{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_38_sqrtRatioAX96 : felt, __warp_39_sqrtRatioBX96 : felt, __warp_40_liquidity : felt)-> (amount1 : Uint256){
    alloc_locals;


        
        let (__warp_se_192) = warp_lt_signed128(__warp_40_liquidity, 0);
        
        if (__warp_se_192 != 0){
        
            
            let (__warp_se_193) = warp_negate128(__warp_40_liquidity);
            
            let (__warp_pse_37) = getAmount1Delta_48a0c5bd(__warp_38_sqrtRatioAX96, __warp_39_sqrtRatioBX96, __warp_se_193, 0);
            
            let (__warp_pse_38) = toInt256_dfbe873b(__warp_pse_37);
            
            let (__warp_se_194) = warp_negate256(__warp_pse_38);
            
            
            
            return (__warp_se_194,);
        }else{
        
            
            let (__warp_pse_39) = getAmount1Delta_48a0c5bd(__warp_38_sqrtRatioAX96, __warp_39_sqrtRatioBX96, __warp_40_liquidity, 1);
            
            let (__warp_pse_40) = toInt256_dfbe873b(__warp_pse_39);
            
            
            
            return (__warp_pse_40,);
        }

    }

    // @notice Returns ceil(x / y)
    // @dev division by 0 has unspecified behavior, and must be checked externally
    // @param x The dividend
    // @param y The divisor
    // @return z The quotient, ceil(x / y)
    func divRoundingUp_40226b32{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let __warp_3_temp = Uint256(low=0, high=0);
            
            let (__warp_se_195) = warp_mod256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_196) = warp_gt256(__warp_se_195, Uint256(low=0, high=0));
            
                
                if (__warp_se_196 != 0){
                
                    
                    let __warp_3_temp = Uint256(low=1, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar __warp_2_z = __warp_2_z;
                    tempvar __warp_3_temp = __warp_3_temp;
                    tempvar __warp_0_x = __warp_0_x;
                    tempvar __warp_1_y = __warp_1_y;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar __warp_2_z = __warp_2_z;
                    tempvar __warp_3_temp = __warp_3_temp;
                    tempvar __warp_0_x = __warp_0_x;
                    tempvar __warp_1_y = __warp_1_y;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar __warp_2_z = __warp_2_z;
                tempvar __warp_3_temp = __warp_3_temp;
                tempvar __warp_0_x = __warp_0_x;
                tempvar __warp_1_y = __warp_1_y;
            
            let (__warp_se_197) = warp_div_unsafe256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_198) = warp_add_unsafe256(__warp_se_197, __warp_3_temp);
            
            let __warp_2_z = __warp_se_198;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Returns x + y, reverts if sum overflows uint256
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_771602f7{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_41) = warp_add_unsafe256(__warp_0_x, __warp_1_y);
            
            let __warp_2_z = __warp_pse_41;
            
            let (__warp_se_199) = warp_ge256(__warp_pse_41, __warp_0_x);
            
            assert __warp_se_199 = 1;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Cast a uint256 to a uint160, revert on overflow
    // @param y The uint256 to be downcasted
    // @return z The downcasted integer, now type uint160
    func toUint160_dfef6beb{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_y : Uint256)-> (__warp_1_z : felt){
    alloc_locals;


        
        let __warp_1_z = 0;
        
        let (__warp_pse_46) = warp_int256_to_int160(__warp_0_y);
        
        let __warp_1_z = __warp_pse_46;
        
        let (__warp_se_200) = warp_uint256(__warp_pse_46);
        
        let (__warp_se_201) = warp_eq256(__warp_se_200, __warp_0_y);
        
        assert __warp_se_201 = 1;
        
        
        
        return (__warp_1_z,);

    }

    // @notice Cast a uint256 to a int256, revert on overflow
    // @param y The uint256 to be casted
    // @return z The casted integer, now type int256
    func toInt256_dfbe873b{range_check_ptr : felt}(__warp_4_y : Uint256)-> (__warp_5_z : Uint256){
    alloc_locals;


        
        let __warp_5_z = Uint256(low=0, high=0);
        
        let (__warp_se_202) = warp_lt256(__warp_4_y, Uint256(low=0, high=170141183460469231731687303715884105728));
        
        assert __warp_se_202 = 1;
        
        let __warp_5_z = __warp_4_y;
        
        
        
        return (__warp_5_z,);

    }

}


    @view
    func mulDivRoundingUpInvariants_3d729147{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_y : Uint256, __warp_2_z : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_2_z);
        
        warp_external_input_check_int256(__warp_1_y);
        
        warp_external_input_check_int256(__warp_0_x);
        
        let (__warp_se_0) = warp_gt256(__warp_2_z, Uint256(low=0, high=0));
        
        assert __warp_se_0 = 1;
        
        let (__warp_3_notRoundedUp) = SqrtPriceMathEchidnaTest.mulDiv_aa9a0912(__warp_0_x, __warp_1_y, __warp_2_z);
        
        let (__warp_4_roundedUp) = SqrtPriceMathEchidnaTest.mulDivRoundingUp_0af8b27f(__warp_0_x, __warp_1_y, __warp_2_z);
        
        let (__warp_se_1) = warp_ge256(__warp_4_roundedUp, __warp_3_notRoundedUp);
        
        assert __warp_se_1 = 1;
        
        let (__warp_se_2) = warp_sub256(__warp_4_roundedUp, __warp_3_notRoundedUp);
        
        let (__warp_se_3) = warp_lt256(__warp_se_2, Uint256(low=2, high=0));
        
        assert __warp_se_3 = 1;
        
        let (__warp_se_4) = warp_sub256(__warp_4_roundedUp, __warp_3_notRoundedUp);
        
        let (__warp_se_5) = warp_eq256(__warp_se_4, Uint256(low=1, high=0));
        
            
            if (__warp_se_5 != 0){
            
                
                let (__warp_se_6) = warp_mulmod(__warp_0_x, __warp_1_y, __warp_2_z);
                
                let (__warp_se_7) = warp_gt256(__warp_se_6, Uint256(low=0, high=0));
                
                assert __warp_se_7 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_8) = warp_mulmod(__warp_0_x, __warp_1_y, __warp_2_z);
                
                let (__warp_se_9) = warp_eq256(__warp_se_8, Uint256(low=0, high=0));
                
                assert __warp_se_9 = 1;
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
    func getNextSqrtPriceFromInputInvariants_1faf4a39{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_sqrtP : felt, __warp_6_liquidity : felt, __warp_7_amountIn : Uint256, __warp_8_zeroForOne : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_8_zeroForOne);
        
        warp_external_input_check_int256(__warp_7_amountIn);
        
        warp_external_input_check_int128(__warp_6_liquidity);
        
        warp_external_input_check_int160(__warp_5_sqrtP);
        
        let (__warp_9_sqrtQ) = SqrtPriceMathEchidnaTest.getNextSqrtPriceFromInput_aa58276a(__warp_5_sqrtP, __warp_6_liquidity, __warp_7_amountIn, __warp_8_zeroForOne);
        
            
            if (__warp_8_zeroForOne != 0){
            
                
                let (__warp_se_10) = warp_le(__warp_9_sqrtQ, __warp_5_sqrtP);
                
                assert __warp_se_10 = 1;
                
                let (__warp_pse_0) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_9_sqrtQ, __warp_5_sqrtP, __warp_6_liquidity, 1);
                
                let (__warp_se_11) = warp_ge256(__warp_7_amountIn, __warp_pse_0);
                
                assert __warp_se_11 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_12) = warp_ge(__warp_9_sqrtQ, __warp_5_sqrtP);
                
                assert __warp_se_12 = 1;
                
                let (__warp_pse_1) = SqrtPriceMathEchidnaTest.getAmount1Delta_48a0c5bd(__warp_5_sqrtP, __warp_9_sqrtQ, __warp_6_liquidity, 1);
                
                let (__warp_se_13) = warp_ge256(__warp_7_amountIn, __warp_pse_1);
                
                assert __warp_se_13 = 1;
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
    func getNextSqrtPriceFromOutputInvariants_f157fb50{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_sqrtP : felt, __warp_11_liquidity : felt, __warp_12_amountOut : Uint256, __warp_13_zeroForOne : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_13_zeroForOne);
        
        warp_external_input_check_int256(__warp_12_amountOut);
        
        warp_external_input_check_int128(__warp_11_liquidity);
        
        warp_external_input_check_int160(__warp_10_sqrtP);
        
        let (__warp_14_sqrtQ) = SqrtPriceMathEchidnaTest.getNextSqrtPriceFromOutput_fedf2b5f(__warp_10_sqrtP, __warp_11_liquidity, __warp_12_amountOut, __warp_13_zeroForOne);
        
            
            if (__warp_13_zeroForOne != 0){
            
                
                let (__warp_se_14) = warp_le(__warp_14_sqrtQ, __warp_10_sqrtP);
                
                assert __warp_se_14 = 1;
                
                let (__warp_pse_2) = SqrtPriceMathEchidnaTest.getAmount1Delta_48a0c5bd(__warp_14_sqrtQ, __warp_10_sqrtP, __warp_11_liquidity, 0);
                
                let (__warp_se_15) = warp_le256(__warp_12_amountOut, __warp_pse_2);
                
                assert __warp_se_15 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_16) = warp_gt(__warp_14_sqrtQ, 0);
                
                assert __warp_se_16 = 1;
                
                let (__warp_se_17) = warp_ge(__warp_14_sqrtQ, __warp_10_sqrtP);
                
                assert __warp_se_17 = 1;
                
                let (__warp_pse_3) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_10_sqrtP, __warp_14_sqrtQ, __warp_11_liquidity, 0);
                
                let (__warp_se_18) = warp_le256(__warp_12_amountOut, __warp_pse_3);
                
                assert __warp_se_18 = 1;
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
    func getNextSqrtPriceFromAmount0RoundingUpInvariants_b46e6714{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_15_sqrtPX96 : felt, __warp_16_liquidity : felt, __warp_17_amount : Uint256, __warp_18_add : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_18_add);
        
        warp_external_input_check_int256(__warp_17_amount);
        
        warp_external_input_check_int128(__warp_16_liquidity);
        
        warp_external_input_check_int160(__warp_15_sqrtPX96);
        
        let (__warp_se_19) = warp_gt(__warp_15_sqrtPX96, 0);
        
        assert __warp_se_19 = 1;
        
        let (__warp_se_20) = warp_gt(__warp_16_liquidity, 0);
        
        assert __warp_se_20 = 1;
        
        let (__warp_19_sqrtQX96) = SqrtPriceMathEchidnaTest.getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_15_sqrtPX96, __warp_16_liquidity, __warp_17_amount, __warp_18_add);
        
            
            if (__warp_18_add != 0){
            
                
                let (__warp_se_21) = warp_le(__warp_19_sqrtQX96, __warp_15_sqrtPX96);
                
                assert __warp_se_21 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_15_sqrtPX96 = __warp_15_sqrtPX96;
                tempvar __warp_19_sqrtQX96 = __warp_19_sqrtQX96;
                tempvar __warp_17_amount = __warp_17_amount;
            }else{
            
                
                let (__warp_se_22) = warp_ge(__warp_19_sqrtQX96, __warp_15_sqrtPX96);
                
                assert __warp_se_22 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_15_sqrtPX96 = __warp_15_sqrtPX96;
                tempvar __warp_19_sqrtQX96 = __warp_19_sqrtQX96;
                tempvar __warp_17_amount = __warp_17_amount;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_15_sqrtPX96 = __warp_15_sqrtPX96;
            tempvar __warp_19_sqrtQX96 = __warp_19_sqrtQX96;
            tempvar __warp_17_amount = __warp_17_amount;
        
        let (__warp_se_23) = warp_eq256(__warp_17_amount, Uint256(low=0, high=0));
        
            
            if (__warp_se_23 != 0){
            
                
                let (__warp_se_24) = warp_eq(__warp_15_sqrtPX96, __warp_19_sqrtQX96);
                
                assert __warp_se_24 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
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
    func getNextSqrtPriceFromAmount1RoundingDownInvariants_21e14f8b{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_20_sqrtPX96 : felt, __warp_21_liquidity : felt, __warp_22_amount : Uint256, __warp_23_add : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_23_add);
        
        warp_external_input_check_int256(__warp_22_amount);
        
        warp_external_input_check_int128(__warp_21_liquidity);
        
        warp_external_input_check_int160(__warp_20_sqrtPX96);
        
        let (__warp_se_25) = warp_gt(__warp_20_sqrtPX96, 0);
        
        assert __warp_se_25 = 1;
        
        let (__warp_se_26) = warp_gt(__warp_21_liquidity, 0);
        
        assert __warp_se_26 = 1;
        
        let (__warp_24_sqrtQX96) = SqrtPriceMathEchidnaTest.getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_20_sqrtPX96, __warp_21_liquidity, __warp_22_amount, __warp_23_add);
        
            
            if (__warp_23_add != 0){
            
                
                let (__warp_se_27) = warp_ge(__warp_24_sqrtQX96, __warp_20_sqrtPX96);
                
                assert __warp_se_27 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_20_sqrtPX96 = __warp_20_sqrtPX96;
                tempvar __warp_24_sqrtQX96 = __warp_24_sqrtQX96;
                tempvar __warp_22_amount = __warp_22_amount;
            }else{
            
                
                let (__warp_se_28) = warp_le(__warp_24_sqrtQX96, __warp_20_sqrtPX96);
                
                assert __warp_se_28 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_20_sqrtPX96 = __warp_20_sqrtPX96;
                tempvar __warp_24_sqrtQX96 = __warp_24_sqrtQX96;
                tempvar __warp_22_amount = __warp_22_amount;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_20_sqrtPX96 = __warp_20_sqrtPX96;
            tempvar __warp_24_sqrtQX96 = __warp_24_sqrtQX96;
            tempvar __warp_22_amount = __warp_22_amount;
        
        let (__warp_se_29) = warp_eq256(__warp_22_amount, Uint256(low=0, high=0));
        
            
            if (__warp_se_29 != 0){
            
                
                let (__warp_se_30) = warp_eq(__warp_20_sqrtPX96, __warp_24_sqrtQX96);
                
                assert __warp_se_30 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
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
    func getAmount0DeltaInvariants_3001e65e{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_25_sqrtP : felt, __warp_26_sqrtQ : felt, __warp_27_liquidity : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_27_liquidity);
        
        warp_external_input_check_int160(__warp_26_sqrtQ);
        
        warp_external_input_check_int160(__warp_25_sqrtP);
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_tv_1, __warp_tv_2) = SqrtPriceMathEchidnaTest.__warp_conditional_getAmount0DeltaInvariants_3001e65e_1(__warp_25_sqrtP, __warp_26_sqrtQ);
            
            let __warp_26_sqrtQ = __warp_tv_2;
            
            let __warp_25_sqrtP = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
        assert __warp_rc_0 = 1;
        
        let (__warp_28_amount0Down) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_26_sqrtQ, __warp_25_sqrtP, __warp_27_liquidity, 0);
        
        let (__warp_pse_4) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_25_sqrtP, __warp_26_sqrtQ, __warp_27_liquidity, 0);
        
        let (__warp_se_33) = warp_eq256(__warp_28_amount0Down, __warp_pse_4);
        
        assert __warp_se_33 = 1;
        
        let (__warp_29_amount0Up) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_26_sqrtQ, __warp_25_sqrtP, __warp_27_liquidity, 1);
        
        let (__warp_pse_5) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_25_sqrtP, __warp_26_sqrtQ, __warp_27_liquidity, 1);
        
        let (__warp_se_34) = warp_eq256(__warp_29_amount0Up, __warp_pse_5);
        
        assert __warp_se_34 = 1;
        
        let (__warp_se_35) = warp_le256(__warp_28_amount0Down, __warp_29_amount0Up);
        
        assert __warp_se_35 = 1;
        
        let (__warp_se_36) = warp_sub256(__warp_29_amount0Up, __warp_28_amount0Down);
        
        let (__warp_se_37) = warp_lt256(__warp_se_36, Uint256(low=2, high=0));
        
        assert __warp_se_37 = 1;
        
        
        
        return ();

    }


    @view
    func getAmount0DeltaEquivalency_8e13a4b9{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_30_sqrtP : felt, __warp_31_sqrtQ : felt, __warp_32_liquidity : felt, __warp_33_roundUp : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_33_roundUp);
        
        warp_external_input_check_int128(__warp_32_liquidity);
        
        warp_external_input_check_int160(__warp_31_sqrtQ);
        
        warp_external_input_check_int160(__warp_30_sqrtP);
        
        let (__warp_se_40) = warp_ge(__warp_30_sqrtP, __warp_31_sqrtQ);
        
        assert __warp_se_40 = 1;
        
        let __warp_rc_2 = 0;
        
            
            let (__warp_tv_3, __warp_tv_4, __warp_tv_5) = SqrtPriceMathEchidnaTest.__warp_conditional_getAmount0DeltaEquivalency_8e13a4b9_3(__warp_30_sqrtP, __warp_31_sqrtQ);
            
            let __warp_31_sqrtQ = __warp_tv_5;
            
            let __warp_30_sqrtP = __warp_tv_4;
            
            let __warp_rc_2 = __warp_tv_3;
        
        assert __warp_rc_2 = 1;
        
        let (__warp_se_41) = warp_mul160(__warp_30_sqrtP, __warp_31_sqrtQ);
        
        let (__warp_se_42) = warp_div(__warp_se_41, __warp_30_sqrtP);
        
        let (__warp_se_43) = warp_eq(__warp_se_42, __warp_31_sqrtQ);
        
        assert __warp_se_43 = 1;
        
        let (__warp_se_44) = warp_uint256(__warp_32_liquidity);
        
        let (__warp_34_numerator1) = warp_shl256(__warp_se_44, 96);
        
        let (__warp_se_45) = warp_sub(__warp_30_sqrtP, __warp_31_sqrtQ);
        
        let (__warp_35_numerator2) = warp_uint256(__warp_se_45);
        
        let (__warp_se_46) = warp_uint256(__warp_30_sqrtP);
        
        let (__warp_se_47) = warp_uint256(__warp_31_sqrtQ);
        
        let (__warp_36_denominator) = warp_mul256(__warp_se_46, __warp_se_47);
        
        let __warp_37_safeResult = Uint256(low=0, high=0);
        
            
            if (__warp_33_roundUp != 0){
            
                
                let (__warp_pse_6) = SqrtPriceMathEchidnaTest.mulDivRoundingUp_0af8b27f(__warp_34_numerator1, __warp_35_numerator2, __warp_36_denominator);
                
                let __warp_37_safeResult = __warp_pse_6;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_37_safeResult = __warp_37_safeResult;
                tempvar __warp_31_sqrtQ = __warp_31_sqrtQ;
                tempvar __warp_30_sqrtP = __warp_30_sqrtP;
                tempvar __warp_32_liquidity = __warp_32_liquidity;
                tempvar __warp_33_roundUp = __warp_33_roundUp;
            }else{
            
                
                let (__warp_pse_7) = SqrtPriceMathEchidnaTest.mulDiv_aa9a0912(__warp_34_numerator1, __warp_35_numerator2, __warp_36_denominator);
                
                let __warp_37_safeResult = __warp_pse_7;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_37_safeResult = __warp_37_safeResult;
                tempvar __warp_31_sqrtQ = __warp_31_sqrtQ;
                tempvar __warp_30_sqrtP = __warp_30_sqrtP;
                tempvar __warp_32_liquidity = __warp_32_liquidity;
                tempvar __warp_33_roundUp = __warp_33_roundUp;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_37_safeResult = __warp_37_safeResult;
            tempvar __warp_31_sqrtQ = __warp_31_sqrtQ;
            tempvar __warp_30_sqrtP = __warp_30_sqrtP;
            tempvar __warp_32_liquidity = __warp_32_liquidity;
            tempvar __warp_33_roundUp = __warp_33_roundUp;
        
        let (__warp_38_fullResult) = SqrtPriceMathEchidnaTest.getAmount0Delta_2c32d4b6(__warp_31_sqrtQ, __warp_30_sqrtP, __warp_32_liquidity, __warp_33_roundUp);
        
        let (__warp_se_48) = warp_eq256(__warp_37_safeResult, __warp_38_fullResult);
        
        assert __warp_se_48 = 1;
        
        
        
        return ();

    }


    @view
    func getAmount1DeltaInvariants_c8569d88{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_39_sqrtP : felt, __warp_40_sqrtQ : felt, __warp_41_liquidity : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_41_liquidity);
        
        warp_external_input_check_int160(__warp_40_sqrtQ);
        
        warp_external_input_check_int160(__warp_39_sqrtP);
        
        let __warp_rc_4 = 0;
        
            
            let (__warp_tv_6, __warp_tv_7, __warp_tv_8) = SqrtPriceMathEchidnaTest.__warp_conditional_getAmount1DeltaInvariants_c8569d88_5(__warp_39_sqrtP, __warp_40_sqrtQ);
            
            let __warp_40_sqrtQ = __warp_tv_8;
            
            let __warp_39_sqrtP = __warp_tv_7;
            
            let __warp_rc_4 = __warp_tv_6;
        
        assert __warp_rc_4 = 1;
        
        let (__warp_42_amount1Down) = SqrtPriceMathEchidnaTest.getAmount1Delta_48a0c5bd(__warp_39_sqrtP, __warp_40_sqrtQ, __warp_41_liquidity, 0);
        
        let (__warp_pse_8) = SqrtPriceMathEchidnaTest.getAmount1Delta_48a0c5bd(__warp_40_sqrtQ, __warp_39_sqrtP, __warp_41_liquidity, 0);
        
        let (__warp_se_51) = warp_eq256(__warp_42_amount1Down, __warp_pse_8);
        
        assert __warp_se_51 = 1;
        
        let (__warp_43_amount1Up) = SqrtPriceMathEchidnaTest.getAmount1Delta_48a0c5bd(__warp_39_sqrtP, __warp_40_sqrtQ, __warp_41_liquidity, 1);
        
        let (__warp_pse_9) = SqrtPriceMathEchidnaTest.getAmount1Delta_48a0c5bd(__warp_40_sqrtQ, __warp_39_sqrtP, __warp_41_liquidity, 1);
        
        let (__warp_se_52) = warp_eq256(__warp_43_amount1Up, __warp_pse_9);
        
        assert __warp_se_52 = 1;
        
        let (__warp_se_53) = warp_le256(__warp_42_amount1Down, __warp_43_amount1Up);
        
        assert __warp_se_53 = 1;
        
        let (__warp_se_54) = warp_sub256(__warp_43_amount1Up, __warp_42_amount1Down);
        
        let (__warp_se_55) = warp_lt256(__warp_se_54, Uint256(low=2, high=0));
        
        assert __warp_se_55 = 1;
        
        
        
        return ();

    }


    @view
    func getAmount0DeltaSignedInvariants_b29f199e{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_44_sqrtP : felt, __warp_45_sqrtQ : felt, __warp_46_liquidity : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_46_liquidity);
        
        warp_external_input_check_int160(__warp_45_sqrtQ);
        
        warp_external_input_check_int160(__warp_44_sqrtP);
        
        let __warp_rc_6 = 0;
        
            
            let (__warp_tv_9, __warp_tv_10, __warp_tv_11) = SqrtPriceMathEchidnaTest.__warp_conditional_getAmount0DeltaSignedInvariants_b29f199e_7(__warp_44_sqrtP, __warp_45_sqrtQ);
            
            let __warp_45_sqrtQ = __warp_tv_11;
            
            let __warp_44_sqrtP = __warp_tv_10;
            
            let __warp_rc_6 = __warp_tv_9;
        
        assert __warp_rc_6 = 1;
        
        let (__warp_47_amount0) = SqrtPriceMathEchidnaTest.getAmount0Delta_c932699b(__warp_45_sqrtQ, __warp_44_sqrtP, __warp_46_liquidity);
        
        let (__warp_se_58) = warp_lt_signed128(__warp_46_liquidity, 0);
        
            
            if (__warp_se_58 != 0){
            
                
                let (__warp_se_59) = warp_le_signed256(__warp_47_amount0, Uint256(low=0, high=0));
                
                assert __warp_se_59 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_47_amount0 = __warp_47_amount0;
                tempvar __warp_46_liquidity = __warp_46_liquidity;
                tempvar __warp_44_sqrtP = __warp_44_sqrtP;
                tempvar __warp_45_sqrtQ = __warp_45_sqrtQ;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_47_amount0 = __warp_47_amount0;
                tempvar __warp_46_liquidity = __warp_46_liquidity;
                tempvar __warp_44_sqrtP = __warp_44_sqrtP;
                tempvar __warp_45_sqrtQ = __warp_45_sqrtQ;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_47_amount0 = __warp_47_amount0;
            tempvar __warp_46_liquidity = __warp_46_liquidity;
            tempvar __warp_44_sqrtP = __warp_44_sqrtP;
            tempvar __warp_45_sqrtQ = __warp_45_sqrtQ;
        
        let (__warp_se_60) = warp_gt_signed128(__warp_46_liquidity, 0);
        
            
            if (__warp_se_60 != 0){
            
                
                let (__warp_se_61) = warp_eq(__warp_44_sqrtP, __warp_45_sqrtQ);
                
                    
                    if (__warp_se_61 != 0){
                    
                        
                        let (__warp_se_62) = warp_eq256(__warp_47_amount0, Uint256(low=0, high=0));
                        
                        assert __warp_se_62 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_47_amount0 = __warp_47_amount0;
                        tempvar __warp_46_liquidity = __warp_46_liquidity;
                    }else{
                    
                        
                        let (__warp_se_63) = warp_gt_signed256(__warp_47_amount0, Uint256(low=0, high=0));
                        
                        assert __warp_se_63 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_47_amount0 = __warp_47_amount0;
                        tempvar __warp_46_liquidity = __warp_46_liquidity;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_47_amount0 = __warp_47_amount0;
                    tempvar __warp_46_liquidity = __warp_46_liquidity;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_47_amount0 = __warp_47_amount0;
                tempvar __warp_46_liquidity = __warp_46_liquidity;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_47_amount0 = __warp_47_amount0;
                tempvar __warp_46_liquidity = __warp_46_liquidity;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_47_amount0 = __warp_47_amount0;
            tempvar __warp_46_liquidity = __warp_46_liquidity;
        
        let (__warp_se_64) = warp_eq(__warp_46_liquidity, 0);
        
            
            if (__warp_se_64 != 0){
            
                
                let (__warp_se_65) = warp_eq256(__warp_47_amount0, Uint256(low=0, high=0));
                
                assert __warp_se_65 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
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
    func getAmount1DeltaSignedInvariants_6e6238d7{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_48_sqrtP : felt, __warp_49_sqrtQ : felt, __warp_50_liquidity : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_50_liquidity);
        
        warp_external_input_check_int160(__warp_49_sqrtQ);
        
        warp_external_input_check_int160(__warp_48_sqrtP);
        
        let __warp_rc_8 = 0;
        
            
            let (__warp_tv_12, __warp_tv_13, __warp_tv_14) = SqrtPriceMathEchidnaTest.__warp_conditional_getAmount1DeltaSignedInvariants_6e6238d7_9(__warp_48_sqrtP, __warp_49_sqrtQ);
            
            let __warp_49_sqrtQ = __warp_tv_14;
            
            let __warp_48_sqrtP = __warp_tv_13;
            
            let __warp_rc_8 = __warp_tv_12;
        
        assert __warp_rc_8 = 1;
        
        let (__warp_51_amount1) = SqrtPriceMathEchidnaTest.getAmount1Delta_00c11862(__warp_48_sqrtP, __warp_49_sqrtQ, __warp_50_liquidity);
        
        let (__warp_se_68) = warp_lt_signed128(__warp_50_liquidity, 0);
        
            
            if (__warp_se_68 != 0){
            
                
                let (__warp_se_69) = warp_le_signed256(__warp_51_amount1, Uint256(low=0, high=0));
                
                assert __warp_se_69 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_51_amount1 = __warp_51_amount1;
                tempvar __warp_50_liquidity = __warp_50_liquidity;
                tempvar __warp_48_sqrtP = __warp_48_sqrtP;
                tempvar __warp_49_sqrtQ = __warp_49_sqrtQ;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_51_amount1 = __warp_51_amount1;
                tempvar __warp_50_liquidity = __warp_50_liquidity;
                tempvar __warp_48_sqrtP = __warp_48_sqrtP;
                tempvar __warp_49_sqrtQ = __warp_49_sqrtQ;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_51_amount1 = __warp_51_amount1;
            tempvar __warp_50_liquidity = __warp_50_liquidity;
            tempvar __warp_48_sqrtP = __warp_48_sqrtP;
            tempvar __warp_49_sqrtQ = __warp_49_sqrtQ;
        
        let (__warp_se_70) = warp_gt_signed128(__warp_50_liquidity, 0);
        
            
            if (__warp_se_70 != 0){
            
                
                let (__warp_se_71) = warp_eq(__warp_48_sqrtP, __warp_49_sqrtQ);
                
                    
                    if (__warp_se_71 != 0){
                    
                        
                        let (__warp_se_72) = warp_eq256(__warp_51_amount1, Uint256(low=0, high=0));
                        
                        assert __warp_se_72 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_51_amount1 = __warp_51_amount1;
                        tempvar __warp_50_liquidity = __warp_50_liquidity;
                    }else{
                    
                        
                        let (__warp_se_73) = warp_gt_signed256(__warp_51_amount1, Uint256(low=0, high=0));
                        
                        assert __warp_se_73 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_51_amount1 = __warp_51_amount1;
                        tempvar __warp_50_liquidity = __warp_50_liquidity;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_51_amount1 = __warp_51_amount1;
                    tempvar __warp_50_liquidity = __warp_50_liquidity;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_51_amount1 = __warp_51_amount1;
                tempvar __warp_50_liquidity = __warp_50_liquidity;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_51_amount1 = __warp_51_amount1;
                tempvar __warp_50_liquidity = __warp_50_liquidity;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_51_amount1 = __warp_51_amount1;
            tempvar __warp_50_liquidity = __warp_50_liquidity;
        
        let (__warp_se_74) = warp_eq(__warp_50_liquidity, 0);
        
            
            if (__warp_se_74 != 0){
            
                
                let (__warp_se_75) = warp_eq256(__warp_51_amount1, Uint256(low=0, high=0));
                
                assert __warp_se_75 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
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
    func getOutOfRangeMintInvariants_b712c47c{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_52_sqrtA : felt, __warp_53_sqrtB : felt, __warp_54_liquidity : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_54_liquidity);
        
        warp_external_input_check_int160(__warp_53_sqrtB);
        
        warp_external_input_check_int160(__warp_52_sqrtA);
        
        let __warp_rc_10 = 0;
        
            
            let (__warp_tv_15, __warp_tv_16, __warp_tv_17) = SqrtPriceMathEchidnaTest.__warp_conditional_getOutOfRangeMintInvariants_b712c47c_11(__warp_52_sqrtA, __warp_53_sqrtB);
            
            let __warp_53_sqrtB = __warp_tv_17;
            
            let __warp_52_sqrtA = __warp_tv_16;
            
            let __warp_rc_10 = __warp_tv_15;
        
        assert __warp_rc_10 = 1;
        
        let (__warp_se_78) = warp_gt_signed128(__warp_54_liquidity, 0);
        
        assert __warp_se_78 = 1;
        
        let (__warp_55_amount0) = SqrtPriceMathEchidnaTest.getAmount0Delta_c932699b(__warp_52_sqrtA, __warp_53_sqrtB, __warp_54_liquidity);
        
        let (__warp_56_amount1) = SqrtPriceMathEchidnaTest.getAmount1Delta_00c11862(__warp_52_sqrtA, __warp_53_sqrtB, __warp_54_liquidity);
        
        let (__warp_se_79) = warp_eq(__warp_52_sqrtA, __warp_53_sqrtB);
        
            
            if (__warp_se_79 != 0){
            
                
                let (__warp_se_80) = warp_eq256(__warp_55_amount0, Uint256(low=0, high=0));
                
                assert __warp_se_80 = 1;
                
                let (__warp_se_81) = warp_eq256(__warp_56_amount1, Uint256(low=0, high=0));
                
                assert __warp_se_81 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_82) = warp_gt_signed256(__warp_55_amount0, Uint256(low=0, high=0));
                
                assert __warp_se_82 = 1;
                
                let (__warp_se_83) = warp_gt_signed256(__warp_56_amount1, Uint256(low=0, high=0));
                
                assert __warp_se_83 = 1;
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
    func getInRangeMintInvariants_39933d51{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_57_sqrtLower : felt, __warp_58_sqrtCurrent : felt, __warp_59_sqrtUpper : felt, __warp_60_liquidity : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_60_liquidity);
        
        warp_external_input_check_int160(__warp_59_sqrtUpper);
        
        warp_external_input_check_int160(__warp_58_sqrtCurrent);
        
        warp_external_input_check_int160(__warp_57_sqrtLower);
        
        let (__warp_se_88) = warp_gt(__warp_57_sqrtLower, 0);
        
        assert __warp_se_88 = 1;
        
        let (__warp_se_89) = warp_lt(__warp_57_sqrtLower, __warp_59_sqrtUpper);
        
        assert __warp_se_89 = 1;
        
        let __warp_rc_12 = 0;
        
            
            let (__warp_tv_18, __warp_tv_19, __warp_tv_20, __warp_tv_21) = SqrtPriceMathEchidnaTest.__warp_conditional_getInRangeMintInvariants_39933d51_13(__warp_57_sqrtLower, __warp_58_sqrtCurrent, __warp_59_sqrtUpper);
            
            let __warp_59_sqrtUpper = __warp_tv_21;
            
            let __warp_58_sqrtCurrent = __warp_tv_20;
            
            let __warp_57_sqrtLower = __warp_tv_19;
            
            let __warp_rc_12 = __warp_tv_18;
        
        assert __warp_rc_12 = 1;
        
        let (__warp_se_90) = warp_gt_signed128(__warp_60_liquidity, 0);
        
        assert __warp_se_90 = 1;
        
        let (__warp_61_amount0) = SqrtPriceMathEchidnaTest.getAmount0Delta_c932699b(__warp_58_sqrtCurrent, __warp_59_sqrtUpper, __warp_60_liquidity);
        
        let (__warp_62_amount1) = SqrtPriceMathEchidnaTest.getAmount1Delta_00c11862(__warp_57_sqrtLower, __warp_58_sqrtCurrent, __warp_60_liquidity);
        
        let __warp_rc_14 = 0;
        
            
            let (__warp_tv_22, __warp_tv_23, __warp_tv_24) = SqrtPriceMathEchidnaTest.__warp_conditional_getInRangeMintInvariants_39933d51_15(__warp_61_amount0, __warp_62_amount1);
            
            let __warp_62_amount1 = __warp_tv_24;
            
            let __warp_61_amount0 = __warp_tv_23;
            
            let __warp_rc_14 = __warp_tv_22;
        
        assert __warp_rc_14 = 1;
        
        
        
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