%lang starknet

from warplib.maths.external_input_check_ints import warp_external_input_check_int128
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.lt_signed import warp_lt_signed128
from warplib.maths.negate import warp_negate128
from warplib.maths.sub import warp_sub
from warplib.maths.lt import warp_lt
from warplib.maths.add import warp_add128
from warplib.maths.ge import warp_ge

# Contract Def LiquidityMathTest

@storage_var
func WARP_STORAGE(index : felt) -> (val : felt):
end
@storage_var
func WARP_USED_STORAGE() -> (val : felt):
end
@storage_var
func WARP_NAMEGEN() -> (name : felt):
end
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : felt):
    alloc_locals
    let (id) = WARP_STORAGE.read(loc)
    if id == 0:
        let (id) = WARP_NAMEGEN.read()
        WARP_NAMEGEN.write(id + 1)
        WARP_STORAGE.write(loc, id + 1)
        return (id + 1)
    else:
        return (id)
    end
end

namespace LiquidityMathTest:
    # Dynamic variables - Arrays and Maps

    # Static variables

    @view
    func addDelta_402d44fb{
        syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : felt, __warp_usrid1_y : felt) -> (__warp_usrid2_z : felt):
        alloc_locals

        warp_external_input_check_int128(__warp_usrid1_y)

        warp_external_input_check_int128(__warp_usrid0_x)

        let (__warp_se_0) = s1___warp_usrfn0_addDelta(__warp_usrid0_x, __warp_usrid1_y)

        return (__warp_se_0)
    end

    func __warp_constructor_0() -> ():
        alloc_locals

        return ()
    end

    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}():
        alloc_locals

        __warp_constructor_0()

        return ()
    end

    # @notice Add a signed liquidity delta to liquidity and revert if it overflows or underflows
    # @param x The liquidity before change
    # @param y The delta by which liquidity should be changed
    # @return z The liquidity delta
    func s1___warp_usrfn0_addDelta{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid0_x : felt, __warp_usrid1_y : felt
    ) -> (__warp_usrid2_z : felt):
        alloc_locals

        let __warp_usrid2_z = 0

        let (__warp_se_1) = warp_lt_signed128(__warp_usrid1_y, 0)

        if __warp_se_1 != 0:
            let (__warp_se_2) = warp_negate128(__warp_usrid1_y)

            let (__warp_se_3) = warp_sub(__warp_usrid0_x, __warp_se_2)

            let __warp_se_4 = __warp_se_3

            let __warp_usrid2_z = __warp_se_4

            let (__warp_se_5) = warp_lt(__warp_se_4, __warp_usrid0_x)

            with_attr error_message("LS"):
                assert __warp_se_5 = 1
            end

            return (__warp_usrid2_z)
        else:
            let (__warp_se_6) = warp_add128(__warp_usrid0_x, __warp_usrid1_y)

            let __warp_se_7 = __warp_se_6

            let __warp_usrid2_z = __warp_se_7

            let (__warp_se_8) = warp_ge(__warp_se_7, __warp_usrid0_x)

            with_attr error_message("LA"):
                assert __warp_se_8 = 1
            end

            return (__warp_usrid2_z)
        end
    end
end

# Original soldity abi: ["constructor()","addDelta(uint128,int128)"]
