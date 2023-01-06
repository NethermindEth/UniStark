%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int160, warp_external_input_check_int128, warp_external_input_check_int256
from warplib.maths.external_input_check_bool import warp_external_input_check_bool
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.int_conversions import warp_uint256, warp_int256_to_int160
from warplib.maths.mul import warp_mul256
from warplib.maths.div import warp_div256
from warplib.maths.eq import warp_eq256
from warplib.maths.gt import warp_gt256, warp_gt
from warplib.maths.shl import warp_shl256
from warplib.maths.mul_unsafe import warp_mul_unsafe256
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.ge import warp_ge256
from warplib.maths.sub_unsafe import warp_sub_unsafe256, warp_sub_unsafe160
from warplib.maths.le import warp_le256
from warplib.maths.mulmod import warp_mulmod
from warplib.maths.lt import warp_lt256
from warplib.maths.negate import warp_negate256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.bitwise_or import warp_bitwise_or256
from warplib.maths.xor import warp_xor256
from warplib.maths.mod import warp_mod256


// Contract Def SqrtPriceMathTest


namespace SqrtPriceMathTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_getNextSqrtPriceFromAmount0RoundingUp_157f652f_1{range_check_ptr : felt}(__warp_8_product : Uint256, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt, __warp_5_numerator1 : Uint256)-> (__warp_rc_0 : felt, __warp_8_product : Uint256, __warp_2_amount : Uint256, __warp_0_sqrtPX96 : felt, __warp_5_numerator1 : Uint256){
    alloc_locals;


        
        let (__warp_se_0) = warp_uint256(__warp_0_sqrtPX96);
        
        let (__warp_pse_8) = warp_mul256(__warp_2_amount, __warp_se_0);
        
        let __warp_8_product = __warp_pse_8;
        
        let (__warp_se_1) = warp_div256(__warp_pse_8, __warp_2_amount);
        
        let (__warp_se_2) = warp_uint256(__warp_0_sqrtPX96);
        
        let (__warp_se_3) = warp_eq256(__warp_se_1, __warp_se_2);
        
