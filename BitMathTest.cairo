%lang starknet

from starkware.cairo.common.math_cmp import is_le_felt

func warp_external_input_check_int256{range_check_ptr}(x: Uint256) {
    alloc_locals;
    let inRangeHigh: felt = is_le_felt(x.high, 0xffffffffffffffffffffffffffffffff);
    let inRangeLow: felt = is_le_felt(x.low, 0xffffffffffffffffffffffffffffffff);
    with_attr error_message(
            "Error: value out-of-bounds. Values passed to high and low members of Uint256 must be less than 2**128.") {
        assert 1 = (inRangeHigh * inRangeLow);
    }
    return ();
}

@view
func leastSignificantBit_d230d23f{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_x : Uint256)-> (r : felt){
alloc_locals;


    warp_external_input_check_int256(__warp_1_x);
}

