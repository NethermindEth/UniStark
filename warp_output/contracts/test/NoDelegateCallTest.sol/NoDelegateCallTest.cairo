%lang starknet


from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import HashBuiltin
from warplib.block_methods import warp_block_timestamp
from warplib.maths.div import warp_div256
from starkware.starknet.common.syscalls import get_contract_address
from warplib.maths.eq import warp_eq


func WS0_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}


// Contract Def NoDelegateCallTest


namespace NoDelegateCallTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    const __warp_0_original = 0;


    func __warp_modifier_noDelegateCall_noDelegateCallPrivate_5dca6bf9_5{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        checkNotDelegateCall_8233c275();
        
        __warp_original_function_noDelegateCallPrivate_5dca6bf9_4();
        
        
        
        return ();

    }


    func __warp_original_function_noDelegateCallPrivate_5dca6bf9_4()-> (){
    alloc_locals;


        
        
        
        return ();

    }


    func __warp_modifier_noDelegateCall_cannotBeDelegateCalled_423ecb05_3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_parameter___warp_1_m_capture1 : Uint256)-> (__warp_ret_parameter___warp_12 : Uint256){
    alloc_locals;


        
        let __warp_ret_parameter___warp_12 = Uint256(low=0, high=0);
        
        checkNotDelegateCall_8233c275();
        
        let (__warp_pse_0) = __warp_original_function_cannotBeDelegateCalled_423ecb05_0(__warp_parameter___warp_1_m_capture1);
        
        let __warp_ret_parameter___warp_12 = __warp_pse_0;
        
        
        
        return (__warp_ret_parameter___warp_12,);

    }


    func __warp_original_function_cannotBeDelegateCalled_423ecb05_0{syscall_ptr : felt*, range_check_ptr : felt}(__warp_1_m_capture : Uint256)-> (__warp_1 : Uint256){
    alloc_locals;


        
        let __warp_1 = Uint256(low=0, high=0);
        
        let __warp_1 = __warp_1_m_capture;
        
        let (__warp_se_0) = warp_block_timestamp();
        
        let (__warp_se_1) = warp_div256(__warp_se_0, Uint256(low=5, high=0));
        
        
        
        return (__warp_se_1,);

    }


    func noDelegateCallPrivate_5dca6bf9{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        __warp_modifier_noDelegateCall_noDelegateCallPrivate_5dca6bf9_5();
        
        let __warp_uv6 = ();
        
        
        
        return ();

    }


    func __warp_constructor_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        let (__warp_se_4) = get_contract_address();
        
        WS_WRITE0(__warp_0_original, __warp_se_4);
        
        
        
        return ();

    }

    // @dev Private method is used instead of inlining into modifier because modifiers are copied into each method,
    //     and the use of immutable means the address bytes are copied in every place the modifier is used.
    func checkNotDelegateCall_8233c275{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        let (__warp_se_5) = get_contract_address();
        
        let (__warp_se_6) = WS0_READ_felt(__warp_0_original);
        
        let (__warp_se_7) = warp_eq(__warp_se_5, __warp_se_6);
        
        assert __warp_se_7 = 1;
        
        
        
        return ();

    }

}


    @view
    func canBeDelegateCalled_f45f416e{syscall_ptr : felt*, range_check_ptr : felt}()-> (__warp_0 : Uint256){
    alloc_locals;


        
        let (__warp_se_2) = warp_block_timestamp();
        
        let (__warp_se_3) = warp_div256(__warp_se_2, Uint256(low=5, high=0));
        
        
        
        return (__warp_se_3,);

    }


    @view
    func cannotBeDelegateCalled_423ecb05{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_1 : Uint256){
    alloc_locals;


        
        let __warp_1 = Uint256(low=0, high=0);
        
        let (__warp_pse_1) = NoDelegateCallTest.__warp_modifier_noDelegateCall_cannotBeDelegateCalled_423ecb05_3(__warp_1);
        
        
        
        return (__warp_pse_1,);

    }


    @view
    func callsIntoNoDelegateCallFunction_64270164{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        NoDelegateCallTest.noDelegateCallPrivate_5dca6bf9();
        
        
        
        return ();

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(1);


        
        NoDelegateCallTest.__warp_constructor_0();
        
        
        
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