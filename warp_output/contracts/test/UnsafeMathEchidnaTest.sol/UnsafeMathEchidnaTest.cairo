%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.gt import warp_gt256
from warplib.maths.div import warp_div256
from warplib.maths.sub import warp_sub256
from warplib.maths.mod import warp_mod256
from warplib.maths.eq import warp_eq256
from warplib.maths.div_unsafe import warp_div_unsafe256
from warplib.maths.add_unsafe import warp_add_unsafe256


// Contract Def UnsafeMathEchidnaTest


namespace UnsafeMathEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    // @notice Returns ceil(x / y)
    // @dev division by 0 has unspecified behavior, and must be checked externally
    // @param x The dividend
    // @param y The divisor
    // @return z The quotient, ceil(x / y)
    func divRoundingUp_40226b32{range_check_ptr : felt}(__warp_0_x : Uint256, __warp_1_y : Uint256)-> (__warp_2_z : Uint256){
    alloc_locals;


        
        let __warp_2_z = Uint256(low=0, high=0);
        
            
            let __warp_3_temp = Uint256(low=0, high=0);
            
            let (__warp_se_6) = warp_mod256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_7) = warp_gt256(__warp_se_6, Uint256(low=0, high=0));
            
                
                if (__warp_se_7 != 0){
                
                    
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
            
            let (__warp_se_8) = warp_div_unsafe256(__warp_0_x, __warp_1_y);
            
            let (__warp_se_9) = warp_add_unsafe256(__warp_se_8, __warp_3_temp);
            
            let __warp_2_z = __warp_se_9;
        
        
        
        return (__warp_2_z,);

    }

}


    @view
    func checkDivRoundingUp_2724da4e{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : Uint256, __warp_1_d : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_1_d);
        
        warp_external_input_check_int256(__warp_0_x);
        
        let (__warp_se_0) = warp_gt256(__warp_1_d, Uint256(low=0, high=0));
        
        assert __warp_se_0 = 1;
        
        let (__warp_2_z) = UnsafeMathEchidnaTest.divRoundingUp_40226b32(__warp_0_x, __warp_1_d);
        
        let (__warp_se_1) = warp_div256(__warp_0_x, __warp_1_d);
        
        let (__warp_3_diff) = warp_sub256(__warp_2_z, __warp_se_1);
        
        let (__warp_se_2) = warp_mod256(__warp_0_x, __warp_1_d);
        
        let (__warp_se_3) = warp_eq256(__warp_se_2, Uint256(low=0, high=0));
        
            
            if (__warp_se_3 != 0){
            
                
                let (__warp_se_4) = warp_eq256(__warp_3_diff, Uint256(low=0, high=0));
                
                assert __warp_se_4 = 1;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
            }else{
            
                
                let (__warp_se_5) = warp_eq256(__warp_3_diff, Uint256(low=1, high=0));
                
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