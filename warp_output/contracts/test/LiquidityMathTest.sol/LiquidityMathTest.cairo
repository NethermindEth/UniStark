%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int128
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.lt_signed import warp_lt_signed128
from warplib.maths.negate import warp_negate128
from warplib.maths.sub_unsafe import warp_sub_unsafe128
from warplib.maths.lt import warp_lt
from warplib.maths.add_unsafe import warp_add_unsafe128
from warplib.maths.ge import warp_ge


// Contract Def LiquidityMathTest


namespace LiquidityMathTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    // @notice Add a signed liquidity delta to liquidity and revert if it overflows or underflows
    // @param x The liquidity before change
    // @param y The delta by which liquidity should be changed
    // @return z The liquidity delta
    func s1_addDelta_402d44fb{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : felt, __warp_1_y : felt)-> (__warp_2_z : felt){
    alloc_locals;


        
        let __warp_2_z = 0;
        
            
            let (__warp_se_0) = warp_lt_signed128(__warp_1_y, 0);
            
                
                if (__warp_se_0 != 0){
                
                    
                    let (__warp_se_1) = warp_negate128(__warp_1_y);
                    
                    let (__warp_pse_1) = warp_sub_unsafe128(__warp_0_x, __warp_se_1);
                    
                    let __warp_2_z = __warp_pse_1;
                    
                    let (__warp_se_2) = warp_lt(__warp_pse_1, __warp_0_x);
                    
                    with_attr error_message("LS"){
                        assert __warp_se_2 = 1;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_2_z = __warp_2_z;
                }else{
                
                    
                    let (__warp_pse_2) = warp_add_unsafe128(__warp_0_x, __warp_1_y);
                    
                    let __warp_2_z = __warp_pse_2;
                    
                    let (__warp_se_3) = warp_ge(__warp_pse_2, __warp_0_x);
                    
                    with_attr error_message("LA"){
                        assert __warp_se_3 = 1;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_2_z = __warp_2_z;
                }
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_2_z = __warp_2_z;
        
        
        
        return (__warp_2_z,);

    }

}


    @view
    func addDelta_402d44fb{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : felt, __warp_1_y : felt)-> (z : felt){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_1_y);
        
        warp_external_input_check_int128(__warp_0_x);
        
        let (__warp_pse_0) = LiquidityMathTest.s1_addDelta_402d44fb(__warp_0_x, __warp_1_y);
        
        
        
        return (__warp_pse_0,);

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