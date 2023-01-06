%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.mul_unsafe import warp_mul_unsafe256
from warplib.maths.mulmod import warp_mulmod
from warplib.maths.sub_unsafe import warp_sub_unsafe256
from warplib.maths.lt import warp_lt256
from warplib.maths.eq import warp_eq256
from warplib.maths.gt import warp_gt256
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.negate import warp_negate256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.bitwise_or import warp_bitwise_or256
from warplib.maths.xor import warp_xor256


// Contract Def FullMathTest


namespace FullMathTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    // @notice Calculates floor(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    // @param a The multiplicand
    // @param b The multiplier
    // @param denominator The divisor
    // @return result The 256-bit result
    // @dev Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv
    func s1_mulDiv_aa9a0912{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_a : Uint256, __warp_1_b : Uint256, __warp_2_denominator : Uint256)-> (__warp_3_result : Uint256){
    alloc_locals;


        
        let __warp_3_result = Uint256(low=0, high=0);
        
        let __warp_4_prod0 = Uint256(low=0, high=0);
        
            
            let (__warp_se_0) = warp_mul_unsafe256(__warp_0_a, __warp_1_b);
            
            let __warp_4_prod0 = __warp_se_0;
            
            let (__warp_5_mm) = warp_mulmod(__warp_0_a, __warp_1_b, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
            
            let __warp_6_prod1 = Uint256(low=0, high=0);
            
            let (__warp_se_1) = warp_sub_unsafe256(__warp_5_mm, __warp_4_prod0);
            
            let __warp_6_prod1 = __warp_se_1;
            
            let (__warp_se_2) = warp_lt256(__warp_5_mm, __warp_4_prod0);
            
                
                if (__warp_se_2 != 0){
                
                    
                    let (__warp_se_3) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_3;
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
            
            let (__warp_se_4) = warp_eq256(__warp_6_prod1, Uint256(low=0, high=0));
            
                
                if (__warp_se_4 != 0){
                
                    
                    let (__warp_se_5) = warp_gt256(__warp_2_denominator, Uint256(low=0, high=0));
                    
                    assert __warp_se_5 = 1;
                    
                    let (__warp_se_6) = warp_div_unsafe256(__warp_4_prod0, __warp_2_denominator);
                    
                    let __warp_3_result = __warp_se_6;
                    
                    
                    
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
            
            let (__warp_se_7) = warp_gt256(__warp_2_denominator, __warp_6_prod1);
            
            assert __warp_se_7 = 1;
            
            let __warp_7_remainder = Uint256(low=0, high=0);
            
            let (__warp_se_8) = warp_mulmod(__warp_0_a, __warp_1_b, __warp_2_denominator);
            
            let __warp_7_remainder = __warp_se_8;
            
            let (__warp_se_9) = warp_gt256(__warp_7_remainder, __warp_4_prod0);
            
                
                if (__warp_se_9 != 0){
                
                    
                    let (__warp_se_10) = warp_sub_unsafe256(__warp_6_prod1, Uint256(low=1, high=0));
                    
                    let __warp_6_prod1 = __warp_se_10;
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
            
            let (__warp_se_11) = warp_sub_unsafe256(__warp_4_prod0, __warp_7_remainder);
            
            let __warp_4_prod0 = __warp_se_11;
            
            let (__warp_se_12) = warp_negate256(__warp_2_denominator);
            
            let (__warp_8_twos) = warp_bitwise_and256(__warp_se_12, __warp_2_denominator);
            
            let (__warp_se_13) = warp_div_unsafe256(__warp_2_denominator, __warp_8_twos);
            
            let __warp_2_denominator = __warp_se_13;
            
            let (__warp_se_14) = warp_div_unsafe256(__warp_4_prod0, __warp_8_twos);
            
            let __warp_4_prod0 = __warp_se_14;
            
            let (__warp_se_15) = warp_sub_unsafe256(Uint256(low=0, high=0), __warp_8_twos);
            
            let (__warp_se_16) = warp_div_unsafe256(__warp_se_15, __warp_8_twos);
            
            let (__warp_se_17) = warp_add_unsafe256(__warp_se_16, Uint256(low=1, high=0));
            
            let __warp_8_twos = __warp_se_17;
            
            let (__warp_se_18) = warp_mul_unsafe256(__warp_6_prod1, __warp_8_twos);
            
            let (__warp_se_19) = warp_bitwise_or256(__warp_4_prod0, __warp_se_18);
            
            let __warp_4_prod0 = __warp_se_19;
            
            let (__warp_se_20) = warp_mul_unsafe256(Uint256(low=3, high=0), __warp_2_denominator);
            
            let (__warp_9_inv) = warp_xor256(__warp_se_20, Uint256(low=2, high=0));
            
            let (__warp_se_21) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_22) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_21);
            
            let (__warp_se_23) = warp_mul_unsafe256(__warp_9_inv, __warp_se_22);
            
            let __warp_9_inv = __warp_se_23;
            
            let (__warp_se_24) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_25) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_24);
            
            let (__warp_se_26) = warp_mul_unsafe256(__warp_9_inv, __warp_se_25);
            
            let __warp_9_inv = __warp_se_26;
            
            let (__warp_se_27) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_28) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_27);
            
            let (__warp_se_29) = warp_mul_unsafe256(__warp_9_inv, __warp_se_28);
            
            let __warp_9_inv = __warp_se_29;
            
            let (__warp_se_30) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_31) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_30);
            
            let (__warp_se_32) = warp_mul_unsafe256(__warp_9_inv, __warp_se_31);
            
            let __warp_9_inv = __warp_se_32;
            
            let (__warp_se_33) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_34) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_33);
            
            let (__warp_se_35) = warp_mul_unsafe256(__warp_9_inv, __warp_se_34);
            
            let __warp_9_inv = __warp_se_35;
            
            let (__warp_se_36) = warp_mul_unsafe256(__warp_2_denominator, __warp_9_inv);
            
            let (__warp_se_37) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_36);
            
            let (__warp_se_38) = warp_mul_unsafe256(__warp_9_inv, __warp_se_37);
            
            let __warp_9_inv = __warp_se_38;
            
            let (__warp_se_39) = warp_mul_unsafe256(__warp_4_prod0, __warp_9_inv);
            
            let __warp_3_result = __warp_se_39;
        
        
        
        return (__warp_3_result,);

    }

    // @notice Calculates ceil(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    // @param a The multiplicand
    // @param b The multiplier
    // @param denominator The divisor
    // @return result The 256-bit result
    func s1_mulDivRoundingUp_0af8b27f{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_a : Uint256, __warp_11_b : Uint256, __warp_12_denominator : Uint256)-> (__warp_13_result : Uint256){
    alloc_locals;


        
        let __warp_13_result = Uint256(low=0, high=0);
        
        let (__warp_pse_2) = mulDiv_aa9a0912(__warp_10_a, __warp_11_b, __warp_12_denominator);
        
        let __warp_13_result = __warp_pse_2;
        
            
            let (__warp_se_40) = warp_mulmod(__warp_10_a, __warp_11_b, __warp_12_denominator);
            
            let (__warp_se_41) = warp_gt256(__warp_se_40, Uint256(low=0, high=0));
            
                
                if (__warp_se_41 != 0){
                
                    
                    let (__warp_se_42) = warp_lt256(__warp_13_result, Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455));
                    
                    assert __warp_se_42 = 1;
                    
                    let (__warp_pse_3) = warp_add_unsafe256(__warp_13_result, Uint256(low=1, high=0));
                    
                    let __warp_13_result = __warp_pse_3;
                    
                    warp_sub_unsafe256(__warp_pse_3, Uint256(low=1, high=0));
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_13_result = __warp_13_result;
                }else{
                
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_13_result = __warp_13_result;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_13_result = __warp_13_result;
        
        
        
        return (__warp_13_result,);

    }

}


    @view
    func mulDiv_aa9a0912{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_y : Uint256, __warp_2_z : Uint256)-> (__warp_3 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_2_z);
        
        warp_external_input_check_int256(__warp_1_y);
        
        warp_external_input_check_int256(__warp_0_x);
        
        let (__warp_pse_0) = FullMathTest.s1_mulDiv_aa9a0912(__warp_0_x, __warp_1_y, __warp_2_z);
        
        
        
        return (__warp_pse_0,);

    }


    @view
    func mulDivRoundingUp_0af8b27f{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_4_x : Uint256, __warp_5_y : Uint256, __warp_6_z : Uint256)-> (__warp_7 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_6_z);
        
        warp_external_input_check_int256(__warp_5_y);
        
        warp_external_input_check_int256(__warp_4_x);
        
        let (__warp_pse_1) = FullMathTest.s1_mulDivRoundingUp_0af8b27f(__warp_4_x, __warp_5_y, __warp_6_z);
        
        
        
        return (__warp_pse_1,);

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