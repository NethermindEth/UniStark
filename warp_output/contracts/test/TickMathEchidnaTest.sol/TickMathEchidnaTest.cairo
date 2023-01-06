%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int24, warp_external_input_check_int160
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.sub_signed import warp_sub_signed24
from warplib.maths.lt import warp_lt
from warplib.maths.add_signed import warp_add_signed24
from warplib.maths.ge import warp_ge, warp_ge256
from warplib.maths.le import warp_le, warp_le256
from warplib.maths.ge_signed import warp_ge_signed24
from warplib.maths.lt_signed import warp_lt_signed24
from warplib.maths.int_conversions import warp_int24_to_int256, warp_uint256, warp_int256_to_int160, warp_int256_to_int24
from warplib.maths.negate import warp_negate256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.neq import warp_neq256
from warplib.maths.mul_unsafe import warp_mul_unsafe256
from warplib.maths.shr import warp_shr256, warp_shr256_256
from warplib.maths.gt_signed import warp_gt_signed24
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.mod import warp_mod256
from warplib.maths.eq import warp_eq256, warp_eq
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.shl import warp_shl256, warp_shl256_256
from warplib.maths.gt import warp_gt256
from warplib.maths.bitwise_or import warp_bitwise_or256
from warplib.maths.sub_unsafe import warp_sub_unsafe256
from warplib.maths.sub_signed_unsafe import warp_sub_signed_unsafe256
from warplib.maths.mul_signed_unsafe import warp_mul_signed_unsafe256
from warplib.maths.shr_signed import warp_shr_signed256
from warplib.maths.add_signed_unsafe import warp_add_signed_unsafe256


// Contract Def TickMathEchidnaTest


namespace TickMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_checkGetSqrtRatioAtTickInvariants_47d38f4d_1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tick : felt, __warp_1_ratio : felt)-> (__warp_rc_0 : felt, __warp_0_tick : felt, __warp_1_ratio : felt){
    alloc_locals;


        
        let (__warp_se_0) = warp_sub_signed24(__warp_0_tick, 1);
        
        let (__warp_pse_0) = getSqrtRatioAtTick_986cfba3(__warp_se_0);
        
        let (__warp_se_1) = warp_lt(__warp_pse_0, __warp_1_ratio);
        
