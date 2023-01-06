%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from warplib.maths.ge import warp_ge256
from warplib.maths.add import warp_add256
from warplib.maths.eq import warp_eq256, warp_eq
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.sub import warp_sub256
from warplib.maths.le import warp_le256
from warplib.maths.mul import warp_mul256
from warplib.maths.add_signed import warp_add_signed256
from warplib.maths.lt_signed import warp_lt_signed256
from warplib.maths.ge_signed import warp_ge_signed256
from warplib.maths.sub_signed import warp_sub_signed256
from warplib.maths.gt_signed import warp_gt_signed256
from warplib.maths.le_signed import warp_le_signed256
from warplib.maths.add_unsafe import warp_add_unsafe256
from warplib.maths.sub_unsafe import warp_sub_unsafe256
from warplib.maths.div import warp_div256
from warplib.maths.add_signed_unsafe import warp_add_signed_unsafe256
from warplib.maths.sub_signed_unsafe import warp_sub_signed_unsafe256


// Contract Def LowGasSafeMathEchidnaTest


namespace LowGasSafeMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables


    func __warp_conditional_checkAdd_0f935000_1{range_check_ptr : felt}(__warp_2_z : Uint256, __warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_rc_0 : felt, __warp_2_z : Uint256, __warp_0_x : Uint256, __warp_1_y : Uint256){
    alloc_locals;


        
        let (__warp_se_0) = warp_ge256(__warp_2_z, __warp_0_x);
        
        if (__warp_se_0 != 0){
        
            
            let (__warp_se_1) = warp_ge256(__warp_2_z, __warp_1_y);
            
            let __warp_rc_0 = __warp_se_1;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_2_z = __warp_2_z;
            
            let __warp_0_x = __warp_0_x;
            
            let __warp_1_y = __warp_1_y;
            
            
            
            return (__warp_rc_0, __warp_2_z, __warp_0_x, __warp_1_y);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_2_z = __warp_2_z;
            
            let __warp_0_x = __warp_0_x;
            
            let __warp_1_y = __warp_1_y;
            
            
            
            return (__warp_rc_0, __warp_2_z, __warp_0_x, __warp_1_y);
        }

    }


    func __warp_conditional___warp_conditional_checkMul_0fe48c5c_3_5{range_check_ptr : felt}(__warp_6_x : Uint256, __warp_7_y : Uint256)-> (__warp_rc_4 : felt, __warp_6_x : Uint256, __warp_7_y : Uint256){
    alloc_locals;


        
        let (__warp_se_7) = warp_eq256(__warp_6_x, Uint256(low=0, high=0));
        
        if (__warp_se_7 != 0){
        
            
            let __warp_rc_4 = 1;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_7_y = __warp_7_y;
            
            
            
            return (__warp_rc_4, __warp_6_x, __warp_7_y);
        }else{
        
            
            let (__warp_se_8) = warp_eq256(__warp_7_y, Uint256(low=0, high=0));
            
            let __warp_rc_4 = __warp_se_8;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_7_y = __warp_7_y;
            
            
            
            return (__warp_rc_4, __warp_6_x, __warp_7_y);
        }

    }


    func __warp_conditional___warp_conditional_checkMul_0fe48c5c_3_7{range_check_ptr : felt}(__warp_8_z : Uint256, __warp_6_x : Uint256, __warp_7_y : Uint256)-> (__warp_rc_6 : felt, __warp_8_z : Uint256, __warp_6_x : Uint256, __warp_7_y : Uint256){
    alloc_locals;


        
        let (__warp_se_9) = warp_ge256(__warp_8_z, __warp_6_x);
        
        if (__warp_se_9 != 0){
        
            
            let (__warp_se_10) = warp_ge256(__warp_8_z, __warp_7_y);
            
            let __warp_rc_6 = __warp_se_10;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_8_z = __warp_8_z;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_7_y = __warp_7_y;
            
            
            
            return (__warp_rc_6, __warp_8_z, __warp_6_x, __warp_7_y);
        }else{
        
            
            let __warp_rc_6 = 0;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_8_z = __warp_8_z;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_7_y = __warp_7_y;
            
            
            
            return (__warp_rc_6, __warp_8_z, __warp_6_x, __warp_7_y);
        }

    }


    func __warp_conditional_checkMul_0fe48c5c_3{range_check_ptr : felt}(__warp_6_x : Uint256, __warp_7_y : Uint256, __warp_8_z : Uint256)-> (__warp_rc_2 : felt, __warp_6_x : Uint256, __warp_7_y : Uint256, __warp_8_z : Uint256){
    alloc_locals;


        
        let __warp_rc_4 = 0;
        
            
            let (__warp_tv_4, __warp_tv_5, __warp_tv_6) = __warp_conditional___warp_conditional_checkMul_0fe48c5c_3_5(__warp_6_x, __warp_7_y);
            
            let __warp_7_y = __warp_tv_6;
            
            let __warp_6_x = __warp_tv_5;
            
            let __warp_rc_4 = __warp_tv_4;
        
        if (__warp_rc_4 != 0){
        
            
            let __warp_rc_2 = 1;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_7_y = __warp_7_y;
            
            let __warp_8_z = __warp_8_z;
            
            
            
            return (__warp_rc_2, __warp_6_x, __warp_7_y, __warp_8_z);
        }else{
        
            
            let __warp_rc_6 = 0;
            
                
                let (__warp_tv_7, __warp_tv_8, __warp_tv_9, __warp_tv_10) = __warp_conditional___warp_conditional_checkMul_0fe48c5c_3_7(__warp_8_z, __warp_6_x, __warp_7_y);
                
                let __warp_7_y = __warp_tv_10;
                
                let __warp_6_x = __warp_tv_9;
                
                let __warp_8_z = __warp_tv_8;
                
                let __warp_rc_6 = __warp_tv_7;
            
            let __warp_rc_2 = __warp_rc_6;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_7_y = __warp_7_y;
            
            let __warp_8_z = __warp_8_z;
            
            
            
            return (__warp_rc_2, __warp_6_x, __warp_7_y, __warp_8_z);
        }

    }

    // @notice Returns x + y, reverts if sum overflows uint256
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_771602f7{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_0) = warp_add_unsafe256(__warp_0_x, __warp_1_y);
            
            let __warp_2_z = __warp_pse_0;
            
            let (__warp_se_23) = warp_ge256(__warp_pse_0, __warp_0_x);
            
            assert __warp_se_23 = 1;
        
        
        
        return (__warp_2_z,);

    }

    // @notice Returns x - y, reverts if underflows
    // @param x The minuend
    // @param y The subtrahend
    // @return z The difference of x and y
    func sub_b67d77c5{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_3_x : Uint256, __warp_4_y : Uint256)-> (__warp_5_z : Uint256){
    alloc_locals;


        
        let __warp_5_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_1) = warp_sub_unsafe256(__warp_3_x, __warp_4_y);
            
            let __warp_5_z = __warp_pse_1;
            
            let (__warp_se_24) = warp_le256(__warp_pse_1, __warp_3_x);
            
            assert __warp_se_24 = 1;
        
        
        
        return (__warp_5_z,);

    }


    func __warp_conditional_mul_c8a4ac9c_9{range_check_ptr : felt}(__warp_6_x : Uint256, __warp_8_z : Uint256, __warp_7_y : Uint256)-> (__warp_rc_8 : felt, __warp_6_x : Uint256, __warp_8_z : Uint256, __warp_7_y : Uint256){
    alloc_locals;


        
        let (__warp_se_25) = warp_eq256(__warp_6_x, Uint256(low=0, high=0));
        
        if (__warp_se_25 != 0){
        
            
            let __warp_rc_8 = 1;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_8_z = __warp_8_z;
            
            let __warp_7_y = __warp_7_y;
            
            
            
            return (__warp_rc_8, __warp_6_x, __warp_8_z, __warp_7_y);
        }else{
        
            
            let (__warp_pse_2) = warp_mul256(__warp_6_x, __warp_7_y);
            
            let __warp_8_z = __warp_pse_2;
            
            let (__warp_se_26) = warp_div256(__warp_pse_2, __warp_6_x);
            
            let (__warp_se_27) = warp_eq256(__warp_se_26, __warp_7_y);
            
            let __warp_rc_8 = __warp_se_27;
            
            let __warp_rc_8 = __warp_rc_8;
            
            let __warp_6_x = __warp_6_x;
            
            let __warp_8_z = __warp_8_z;
            
            let __warp_7_y = __warp_7_y;
            
            
            
            return (__warp_rc_8, __warp_6_x, __warp_8_z, __warp_7_y);
        }

    }

    // @notice Returns x * y, reverts if overflows
    // @param x The multiplicand
    // @param y The multiplier
    // @return z The product of x and y
    func mul_c8a4ac9c{range_check_ptr : felt}(__warp_6_x : Uint256, __warp_7_y : Uint256)-> (__warp_8_z : Uint256){
    alloc_locals;


        
        let __warp_8_z = Uint256(low=0, high=0);
        
            
            let __warp_rc_8 = 0;
            
                
                let (__warp_tv_15, __warp_tv_16, __warp_tv_17, __warp_tv_18) = __warp_conditional_mul_c8a4ac9c_9(__warp_6_x, __warp_8_z, __warp_7_y);
                
                let __warp_7_y = __warp_tv_18;
                
                let __warp_8_z = __warp_tv_17;
                
                let __warp_6_x = __warp_tv_16;
                
                let __warp_rc_8 = __warp_tv_15;
            
            assert __warp_rc_8 = 1;
        
        
        
        return (__warp_8_z,);

    }

    // @notice Returns x + y, reverts if overflows or underflows
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_a5f3c23b{range_check_ptr : felt}(__warp_9_x : Uint256, __warp_10_y : Uint256)-> (__warp_11_z : Uint256){
    alloc_locals;


        
        let __warp_11_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_3) = warp_add_signed_unsafe256(__warp_9_x, __warp_10_y);
            
            let __warp_11_z = __warp_pse_3;
            
            let (__warp_se_28) = warp_ge_signed256(__warp_pse_3, __warp_9_x);
            
            let (__warp_se_29) = warp_ge_signed256(__warp_10_y, Uint256(low=0, high=0));
            
            let (__warp_se_30) = warp_eq(__warp_se_28, __warp_se_29);
            
            assert __warp_se_30 = 1;
        
        
        
        return (__warp_11_z,);

    }

    // @notice Returns x - y, reverts if overflows or underflows
    // @param x The minuend
    // @param y The subtrahend
    // @return z The difference of x and y
    func sub_adefc37b{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_x : Uint256, __warp_13_y : Uint256)-> (__warp_14_z : Uint256){
    alloc_locals;


        
        let __warp_14_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_4) = warp_sub_signed_unsafe256(__warp_12_x, __warp_13_y);
            
            let __warp_14_z = __warp_pse_4;
            
            let (__warp_se_31) = warp_le_signed256(__warp_pse_4, __warp_12_x);
            
            let (__warp_se_32) = warp_ge_signed256(__warp_13_y, Uint256(low=0, high=0));
            
            let (__warp_se_33) = warp_eq(__warp_se_31, __warp_se_32);
            
            assert __warp_se_33 = 1;
        
        
        
        return (__warp_14_z,);

    }

}


    @view
    func checkAdd_0f935000{syscall_ptr : felt*, range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_1_y);
        
        warp_external_input_check_int256(__warp_0_x);
        
        let (__warp_2_z) = LowGasSafeMathEchidnaTest.add_771602f7(__warp_0_x, __warp_1_y);
        
        let (__warp_se_2) = warp_add256(__warp_0_x, __warp_1_y);
        
        let (__warp_se_3) = warp_eq256(__warp_2_z, __warp_se_2);
        
        assert __warp_se_3 = 1;
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_tv_1, __warp_tv_2, __warp_tv_3) = LowGasSafeMathEchidnaTest.__warp_conditional_checkAdd_0f935000_1(__warp_2_z, __warp_0_x, __warp_1_y);
            
            let __warp_1_y = __warp_tv_3;
            
            let __warp_0_x = __warp_tv_2;
            
            let __warp_2_z = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
        assert __warp_rc_0 = 1;
        
        
        
        return ();

    }


    @view
    func checkSub_6d886fae{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_3_x : Uint256, __warp_4_y : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_4_y);
        
        warp_external_input_check_int256(__warp_3_x);
        
        let (__warp_5_z) = LowGasSafeMathEchidnaTest.sub_b67d77c5(__warp_3_x, __warp_4_y);
        
        let (__warp_se_4) = warp_sub256(__warp_3_x, __warp_4_y);
        
        let (__warp_se_5) = warp_eq256(__warp_5_z, __warp_se_4);
        
        assert __warp_se_5 = 1;
        
        let (__warp_se_6) = warp_le256(__warp_5_z, __warp_3_x);
        
        assert __warp_se_6 = 1;
        
        
        
        return ();

    }


    @view
    func checkMul_0fe48c5c{syscall_ptr : felt*, range_check_ptr : felt}(__warp_6_x : Uint256, __warp_7_y : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_7_y);
        
        warp_external_input_check_int256(__warp_6_x);
        
        let (__warp_8_z) = LowGasSafeMathEchidnaTest.mul_c8a4ac9c(__warp_6_x, __warp_7_y);
        
        let (__warp_se_11) = warp_mul256(__warp_6_x, __warp_7_y);
        
        let (__warp_se_12) = warp_eq256(__warp_8_z, __warp_se_11);
        
        assert __warp_se_12 = 1;
        
        let __warp_rc_2 = 0;
        
            
            let (__warp_tv_11, __warp_tv_12, __warp_tv_13, __warp_tv_14) = LowGasSafeMathEchidnaTest.__warp_conditional_checkMul_0fe48c5c_3(__warp_6_x, __warp_7_y, __warp_8_z);
            
            let __warp_8_z = __warp_tv_14;
            
            let __warp_7_y = __warp_tv_13;
            
            let __warp_6_x = __warp_tv_12;
            
            let __warp_rc_2 = __warp_tv_11;
        
        assert __warp_rc_2 = 1;
        
        
        
        return ();

    }


    @view
    func checkAddi_9239e777{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_9_x : Uint256, __warp_10_y : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_10_y);
        
        warp_external_input_check_int256(__warp_9_x);
        
        let (__warp_11_z) = LowGasSafeMathEchidnaTest.add_a5f3c23b(__warp_9_x, __warp_10_y);
        
        let (__warp_se_13) = warp_add_signed256(__warp_9_x, __warp_10_y);
        
        let (__warp_se_14) = warp_eq256(__warp_11_z, __warp_se_13);
        
        assert __warp_se_14 = 1;
        
        let (__warp_se_15) = warp_lt_signed256(__warp_10_y, Uint256(low=0, high=0));
        
            
            if (__warp_se_15 != 0){
            
                
                let (__warp_se_16) = warp_lt_signed256(__warp_11_z, __warp_9_x);
                
                assert __warp_se_16 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_17) = warp_ge_signed256(__warp_11_z, __warp_9_x);
                
                assert __warp_se_17 = 1;
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
    func checkSubi_bd78b20d{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_x : Uint256, __warp_13_y : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_13_y);
        
        warp_external_input_check_int256(__warp_12_x);
        
        let (__warp_14_z) = LowGasSafeMathEchidnaTest.sub_adefc37b(__warp_12_x, __warp_13_y);
        
        let (__warp_se_18) = warp_sub_signed256(__warp_12_x, __warp_13_y);
        
        let (__warp_se_19) = warp_eq256(__warp_14_z, __warp_se_18);
        
        assert __warp_se_19 = 1;
        
        let (__warp_se_20) = warp_lt_signed256(__warp_13_y, Uint256(low=0, high=0));
        
            
            if (__warp_se_20 != 0){
            
                
                let (__warp_se_21) = warp_gt_signed256(__warp_14_z, __warp_12_x);
                
                assert __warp_se_21 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_22) = warp_le_signed256(__warp_14_z, __warp_12_x);
                
                assert __warp_se_22 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
        
        
        
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