        if (__warp_se_3 != 0){
        
            
            let (__warp_se_4) = warp_gt256(__warp_5_numerator1, __warp_8_product);
            
            let __warp_rc_0 = __warp_se_4;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_8_product = __warp_8_product;
            
            let __warp_2_amount = __warp_2_amount;
            
            let __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
            
            let __warp_5_numerator1 = __warp_5_numerator1;
            
            
            
            return (__warp_rc_0, __warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_8_product = __warp_8_product;
            
            let __warp_2_amount = __warp_2_amount;
            
            let __warp_0_sqrtPX96 = __warp_0_sqrtPX96;
            
            let __warp_5_numerator1 = __warp_5_numerator1;
            
            
            
            return (__warp_rc_0, __warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
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


        
            
            let (__warp_se_5) = warp_eq256(__warp_2_amount, Uint256(low=0, high=0));
            
                
                if (__warp_se_5 != 0){
                
                    
                    
                    
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
            
            let (__warp_se_6) = warp_uint256(__warp_1_liquidity);
            
            let (__warp_5_numerator1) = warp_shl256(__warp_se_6, 96);
            
            if (__warp_3_add != 0){
            
                
                let __warp_6_product = Uint256(low=0, high=0);
                
                let (__warp_se_7) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_pse_4) = warp_mul_unsafe256(__warp_2_amount, __warp_se_7);
                
                let __warp_6_product = __warp_pse_4;
                
                let (__warp_se_8) = warp_div_unsafe256(__warp_pse_4, __warp_2_amount);
                
                let (__warp_se_9) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_se_10) = warp_eq256(__warp_se_8, __warp_se_9);
                
                    
                    if (__warp_se_10 != 0){
                    
                        
                        let (__warp_7_denominator) = warp_add_unsafe256(__warp_5_numerator1, __warp_6_product);
                        
                        let (__warp_se_11) = warp_ge256(__warp_7_denominator, __warp_5_numerator1);
                        
                            
                            if (__warp_se_11 != 0){
                            
                                
                                let (__warp_se_12) = warp_uint256(__warp_0_sqrtPX96);
                                
                                let (__warp_pse_5) = mulDivRoundingUp_0af8b27f(__warp_5_numerator1, __warp_se_12, __warp_7_denominator);
                                
                                let (__warp_se_13) = warp_int256_to_int160(__warp_pse_5);
                                
                                
                                
                                return (__warp_se_13,);
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
                
                let (__warp_se_14) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_se_15) = warp_div_unsafe256(__warp_5_numerator1, __warp_se_14);
                
                let (__warp_pse_6) = add_771602f7(__warp_se_15, __warp_2_amount);
                
                let (__warp_pse_7) = divRoundingUp_40226b32(__warp_5_numerator1, __warp_pse_6);
                
                let (__warp_se_16) = warp_int256_to_int160(__warp_pse_7);
                
                
                
                return (__warp_se_16,);
            }else{
            
                
                let __warp_8_product = Uint256(low=0, high=0);
                
                let __warp_rc_0 = 0;
                
                    
                    let (__warp_tv_0, __warp_tv_1, __warp_tv_2, __warp_tv_3, __warp_tv_4) = __warp_conditional_getNextSqrtPriceFromAmount0RoundingUp_157f652f_1(__warp_8_product, __warp_2_amount, __warp_0_sqrtPX96, __warp_5_numerator1);
                    
                    let __warp_5_numerator1 = __warp_tv_4;
                    
                    let __warp_0_sqrtPX96 = __warp_tv_3;
                    
                    let __warp_2_amount = __warp_tv_2;
                    
                    let __warp_8_product = __warp_tv_1;
                    
                    let __warp_rc_0 = __warp_tv_0;
                
                assert __warp_rc_0 = 1;
                
                let (__warp_9_denominator) = warp_sub_unsafe256(__warp_5_numerator1, __warp_8_product);
                
                let (__warp_se_17) = warp_uint256(__warp_0_sqrtPX96);
                
                let (__warp_pse_9) = mulDivRoundingUp_0af8b27f(__warp_5_numerator1, __warp_se_17, __warp_9_denominator);
                
                let (__warp_pse_10) = toUint160_dfef6beb(__warp_pse_9);
                
                
                
                return (__warp_pse_10,);
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
                
                let (__warp_se_18) = warp_uint256(1461501637330902918203684832716283019655932542975);
                
                let (__warp_se_19) = warp_le256(__warp_12_amount, __warp_se_18);
                
                    
                    if (__warp_se_19 != 0){
                    
                        
                        let (__warp_se_20) = warp_shl256(__warp_12_amount, 96);
                        
                        let (__warp_se_21) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_se_22) = warp_div_unsafe256(__warp_se_20, __warp_se_21);
                        
                        let __warp_15_quotient = __warp_se_22;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_15_quotient = __warp_15_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }else{
                    
                        
                        let (__warp_se_23) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_pse_11) = mulDiv_aa9a0912(__warp_12_amount, Uint256(low=79228162514264337593543950336, high=0), __warp_se_23);
                        
                        let __warp_15_quotient = __warp_pse_11;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_15_quotient = __warp_15_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_15_quotient = __warp_15_quotient;
                    tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                
                let (__warp_se_24) = warp_uint256(__warp_10_sqrtPX96);
                
                let (__warp_pse_12) = add_771602f7(__warp_se_24, __warp_15_quotient);
                
                let (__warp_pse_13) = toUint160_dfef6beb(__warp_pse_12);
                
                
                
                return (__warp_pse_13,);
            }else{
            
                
                let __warp_16_quotient = Uint256(low=0, high=0);
                
                let (__warp_se_25) = warp_uint256(1461501637330902918203684832716283019655932542975);
                
                let (__warp_se_26) = warp_le256(__warp_12_amount, __warp_se_25);
                
                    
                    if (__warp_se_26 != 0){
                    
                        
                        let (__warp_se_27) = warp_shl256(__warp_12_amount, 96);
                        
                        let (__warp_se_28) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_pse_14) = divRoundingUp_40226b32(__warp_se_27, __warp_se_28);
                        
                        let __warp_16_quotient = __warp_pse_14;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_16_quotient = __warp_16_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }else{
                    
                        
                        let (__warp_se_29) = warp_uint256(__warp_11_liquidity);
                        
                        let (__warp_pse_15) = mulDivRoundingUp_0af8b27f(__warp_12_amount, Uint256(low=79228162514264337593543950336, high=0), __warp_se_29);
                        
                        let __warp_16_quotient = __warp_pse_15;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_16_quotient = __warp_16_quotient;
                        tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_16_quotient = __warp_16_quotient;
                    tempvar __warp_10_sqrtPX96 = __warp_10_sqrtPX96;
                
                let (__warp_se_30) = warp_uint256(__warp_10_sqrtPX96);
                
                let (__warp_se_31) = warp_gt256(__warp_se_30, __warp_16_quotient);
                
                assert __warp_se_31 = 1;
                
                let (__warp_se_32) = warp_uint256(__warp_10_sqrtPX96);
                
                let (__warp_se_33) = warp_sub_unsafe256(__warp_se_32, __warp_16_quotient);
                
                let (__warp_se_34) = warp_int256_to_int160(__warp_se_33);
                
                
                
                return (__warp_se_34,);
            }

    }

    // @notice Gets the next sqrt price given an input amount of token0 or token1
    // @dev Throws if price or liquidity are 0, or if the next price is out of bounds
    // @param sqrtPX96 The starting price, i.e., before accounting for the input amount
    // @param liquidity The amount of usable liquidity
    // @param amountIn How much of token0, or token1, is being swapped in
    // @param zeroForOne Whether the amount in is token0 or token1
    // @return sqrtQX96 The price after adding the input amount to token0 or token1
    func s1_getNextSqrtPriceFromInput_aa58276a{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_17_sqrtPX96 : felt, __warp_18_liquidity : felt, __warp_19_amountIn : Uint256, __warp_20_zeroForOne : felt)-> (sqrtQX96 : felt){
    alloc_locals;


        
        let (__warp_se_35) = warp_gt(__warp_17_sqrtPX96, 0);
        
        assert __warp_se_35 = 1;
        
        let (__warp_se_36) = warp_gt(__warp_18_liquidity, 0);
        
        assert __warp_se_36 = 1;
        
        if (__warp_20_zeroForOne != 0){
        
            
            let (__warp_pse_16) = getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_17_sqrtPX96, __warp_18_liquidity, __warp_19_amountIn, 1);
            
            
            
            return (__warp_pse_16,);
        }else{
        
            
            let (__warp_pse_17) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_17_sqrtPX96, __warp_18_liquidity, __warp_19_amountIn, 1);
            
            
            
            return (__warp_pse_17,);
        }

    }

    // @notice Gets the next sqrt price given an output amount of token0 or token1
    // @dev Throws if price or liquidity are 0 or the next price is out of bounds
    // @param sqrtPX96 The starting price before accounting for the output amount
    // @param liquidity The amount of usable liquidity
    // @param amountOut How much of token0, or token1, is being swapped out
    // @param zeroForOne Whether the amount out is token0 or token1
    // @return sqrtQX96 The price after removing the output amount of token0 or token1
    func s1_getNextSqrtPriceFromOutput_fedf2b5f{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_21_sqrtPX96 : felt, __warp_22_liquidity : felt, __warp_23_amountOut : Uint256, __warp_24_zeroForOne : felt)-> (sqrtQX96 : felt){
    alloc_locals;


        
        let (__warp_se_37) = warp_gt(__warp_21_sqrtPX96, 0);
        
        assert __warp_se_37 = 1;
        
        let (__warp_se_38) = warp_gt(__warp_22_liquidity, 0);
        
        assert __warp_se_38 = 1;
        
        if (__warp_24_zeroForOne != 0){
        
            
            let (__warp_pse_18) = getNextSqrtPriceFromAmount1RoundingDown_fb4de288(__warp_21_sqrtPX96, __warp_22_liquidity, __warp_23_amountOut, 0);
            
            
            
            return (__warp_pse_18,);
        }else{
        
            
            let (__warp_pse_19) = getNextSqrtPriceFromAmount0RoundingUp_157f652f(__warp_21_sqrtPX96, __warp_22_liquidity, __warp_23_amountOut, 0);
            
            
            
            return (__warp_pse_19,);
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
    func s1_getAmount0Delta_2c32d4b6{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_25_sqrtRatioAX96 : felt, __warp_26_sqrtRatioBX96 : felt, __warp_27_liquidity : felt, __warp_28_roundUp : felt)-> (amount0 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_39) = warp_gt(__warp_25_sqrtRatioAX96, __warp_26_sqrtRatioBX96);
            
                
                if (__warp_se_39 != 0){
                
                    
                    let __warp_tv_5 = __warp_26_sqrtRatioBX96;
                    
                    let __warp_tv_6 = __warp_25_sqrtRatioAX96;
                    
                    let __warp_26_sqrtRatioBX96 = __warp_tv_6;
                    
                    let __warp_25_sqrtRatioAX96 = __warp_tv_5;
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
            
            let (__warp_se_40) = warp_uint256(__warp_27_liquidity);
            
            let (__warp_29_numerator1) = warp_shl256(__warp_se_40, 96);
            
            let (__warp_se_41) = warp_sub_unsafe160(__warp_26_sqrtRatioBX96, __warp_25_sqrtRatioAX96);
            
            let (__warp_30_numerator2) = warp_uint256(__warp_se_41);
            
            let (__warp_se_42) = warp_gt(__warp_25_sqrtRatioAX96, 0);
            
            assert __warp_se_42 = 1;
            
            if (__warp_28_roundUp != 0){
            
                
                let (__warp_se_43) = warp_uint256(__warp_26_sqrtRatioBX96);
                
                let (__warp_pse_20) = mulDivRoundingUp_0af8b27f(__warp_29_numerator1, __warp_30_numerator2, __warp_se_43);
                
                let (__warp_se_44) = warp_uint256(__warp_25_sqrtRatioAX96);
                
                let (__warp_pse_21) = divRoundingUp_40226b32(__warp_pse_20, __warp_se_44);
                
                
                
                return (__warp_pse_21,);
            }else{
            
                
                let (__warp_se_45) = warp_uint256(__warp_26_sqrtRatioBX96);
                
                let (__warp_pse_22) = mulDiv_aa9a0912(__warp_29_numerator1, __warp_30_numerator2, __warp_se_45);
                
                let (__warp_se_46) = warp_uint256(__warp_25_sqrtRatioAX96);
                
                let (__warp_se_47) = warp_div_unsafe256(__warp_pse_22, __warp_se_46);
                
                
                
                return (__warp_se_47,);
            }

    }

    // @notice Gets the amount1 delta between two prices
    // @dev Calculates liquidity * (sqrt(upper) - sqrt(lower))
    // @param sqrtRatioAX96 A sqrt price
    // @param sqrtRatioBX96 Another sqrt price
    // @param liquidity The amount of usable liquidity
    // @param roundUp Whether to round the amount up, or down
    // @return amount1 Amount of token1 required to cover a position of size liquidity between the two passed prices
    func s1_getAmount1Delta_48a0c5bd{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_31_sqrtRatioAX96 : felt, __warp_32_sqrtRatioBX96 : felt, __warp_33_liquidity : felt, __warp_34_roundUp : felt)-> (amount1 : Uint256){
    alloc_locals;


        
            
            let (__warp_se_48) = warp_gt(__warp_31_sqrtRatioAX96, __warp_32_sqrtRatioBX96);
            
                
                if (__warp_se_48 != 0){
                
                    
                    let __warp_tv_7 = __warp_32_sqrtRatioBX96;
                    
                    let __warp_tv_8 = __warp_31_sqrtRatioAX96;
                    
                    let __warp_32_sqrtRatioBX96 = __warp_tv_8;
                    
                    let __warp_31_sqrtRatioAX96 = __warp_tv_7;
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
            
                
                let (__warp_se_49) = warp_uint256(__warp_33_liquidity);
                
                let (__warp_se_50) = warp_sub_unsafe160(__warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                
                let (__warp_se_51) = warp_uint256(__warp_se_50);
                
                let (__warp_pse_23) = mulDivRoundingUp_0af8b27f(__warp_se_49, __warp_se_51, Uint256(low=79228162514264337593543950336, high=0));
                
                
                
                return (__warp_pse_23,);
            }else{
            
                
                let (__warp_se_52) = warp_uint256(__warp_33_liquidity);
                
                let (__warp_se_53) = warp_sub_unsafe160(__warp_32_sqrtRatioBX96, __warp_31_sqrtRatioAX96);
                
                let (__warp_se_54) = warp_uint256(__warp_se_53);
                
                let (__warp_pse_24) = mulDiv_aa9a0912(__warp_se_52, __warp_se_54, Uint256(low=79228162514264337593543950336, high=0));
                
                
                
                return (__warp_pse_24,);
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
        
            
            let (__warp_se_55) = warp_mul_unsafe256(__warp_0_a, __warp_1_b);
            
            let __warp_4_prod0 = __warp_se_55;
            
            let (__warp_5_mm) = warp_mulmod(__warp_0_a, __warp_1_b, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
            
            let __warp_6_prod1 = Uint256(low=0, high=0);
            
            let (__warp_se_56) = warp_sub_unsafe256(__warp_5_mm, __warp_4_prod0);
            
            let __warp_6_prod1 = __warp_se_56;
            
            let (__warp_se_57) = warp_lt256(__warp_5_mm, __warp_4_prod0);
            
                
                if (__warp_se_57 != 0){
                
                    
                    let (__warp_se_58) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_58;
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
            
            let (__warp_se_59) = warp_eq256(__warp_6_prod1, Uint256(low=0, high=0));
            
                
                if (__warp_se_59 != 0){
                
                    
                    let (__warp_se_60) = warp_gt256(__warp_2_denominator, Uint256(low=0, high=0));
                    
                    assert __warp_se_60 = 1;
                    
                    let (__warp_se_61) = warp_div_unsafe256(__warp_4_prod0, __warp_2_denominator);
                    
                    let __warp_3_result = __warp_se_61;
                    
                    
                    
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
            
            let (__warp_se_62) = warp_gt256(__warp_2_denominator, __warp_6_prod1);
            
            assert __warp_se_62 = 1;
            
            let __warp_7_remainder = Uint256(low=0, high=0);
            
            let (__warp_se_63) = warp_mulmod(__warp_0_a, __warp_1_b, __warp_2_denominator);
            
            let __warp_7_remainder = __warp_se_63;
            
            let (__warp_se_64) = warp_gt256(__warp_7_remainder, __warp_4_prod0);
            
                
                if (__warp_se_64 != 0){
                
                    
                    let (__warp_se_65) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_65;
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
            
            let (__warp_se_66) = warp_sub_unsafe256(__warp_4_prod0, __warp_7_remainder);
            
            let __warp_4_prod0 = __warp_se_66;
            
            let (__warp_se_67) = warp_negate256(__warp_2_denominator);
            
            let (__warp_8_twos) = warp_bitwise_and256(__warp_se_67, __warp_2_denominator);
            
            let (__warp_se_68) = warp_div_unsafe256(__warp_2_denominator, __warp_8_twos);
            
            let __warp_2_denominator = __warp_se_68;
            
            let (__warp_se_69) = warp_div_unsafe256(__warp_4_prod0, __warp_8_twos);
            
            let __warp_4_prod0 = __warp_se_69;
            
            let (__warp_se_70) = warp_sub_unsafe256(Uint256(low=0, high=0), __warp_8_twos);
            
            let (__warp_se_71) = warp_div_unsafe256(__warp_se_70, __warp_8_twos);
            
            let (__warp_se_72) = warp_add_unsafe256(__warp_se_71, Uint256(low=1, high=0));
            
            let __warp_8_twos = __warp_se_72;
            
            let (__warp_se_73) = warp_mul_unsafe256(__warp_6_prod1, __warp_8_twos);
            
            let (__warp_se_74) = warp_bitwise_or256(__warp_4_prod0, __warp_se_73);
            
            let __warp_4_prod0 = __warp_se_74;
            
            let (__warp_se_75) = warp_mul_unsafe256(Uint256(low=3, high=0), __warp_2_denominator);
            
            let (__warp_9_inv) = warp_xor256(__warp_se_75, Uint256(low=2, high=0));
            
            let (__warp_se_76) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_77) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_76);
            
            let (__warp_se_78) = warp_mul_unsafe256(__warp_9_inv, __warp_se_77);
            
            let __warp_9_inv = __warp_se_78;
            
            let (__warp_se_79) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_80) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_79);
            
            let (__warp_se_81) = warp_mul_unsafe256(__warp_9_inv, __warp_se_80);
            
            let __warp_9_inv = __warp_se_81;
            
            let (__warp_se_82) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_83) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_82);
            
            let (__warp_se_84) = warp_mul_unsafe256(__warp_9_inv, __warp_se_83);
            
            let __warp_9_inv = __warp_se_84;
            
            let (__warp_se_85) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_86) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_85);
            
            let (__warp_se_87) = warp_mul_unsafe256(__warp_9_inv, __warp_se_86);
            
            let __warp_9_inv = __warp_se_87;
            
            let (__warp_se_88) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_89) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_88);
            
            let (__warp_se_90) = warp_mul_unsafe256(__warp_9_inv, __warp_se_89);
            
            let __warp_9_inv = __warp_se_90;
            
            let (__warp_se_91) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_92) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_91);
            
            let (__warp_se_93) = warp_mul_unsafe256(__warp_9_inv, __warp_se_92);
            
            let __warp_9_inv = __warp_se_93;
            
            let (__warp_se_94) = warp_mul_unsafe256(__warp_4_prod0, __warp_9_inv);
            
            let __warp_3_result = __warp_se_94;
        
        
        
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
        
        let (__warp_pse_33) = mulDiv_aa9a0912(__warp_10_a, __warp_11_b, __warp_12_denominator);
        
        let __warp_13_result = __warp_pse_33;
        
            
            let (__warp_se_95) = warp_mulmod(__warp_10_a, __warp_11_b, __warp_12_denominator);
            
            let (__warp_se_96) = warp_gt256(__warp_se_95, Uint256(low=0, high=0));
            
                
                if (__warp_se_96 != 0){
                
                    
                    let (__warp_se_97) = warp_lt256(__warp_13_result, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
                    
                    assert __warp_se_97 = 1;
                    
                    let (__warp_pse_34) = warp_add_unsafe256(__warp_13_result, Uint256(low=1, high=0));
                    
                    let __warp_13_result = __warp_pse_34;
                    
                    warp_sub_unsafe256(__warp_pse_34, Uint256(low=1, high=0));
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

    // @notice Returns ceil(x / y)
    // @dev division by 0 has unspecified behavior, and must be checked externally
    // @param x The dividend
    // @param y The divisor
    // @return z The quotient, ceil(x / y)
    func divRoundingUp_40226b32{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let __warp_3_temp = Uint256(low=0, high=0);
            
            let (__warp_se_98) = warp_mod256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_99) = warp_gt256(__warp_se_98, Uint256(low=0, high=0));
            
                
                if (__warp_se_99 != 0){
                
                    
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
            
            let (__warp_se_100) = warp_div_unsafe256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_101) = warp_add_unsafe256(__warp_se_100, __warp_3_temp);
            
            let __warp_2_z = __warp_se_101;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Returns x + y, reverts if sum overflows uint256
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_771602f7{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_35) = warp_add_unsafe256(__warp_0_x, __warp_1_y);
            
            let __warp_2_z = __warp_pse_35;
            
            let (__warp_se_102) = warp_ge256(__warp_pse_35, __warp_0_x);
            
            assert __warp_se_102 = 1;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Cast a uint256 to a uint160, revert on overflow
    // @param y The uint256 to be downcasted
    // @return z The downcasted integer, now type uint160
    func toUint160_dfef6beb{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_y : Uint256)-> (__warp_1_z : felt){
    alloc_locals;


        
        let __warp_1_z = 0;
        
        let (__warp_pse_40) = warp_int256_to_int160(__warp_0_y);
        
        let __warp_1_z = __warp_pse_40;
        
        let (__warp_se_103) = warp_uint256(__warp_pse_40);
        
        let (__warp_se_104) = warp_eq256(__warp_se_103, __warp_0_y);
        
        assert __warp_se_104 = 1;
        
        
        
        return (__warp_1_z,);

    }

}


    @view
    func getNextSqrtPriceFromInput_aa58276a{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_sqrtP : felt, __warp_1_liquidity : felt, __warp_2_amountIn : Uint256, __warp_3_zeroForOne : felt)-> (sqrtQ : felt){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_3_zeroForOne);
        
        warp_external_input_check_int256(__warp_2_amountIn);
        
        warp_external_input_check_int128(__warp_1_liquidity);
        
        warp_external_input_check_int160(__warp_0_sqrtP);
        
        let (__warp_pse_0) = SqrtPriceMathTest.s1_getNextSqrtPriceFromInput_aa58276a(__warp_0_sqrtP, __warp_1_liquidity, __warp_2_amountIn, __warp_3_zeroForOne);
        
        
        
        return (__warp_pse_0,);

    }


    @view
    func getNextSqrtPriceFromOutput_fedf2b5f{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_4_sqrtP : felt, __warp_5_liquidity : felt, __warp_6_amountOut : Uint256, __warp_7_zeroForOne : felt)-> (sqrtQ : felt){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_7_zeroForOne);
        
        warp_external_input_check_int256(__warp_6_amountOut);
        
        warp_external_input_check_int128(__warp_5_liquidity);
        
        warp_external_input_check_int160(__warp_4_sqrtP);
        
        let (__warp_pse_1) = SqrtPriceMathTest.s1_getNextSqrtPriceFromOutput_fedf2b5f(__warp_4_sqrtP, __warp_5_liquidity, __warp_6_amountOut, __warp_7_zeroForOne);
        
        
        
        return (__warp_pse_1,);

    }


    @view
    func getAmount0Delta_2c32d4b6{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_8_sqrtLower : felt, __warp_9_sqrtUpper : felt, __warp_10_liquidity : felt, __warp_11_roundUp : felt)-> (amount0 : Uint256){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_11_roundUp);
        
        warp_external_input_check_int128(__warp_10_liquidity);
        
        warp_external_input_check_int160(__warp_9_sqrtUpper);
        
        warp_external_input_check_int160(__warp_8_sqrtLower);
        
        let (__warp_pse_2) = SqrtPriceMathTest.s1_getAmount0Delta_2c32d4b6(__warp_8_sqrtLower, __warp_9_sqrtUpper, __warp_10_liquidity, __warp_11_roundUp);
        
        
        
        return (__warp_pse_2,);

    }


    @view
    func getAmount1Delta_48a0c5bd{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_sqrtLower : felt, __warp_13_sqrtUpper : felt, __warp_14_liquidity : felt, __warp_15_roundUp : felt)-> (amount1 : Uint256){
    alloc_locals;


        
        warp_external_input_check_bool(__warp_15_roundUp);
        
        warp_external_input_check_int128(__warp_14_liquidity);
        
        warp_external_input_check_int160(__warp_13_sqrtUpper);
        
        warp_external_input_check_int160(__warp_12_sqrtLower);
        
        let (__warp_pse_3) = SqrtPriceMathTest.s1_getAmount1Delta_48a0c5bd(__warp_12_sqrtLower, __warp_13_sqrtUpper, __warp_14_liquidity, __warp_15_roundUp);
        
        
        
        return (__warp_pse_3,);

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