        if (__warp_se_1 != 0){
        
            
            let (__warp_se_2) = warp_add_signed24(__warp_0_tick, 1);
            
            let (__warp_pse_1) = getSqrtRatioAtTick_986cfba3(__warp_se_2);
            
            let (__warp_se_3) = warp_lt(__warp_1_ratio, __warp_pse_1);
            
            let __warp_rc_0 = __warp_se_3;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_0_tick = __warp_0_tick;
            
            let __warp_1_ratio = __warp_1_ratio;
            
            
            
            return (__warp_rc_0, __warp_0_tick, __warp_1_ratio);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_0_tick = __warp_0_tick;
            
            let __warp_1_ratio = __warp_1_ratio;
            
            
            
            return (__warp_rc_0, __warp_0_tick, __warp_1_ratio);
        }

    }


    func __warp_conditional_checkGetTickAtSqrtRatioInvariants_df01e52d_3{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_ratio : felt, __warp_3_tick : felt)-> (__warp_rc_2 : felt, __warp_2_ratio : felt, __warp_3_tick : felt){
    alloc_locals;


        
        let (__warp_pse_2) = getSqrtRatioAtTick_986cfba3(__warp_3_tick);
        
        let (__warp_se_6) = warp_ge(__warp_2_ratio, __warp_pse_2);
        
        if (__warp_se_6 != 0){
        
            
            let (__warp_se_7) = warp_add_signed24(__warp_3_tick, 1);
            
            let (__warp_pse_3) = getSqrtRatioAtTick_986cfba3(__warp_se_7);
            
            let (__warp_se_8) = warp_lt(__warp_2_ratio, __warp_pse_3);
            
            let __warp_rc_2 = __warp_se_8;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_2_ratio = __warp_2_ratio;
            
            let __warp_3_tick = __warp_3_tick;
            
            
            
            return (__warp_rc_2, __warp_2_ratio, __warp_3_tick);
        }else{
        
            
            let __warp_rc_2 = 0;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_2_ratio = __warp_2_ratio;
            
            let __warp_3_tick = __warp_3_tick;
            
            
            
            return (__warp_rc_2, __warp_2_ratio, __warp_3_tick);
        }

    }

    // @notice Calculates sqrt(1.0001^tick) * 2^96
    // @dev Throws if |tick| > max tick
    // @param tick The input tick for the above formula
    // @return sqrtPriceX96 A Fixed point Q64.96 number representing the sqrt of the ratio of the two assets (token1/token0)
    // at the given tick
    func getSqrtRatioAtTick_986cfba3{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tick : felt)-> (__warp_1_sqrtPriceX96 : felt){
    alloc_locals;


        
        let __warp_1_sqrtPriceX96 = 0;
        
            
            let __warp_2_absTick = Uint256(low=0, high=0);
            
            let (__warp_se_11) = warp_lt_signed24(__warp_0_tick, 0);
            
                
                if (__warp_se_11 != 0){
                
                    
                    let (__warp_se_12) = warp_int24_to_int256(__warp_0_tick);
                    
                    let (__warp_se_13) = warp_negate256(__warp_se_12);
                    
                    let __warp_2_absTick = __warp_se_13;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    
                    let (__warp_se_14) = warp_int24_to_int256(__warp_0_tick);
                    
                    let __warp_2_absTick = __warp_se_14;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_15) = warp_uint256(887272);
            
            let (__warp_se_16) = warp_le256(__warp_2_absTick, __warp_se_15);
            
            with_attr error_message("T"){
                assert __warp_se_16 = 1;
            }
            
            let __warp_3_ratio = Uint256(low=0, high=1);
            
            let (__warp_se_17) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=1, high=0));
            
            let (__warp_se_18) = warp_neq256(__warp_se_17, Uint256(low=0, high=0));
            
                
                if (__warp_se_18 != 0){
                
                    
                    let __warp_3_ratio = Uint256(low=340265354078544963557816517032075149313, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_19) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=2, high=0));
            
            let (__warp_se_20) = warp_neq256(__warp_se_19, Uint256(low=0, high=0));
            
                
                if (__warp_se_20 != 0){
                
                    
                    let (__warp_se_21) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=340248342086729790484326174814286782778, high=0));
                    
                    let (__warp_se_22) = warp_shr256(__warp_se_21, 128);
                    
                    let __warp_3_ratio = __warp_se_22;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_23) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=4, high=0));
            
            let (__warp_se_24) = warp_neq256(__warp_se_23, Uint256(low=0, high=0));
            
                
                if (__warp_se_24 != 0){
                
                    
                    let (__warp_se_25) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=340214320654664324051920982716015181260, high=0));
                    
                    let (__warp_se_26) = warp_shr256(__warp_se_25, 128);
                    
                    let __warp_3_ratio = __warp_se_26;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_27) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=8, high=0));
            
            let (__warp_se_28) = warp_neq256(__warp_se_27, Uint256(low=0, high=0));
            
                
                if (__warp_se_28 != 0){
                
                    
                    let (__warp_se_29) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=340146287995602323631171512101879684304, high=0));
                    
                    let (__warp_se_30) = warp_shr256(__warp_se_29, 128);
                    
                    let __warp_3_ratio = __warp_se_30;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_31) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=16, high=0));
            
            let (__warp_se_32) = warp_neq256(__warp_se_31, Uint256(low=0, high=0));
            
                
                if (__warp_se_32 != 0){
                
                    
                    let (__warp_se_33) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=340010263488231146823593991679159461444, high=0));
                    
                    let (__warp_se_34) = warp_shr256(__warp_se_33, 128);
                    
                    let __warp_3_ratio = __warp_se_34;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_35) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=32, high=0));
            
            let (__warp_se_36) = warp_neq256(__warp_se_35, Uint256(low=0, high=0));
            
                
                if (__warp_se_36 != 0){
                
                    
                    let (__warp_se_37) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=339738377640345403697157401104375502016, high=0));
                    
                    let (__warp_se_38) = warp_shr256(__warp_se_37, 128);
                    
                    let __warp_3_ratio = __warp_se_38;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_39) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=64, high=0));
            
            let (__warp_se_40) = warp_neq256(__warp_se_39, Uint256(low=0, high=0));
            
                
                if (__warp_se_40 != 0){
                
                    
                    let (__warp_se_41) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=339195258003219555707034227454543997025, high=0));
                    
                    let (__warp_se_42) = warp_shr256(__warp_se_41, 128);
                    
                    let __warp_3_ratio = __warp_se_42;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_43) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=128, high=0));
            
            let (__warp_se_44) = warp_neq256(__warp_se_43, Uint256(low=0, high=0));
            
                
                if (__warp_se_44 != 0){
                
                    
                    let (__warp_se_45) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=338111622100601834656805679988414885971, high=0));
                    
                    let (__warp_se_46) = warp_shr256(__warp_se_45, 128);
                    
                    let __warp_3_ratio = __warp_se_46;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_47) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=256, high=0));
            
            let (__warp_se_48) = warp_neq256(__warp_se_47, Uint256(low=0, high=0));
            
                
                if (__warp_se_48 != 0){
                
                    
                    let (__warp_se_49) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=335954724994790223023589805789778977700, high=0));
                    
                    let (__warp_se_50) = warp_shr256(__warp_se_49, 128);
                    
                    let __warp_3_ratio = __warp_se_50;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_51) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=512, high=0));
            
            let (__warp_se_52) = warp_neq256(__warp_se_51, Uint256(low=0, high=0));
            
                
                if (__warp_se_52 != 0){
                
                    
                    let (__warp_se_53) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=331682121138379247127172139078559817300, high=0));
                    
                    let (__warp_se_54) = warp_shr256(__warp_se_53, 128);
                    
                    let __warp_3_ratio = __warp_se_54;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_55) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=1024, high=0));
            
            let (__warp_se_56) = warp_neq256(__warp_se_55, Uint256(low=0, high=0));
            
                
                if (__warp_se_56 != 0){
                
                    
                    let (__warp_se_57) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=323299236684853023288211250268160618739, high=0));
                    
                    let (__warp_se_58) = warp_shr256(__warp_se_57, 128);
                    
                    let __warp_3_ratio = __warp_se_58;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_59) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=2048, high=0));
            
            let (__warp_se_60) = warp_neq256(__warp_se_59, Uint256(low=0, high=0));
            
                
                if (__warp_se_60 != 0){
                
                    
                    let (__warp_se_61) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=307163716377032989948697243942600083929, high=0));
                    
                    let (__warp_se_62) = warp_shr256(__warp_se_61, 128);
                    
                    let __warp_3_ratio = __warp_se_62;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_63) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=4096, high=0));
            
            let (__warp_se_64) = warp_neq256(__warp_se_63, Uint256(low=0, high=0));
            
                
                if (__warp_se_64 != 0){
                
                    
                    let (__warp_se_65) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=277268403626896220162999269216087595045, high=0));
                    
                    let (__warp_se_66) = warp_shr256(__warp_se_65, 128);
                    
                    let __warp_3_ratio = __warp_se_66;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_67) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=8192, high=0));
            
            let (__warp_se_68) = warp_neq256(__warp_se_67, Uint256(low=0, high=0));
            
                
                if (__warp_se_68 != 0){
                
                    
                    let (__warp_se_69) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=225923453940442621947126027127485391333, high=0));
                    
                    let (__warp_se_70) = warp_shr256(__warp_se_69, 128);
                    
                    let __warp_3_ratio = __warp_se_70;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_71) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=16384, high=0));
            
            let (__warp_se_72) = warp_neq256(__warp_se_71, Uint256(low=0, high=0));
            
                
                if (__warp_se_72 != 0){
                
                    
                    let (__warp_se_73) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=149997214084966997727330242082538205943, high=0));
                    
                    let (__warp_se_74) = warp_shr256(__warp_se_73, 128);
                    
                    let __warp_3_ratio = __warp_se_74;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_75) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=32768, high=0));
            
            let (__warp_se_76) = warp_neq256(__warp_se_75, Uint256(low=0, high=0));
            
                
                if (__warp_se_76 != 0){
                
                    
                    let (__warp_se_77) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=66119101136024775622716233608466517926, high=0));
                    
                    let (__warp_se_78) = warp_shr256(__warp_se_77, 128);
                    
                    let __warp_3_ratio = __warp_se_78;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_79) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=65536, high=0));
            
            let (__warp_se_80) = warp_neq256(__warp_se_79, Uint256(low=0, high=0));
            
                
                if (__warp_se_80 != 0){
                
                    
                    let (__warp_se_81) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=12847376061809297530290974190478138313, high=0));
                    
                    let (__warp_se_82) = warp_shr256(__warp_se_81, 128);
                    
                    let __warp_3_ratio = __warp_se_82;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_83) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=131072, high=0));
            
            let (__warp_se_84) = warp_neq256(__warp_se_83, Uint256(low=0, high=0));
            
                
                if (__warp_se_84 != 0){
                
                    
                    let (__warp_se_85) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=485053260817066172746253684029974020, high=0));
                    
                    let (__warp_se_86) = warp_shr256(__warp_se_85, 128);
                    
                    let __warp_3_ratio = __warp_se_86;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_87) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=262144, high=0));
            
            let (__warp_se_88) = warp_neq256(__warp_se_87, Uint256(low=0, high=0));
            
                
                if (__warp_se_88 != 0){
                
                    
                    let (__warp_se_89) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=691415978906521570653435304214168, high=0));
                    
                    let (__warp_se_90) = warp_shr256(__warp_se_89, 128);
                    
                    let __warp_3_ratio = __warp_se_90;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                    tempvar __warp_2_absTick = __warp_2_absTick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
                tempvar __warp_2_absTick = __warp_2_absTick;
            
            let (__warp_se_91) = warp_bitwise_and256(__warp_2_absTick, Uint256(low=524288, high=0));
            
            let (__warp_se_92) = warp_neq256(__warp_se_91, Uint256(low=0, high=0));
            
                
                if (__warp_se_92 != 0){
                
                    
                    let (__warp_se_93) = warp_mul_unsafe256(__warp_3_ratio, Uint256(low=1404880482679654955896180642, high=0));
                    
                    let (__warp_se_94) = warp_shr256(__warp_se_93, 128);
                    
                    let __warp_3_ratio = __warp_se_94;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                    tempvar __warp_0_tick = __warp_0_tick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
                tempvar __warp_0_tick = __warp_0_tick;
            
            let (__warp_se_95) = warp_gt_signed24(__warp_0_tick, 0);
            
                
                if (__warp_se_95 != 0){
                
                    
                    let (__warp_se_96) = warp_div_unsafe256(Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455), __warp_3_ratio);
                    
                    let __warp_3_ratio = __warp_se_96;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                    tempvar __warp_3_ratio = __warp_3_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                tempvar __warp_3_ratio = __warp_3_ratio;
            
            let (__warp_se_97) = warp_mod256(__warp_3_ratio, Uint256(low=4294967296, high=0));
            
            let (__warp_se_98) = warp_eq256(__warp_se_97, Uint256(low=0, high=0));
            
                
                if (__warp_se_98 != 0){
                
                    
                    let (__warp_se_99) = warp_shr256(__warp_3_ratio, 32);
                    
                    let (__warp_se_100) = warp_int256_to_int160(__warp_se_99);
                    
                    let __warp_1_sqrtPriceX96 = __warp_se_100;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                }else{
                
                    
                    let (__warp_se_101) = warp_shr256(__warp_3_ratio, 32);
                    
                    let (__warp_se_102) = warp_add_unsafe256(__warp_se_101, Uint256(low=1, high=0));
                    
                    let (__warp_se_103) = warp_int256_to_int160(__warp_se_102);
                    
                    let __warp_1_sqrtPriceX96 = __warp_se_103;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_1_sqrtPriceX96 = __warp_1_sqrtPriceX96;
        
        
        
        return (__warp_1_sqrtPriceX96,);

    }


    func __warp_conditional_getTickAtSqrtRatio_4f76c058_5{range_check_ptr : felt}(__warp_4_sqrtPriceX96 : felt)-> (__warp_rc_4 : felt, __warp_4_sqrtPriceX96 : felt){
    alloc_locals;


        
        let (__warp_se_104) = warp_ge(__warp_4_sqrtPriceX96, 4295128739);
        
        if (__warp_se_104 != 0){
        
            
            let (__warp_se_105) = warp_lt(__warp_4_sqrtPriceX96, 1461446703485210103287273052203988822378723970342);
            
            let __warp_rc_4 = __warp_se_105;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
            
            
            
            return (__warp_rc_4, __warp_4_sqrtPriceX96);
        }else{
        
            
            let __warp_rc_4 = 0;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
            
            
            
            return (__warp_rc_4, __warp_4_sqrtPriceX96);
        }

    }

    // @notice Calculates the greatest tick value such that getRatioAtTick(tick) <= ratio
    // @dev Throws in case sqrtPriceX96 < MIN_SQRT_RATIO, as MIN_SQRT_RATIO is the lowest value getRatioAtTick may
    // ever return.
    // @param sqrtPriceX96 The sqrt ratio for which to compute the tick as a Q64.96
    // @return tick The greatest tick for which the ratio is less than or equal to the input ratio
    func getTickAtSqrtRatio_4f76c058{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_4_sqrtPriceX96 : felt)-> (__warp_5_tick : felt){
    alloc_locals;


        
        let __warp_5_tick = 0;
        
            
            let __warp_rc_4 = 0;
            
                
                let (__warp_tv_6, __warp_tv_7) = __warp_conditional_getTickAtSqrtRatio_4f76c058_5(__warp_4_sqrtPriceX96);
                
                let __warp_4_sqrtPriceX96 = __warp_tv_7;
                
                let __warp_rc_4 = __warp_tv_6;
            
            with_attr error_message("R"){
                assert __warp_rc_4 = 1;
            }
            
            let (__warp_se_106) = warp_uint256(__warp_4_sqrtPriceX96);
            
            let (__warp_6_ratio) = warp_shl256(__warp_se_106, 32);
            
            let __warp_7_r = __warp_6_ratio;
            
            let __warp_8_msb = Uint256(low=0, high=0);
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_107) = warp_gt256(__warp_7_r, Uint256(low=340282366920938463463374607431768211455, high=0));
            
                
                if (__warp_se_107 != 0){
                
                    
                    let __warp_9_f = Uint256(low=128, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_108) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_108;
            
            let (__warp_se_109) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_109;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_110) = warp_gt256(__warp_7_r, Uint256(low=18446744073709551615, high=0));
            
                
                if (__warp_se_110 != 0){
                
                    
                    let __warp_9_f = Uint256(low=64, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_111) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_111;
            
            let (__warp_se_112) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_112;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_113) = warp_gt256(__warp_7_r, Uint256(low=4294967295, high=0));
            
                
                if (__warp_se_113 != 0){
                
                    
                    let __warp_9_f = Uint256(low=32, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_114) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_114;
            
            let (__warp_se_115) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_115;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_116) = warp_gt256(__warp_7_r, Uint256(low=65535, high=0));
            
                
                if (__warp_se_116 != 0){
                
                    
                    let __warp_9_f = Uint256(low=16, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_117) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_117;
            
            let (__warp_se_118) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_118;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_119) = warp_gt256(__warp_7_r, Uint256(low=255, high=0));
            
                
                if (__warp_se_119 != 0){
                
                    
                    let __warp_9_f = Uint256(low=8, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_120) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_120;
            
            let (__warp_se_121) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_121;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_122) = warp_gt256(__warp_7_r, Uint256(low=15, high=0));
            
                
                if (__warp_se_122 != 0){
                
                    
                    let __warp_9_f = Uint256(low=4, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_123) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_123;
            
            let (__warp_se_124) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_124;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_125) = warp_gt256(__warp_7_r, Uint256(low=3, high=0));
            
                
                if (__warp_se_125 != 0){
                
                    
                    let __warp_9_f = Uint256(low=2, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_126) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_126;
            
            let (__warp_se_127) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_127;
            
            let __warp_9_f = Uint256(low=0, high=0);
            
            let (__warp_se_128) = warp_gt256(__warp_7_r, Uint256(low=1, high=0));
            
                
                if (__warp_se_128 != 0){
                
                    
                    let __warp_9_f = Uint256(low=1, high=0);
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                    tempvar __warp_6_ratio = __warp_6_ratio;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
                tempvar __warp_6_ratio = __warp_6_ratio;
            
            let (__warp_se_129) = warp_bitwise_or256(__warp_8_msb, __warp_9_f);
            
            let __warp_8_msb = __warp_se_129;
            
            let (__warp_se_130) = warp_ge256(__warp_8_msb, Uint256(low=128, high=0));
            
                
                if (__warp_se_130 != 0){
                
                    
                    let (__warp_se_131) = warp_sub_unsafe256(__warp_8_msb, Uint256(low=127, high=0));
                    
                    let (__warp_se_132) = warp_shr256_256(__warp_6_ratio, __warp_se_131);
                    
                    let __warp_7_r = __warp_se_132;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                }else{
                
                    
                    let (__warp_se_133) = warp_sub_unsafe256(Uint256(low=127, high=0), __warp_8_msb);
                    
                    let (__warp_se_134) = warp_shl256_256(__warp_6_ratio, __warp_se_133);
                    
                    let __warp_7_r = __warp_se_134;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                    tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                    tempvar __warp_7_r = __warp_7_r;
                    tempvar __warp_9_f = __warp_9_f;
                    tempvar __warp_8_msb = __warp_8_msb;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
                tempvar __warp_4_sqrtPriceX96 = __warp_4_sqrtPriceX96;
                tempvar __warp_7_r = __warp_7_r;
                tempvar __warp_9_f = __warp_9_f;
                tempvar __warp_8_msb = __warp_8_msb;
            
            let (__warp_se_135) = warp_sub_signed_unsafe256(__warp_8_msb, Uint256(low=128, high=0));
            
            let (__warp_10_log_2) = warp_shl256(__warp_se_135, 64);
            
            let (__warp_se_136) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_137) = warp_shr256(__warp_se_136, 127);
            
            let __warp_7_r = __warp_se_137;
            
            let (__warp_se_138) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_138;
            
            let (__warp_se_139) = warp_shl256(__warp_9_f, 63);
            
            let (__warp_se_140) = warp_bitwise_or256(__warp_10_log_2, __warp_se_139);
            
            let __warp_10_log_2 = __warp_se_140;
            
            let (__warp_se_141) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_141;
            
            let (__warp_se_142) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_143) = warp_shr256(__warp_se_142, 127);
            
            let __warp_7_r = __warp_se_143;
            
            let (__warp_se_144) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_144;
            
            let (__warp_se_145) = warp_shl256(__warp_9_f, 62);
            
            let (__warp_se_146) = warp_bitwise_or256(__warp_10_log_2, __warp_se_145);
            
            let __warp_10_log_2 = __warp_se_146;
            
            let (__warp_se_147) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_147;
            
            let (__warp_se_148) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_149) = warp_shr256(__warp_se_148, 127);
            
            let __warp_7_r = __warp_se_149;
            
            let (__warp_se_150) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_150;
            
            let (__warp_se_151) = warp_shl256(__warp_9_f, 61);
            
            let (__warp_se_152) = warp_bitwise_or256(__warp_10_log_2, __warp_se_151);
            
            let __warp_10_log_2 = __warp_se_152;
            
            let (__warp_se_153) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_153;
            
            let (__warp_se_154) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_155) = warp_shr256(__warp_se_154, 127);
            
            let __warp_7_r = __warp_se_155;
            
            let (__warp_se_156) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_156;
            
            let (__warp_se_157) = warp_shl256(__warp_9_f, 60);
            
            let (__warp_se_158) = warp_bitwise_or256(__warp_10_log_2, __warp_se_157);
            
            let __warp_10_log_2 = __warp_se_158;
            
            let (__warp_se_159) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_159;
            
            let (__warp_se_160) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_161) = warp_shr256(__warp_se_160, 127);
            
            let __warp_7_r = __warp_se_161;
            
            let (__warp_se_162) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_162;
            
            let (__warp_se_163) = warp_shl256(__warp_9_f, 59);
            
            let (__warp_se_164) = warp_bitwise_or256(__warp_10_log_2, __warp_se_163);
            
            let __warp_10_log_2 = __warp_se_164;
            
            let (__warp_se_165) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_165;
            
            let (__warp_se_166) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_167) = warp_shr256(__warp_se_166, 127);
            
            let __warp_7_r = __warp_se_167;
            
            let (__warp_se_168) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_168;
            
            let (__warp_se_169) = warp_shl256(__warp_9_f, 58);
            
            let (__warp_se_170) = warp_bitwise_or256(__warp_10_log_2, __warp_se_169);
            
            let __warp_10_log_2 = __warp_se_170;
            
            let (__warp_se_171) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_171;
            
            let (__warp_se_172) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_173) = warp_shr256(__warp_se_172, 127);
            
            let __warp_7_r = __warp_se_173;
            
            let (__warp_se_174) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_174;
            
            let (__warp_se_175) = warp_shl256(__warp_9_f, 57);
            
            let (__warp_se_176) = warp_bitwise_or256(__warp_10_log_2, __warp_se_175);
            
            let __warp_10_log_2 = __warp_se_176;
            
            let (__warp_se_177) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_177;
            
            let (__warp_se_178) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_179) = warp_shr256(__warp_se_178, 127);
            
            let __warp_7_r = __warp_se_179;
            
            let (__warp_se_180) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_180;
            
            let (__warp_se_181) = warp_shl256(__warp_9_f, 56);
            
            let (__warp_se_182) = warp_bitwise_or256(__warp_10_log_2, __warp_se_181);
            
            let __warp_10_log_2 = __warp_se_182;
            
            let (__warp_se_183) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_183;
            
            let (__warp_se_184) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_185) = warp_shr256(__warp_se_184, 127);
            
            let __warp_7_r = __warp_se_185;
            
            let (__warp_se_186) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_186;
            
            let (__warp_se_187) = warp_shl256(__warp_9_f, 55);
            
            let (__warp_se_188) = warp_bitwise_or256(__warp_10_log_2, __warp_se_187);
            
            let __warp_10_log_2 = __warp_se_188;
            
            let (__warp_se_189) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_189;
            
            let (__warp_se_190) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_191) = warp_shr256(__warp_se_190, 127);
            
            let __warp_7_r = __warp_se_191;
            
            let (__warp_se_192) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_192;
            
            let (__warp_se_193) = warp_shl256(__warp_9_f, 54);
            
            let (__warp_se_194) = warp_bitwise_or256(__warp_10_log_2, __warp_se_193);
            
            let __warp_10_log_2 = __warp_se_194;
            
            let (__warp_se_195) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_195;
            
            let (__warp_se_196) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_197) = warp_shr256(__warp_se_196, 127);
            
            let __warp_7_r = __warp_se_197;
            
            let (__warp_se_198) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_198;
            
            let (__warp_se_199) = warp_shl256(__warp_9_f, 53);
            
            let (__warp_se_200) = warp_bitwise_or256(__warp_10_log_2, __warp_se_199);
            
            let __warp_10_log_2 = __warp_se_200;
            
            let (__warp_se_201) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_201;
            
            let (__warp_se_202) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_203) = warp_shr256(__warp_se_202, 127);
            
            let __warp_7_r = __warp_se_203;
            
            let (__warp_se_204) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_204;
            
            let (__warp_se_205) = warp_shl256(__warp_9_f, 52);
            
            let (__warp_se_206) = warp_bitwise_or256(__warp_10_log_2, __warp_se_205);
            
            let __warp_10_log_2 = __warp_se_206;
            
            let (__warp_se_207) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_207;
            
            let (__warp_se_208) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_209) = warp_shr256(__warp_se_208, 127);
            
            let __warp_7_r = __warp_se_209;
            
            let (__warp_se_210) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_210;
            
            let (__warp_se_211) = warp_shl256(__warp_9_f, 51);
            
            let (__warp_se_212) = warp_bitwise_or256(__warp_10_log_2, __warp_se_211);
            
            let __warp_10_log_2 = __warp_se_212;
            
            let (__warp_se_213) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_213;
            
            let (__warp_se_214) = warp_mul_unsafe256(__warp_7_r, __warp_7_r);
            
            let (__warp_se_215) = warp_shr256(__warp_se_214, 127);
            
            let __warp_7_r = __warp_se_215;
            
            let (__warp_se_216) = warp_shr256(__warp_7_r, 128);
            
            let __warp_9_f = __warp_se_216;
            
            let (__warp_se_217) = warp_shl256(__warp_9_f, 50);
            
            let (__warp_se_218) = warp_bitwise_or256(__warp_10_log_2, __warp_se_217);
            
            let __warp_10_log_2 = __warp_se_218;
            
            let (__warp_se_219) = warp_shr256_256(__warp_7_r, __warp_9_f);
            
            let __warp_7_r = __warp_se_219;
            
            let (__warp_11_log_sqrt10001) = warp_mul_signed_unsafe256(__warp_10_log_2, Uint256(low=255738958999603826347141, high=0));
            
            let (__warp_se_220) = warp_sub_signed_unsafe256(__warp_11_log_sqrt10001, Uint256(low=3402992956809132418596140100660247210, high=0));
            
            let (__warp_se_221) = warp_shr_signed256(__warp_se_220, 128);
            
            let (__warp_12_tickLow) = warp_int256_to_int24(__warp_se_221);
            
            let (__warp_se_222) = warp_add_signed_unsafe256(__warp_11_log_sqrt10001, Uint256(low=291339464771989622907027621153398088495, high=0));
            
            let (__warp_se_223) = warp_shr_signed256(__warp_se_222, 128);
            
            let (__warp_13_tickHi) = warp_int256_to_int24(__warp_se_223);
            
            let (__warp_se_224) = warp_eq(__warp_12_tickLow, __warp_13_tickHi);
            
                
                if (__warp_se_224 != 0){
                
                    
                    let __warp_5_tick = __warp_12_tickLow;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                }else{
                
                    
                    let (__warp_pse_4) = getSqrtRatioAtTick_986cfba3(__warp_13_tickHi);
                    
                    let (__warp_se_225) = warp_le(__warp_pse_4, __warp_4_sqrtPriceX96);
                    
                        
                        if (__warp_se_225 != 0){
                        
                            
                            let __warp_5_tick = __warp_13_tickHi;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar __warp_5_tick = __warp_5_tick;
                        }else{
                        
                            
                            let __warp_5_tick = __warp_12_tickLow;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar __warp_5_tick = __warp_5_tick;
                        }
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_5_tick = __warp_5_tick;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_5_tick = __warp_5_tick;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_5_tick = __warp_5_tick;
        
        
        
        return (__warp_5_tick,);

    }

}


    @view
    func checkGetSqrtRatioAtTickInvariants_47d38f4d{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tick : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_0_tick);
        
        let (__warp_1_ratio) = TickMathEchidnaTest.getSqrtRatioAtTick_986cfba3(__warp_0_tick);
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_tv_1, __warp_tv_2) = TickMathEchidnaTest.__warp_conditional_checkGetSqrtRatioAtTickInvariants_47d38f4d_1(__warp_0_tick, __warp_1_ratio);
            
            let __warp_1_ratio = __warp_tv_2;
            
            let __warp_0_tick = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
        assert __warp_rc_0 = 1;
        
        let (__warp_se_4) = warp_ge(__warp_1_ratio, 4295128739);
        
        assert __warp_se_4 = 1;
        
        let (__warp_se_5) = warp_le(__warp_1_ratio, 1461446703485210103287273052203988822378723970342);
        
        assert __warp_se_5 = 1;
        
        
        
        return ();

    }


    @view
    func checkGetTickAtSqrtRatioInvariants_df01e52d{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_ratio : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int160(__warp_2_ratio);
        
        let (__warp_3_tick) = TickMathEchidnaTest.getTickAtSqrtRatio_4f76c058(__warp_2_ratio);
        
        let __warp_rc_2 = 0;
        
            
            let (__warp_tv_3, __warp_tv_4, __warp_tv_5) = TickMathEchidnaTest.__warp_conditional_checkGetTickAtSqrtRatioInvariants_df01e52d_3(__warp_2_ratio, __warp_3_tick);
            
            let __warp_3_tick = __warp_tv_5;
            
            let __warp_2_ratio = __warp_tv_4;
            
            let __warp_rc_2 = __warp_tv_3;
        
        assert __warp_rc_2 = 1;
        
        let (__warp_se_9) = warp_ge_signed24(__warp_3_tick, 15889944);
        
        assert __warp_se_9 = 1;
        
        let (__warp_se_10) = warp_lt_signed24(__warp_3_tick, 887272);
        
        assert __warp_se_10 = 1;
        
        
        
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