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
from warplib.maths.mod import warp_mod256

# Contract Def FullMathTest

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

namespace FullMathTest:
    # Dynamic variables - Arrays and Maps

    # Static variables

    @view
    func mulDiv_aa9a0912{
        syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_y : Uint256, __warp_usrid2_z : Uint256) -> (
        __warp_usrid3_ : Uint256
    ):
        alloc_locals

        warp_external_input_check_int256(__warp_usrid2_z)

        warp_external_input_check_int256(__warp_usrid1_y)

        warp_external_input_check_int256(__warp_usrid0_x)

        let (__warp_se_0) = s1___warp_usrfn0_mulDiv(
            __warp_usrid0_x, __warp_usrid1_y, __warp_usrid2_z
        )

        return (__warp_se_0)
    end

    @view
    func mulDivRoundingUp_0af8b27f{
        syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid4_x : Uint256, __warp_usrid5_y : Uint256, __warp_usrid6_z : Uint256) -> (
        __warp_usrid7_ : Uint256
    ):
        alloc_locals

        warp_external_input_check_int256(__warp_usrid6_z)

        warp_external_input_check_int256(__warp_usrid5_y)

        warp_external_input_check_int256(__warp_usrid4_x)

        let (__warp_se_1) = s1___warp_usrfn1_mulDivRoundingUp(
            __warp_usrid4_x, __warp_usrid5_y, __warp_usrid6_z
        )

        return (__warp_se_1)
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

    # @notice Calculates floor(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    # @param a The multiplicand
    # @param b The multiplier
    # @param denominator The divisor
    # @return result The 256-bit result
    # @dev Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv
    func s1___warp_usrfn0_mulDiv{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid0_a : Uint256, __warp_usrid1_b : Uint256, __warp_usrid2_denominator : Uint256
    ) -> (__warp_usrid3_result : Uint256):
        alloc_locals

        let __warp_usrid3_result = Uint256(low=0, high=0)

        let __warp_usrid4_prod0 = Uint256(low=0, high=0)

        let (__warp_se_2) = warp_mul_unsafe256(__warp_usrid0_a, __warp_usrid1_b)

        let __warp_usrid4_prod0 = __warp_se_2

        let (__warp_usrid5_mm) = warp_mulmod(
            __warp_usrid0_a,
            __warp_usrid1_b,
            Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455),
        )

        let __warp_usrid6_prod1 = Uint256(low=0, high=0)

        let (__warp_se_3) = warp_sub_unsafe256(__warp_usrid5_mm, __warp_usrid4_prod0)

        let __warp_usrid6_prod1 = __warp_se_3

        let (__warp_se_4) = warp_lt256(__warp_usrid5_mm, __warp_usrid4_prod0)

        if __warp_se_4 != 0:
            let (__warp_se_5) = warp_sub_unsafe256(__warp_usrid6_prod1, Uint256(low=1, high=0))

            let __warp_usrid6_prod1 = __warp_se_5

            let (__warp_se_6) = s1___warp_usrfn0_mulDiv_if_part1(
                __warp_usrid6_prod1,
                __warp_usrid2_denominator,
                __warp_usrid3_result,
                __warp_usrid4_prod0,
                __warp_usrid0_a,
                __warp_usrid1_b,
            )

            return (__warp_se_6)
        else:
            let (__warp_se_7) = s1___warp_usrfn0_mulDiv_if_part1(
                __warp_usrid6_prod1,
                __warp_usrid2_denominator,
                __warp_usrid3_result,
                __warp_usrid4_prod0,
                __warp_usrid0_a,
                __warp_usrid1_b,
            )

            return (__warp_se_7)
        end
    end

    func s1___warp_usrfn0_mulDiv_if_part1{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid6_prod1 : Uint256,
        __warp_usrid2_denominator : Uint256,
        __warp_usrid3_result : Uint256,
        __warp_usrid4_prod0 : Uint256,
        __warp_usrid0_a : Uint256,
        __warp_usrid1_b : Uint256,
    ) -> (__warp_usrid3_result : Uint256):
        alloc_locals

        let (__warp_se_8) = warp_eq256(__warp_usrid6_prod1, Uint256(low=0, high=0))

        if __warp_se_8 != 0:
            let (__warp_se_9) = warp_gt256(__warp_usrid2_denominator, Uint256(low=0, high=0))

            assert __warp_se_9 = 1

            let (__warp_se_10) = warp_div_unsafe256(__warp_usrid4_prod0, __warp_usrid2_denominator)

            let __warp_usrid3_result = __warp_se_10

            return (__warp_usrid3_result)
        else:
            let (__warp_se_11) = s1___warp_usrfn0_mulDiv_if_part1_if_part1(
                __warp_usrid2_denominator,
                __warp_usrid6_prod1,
                __warp_usrid0_a,
                __warp_usrid1_b,
                __warp_usrid4_prod0,
                __warp_usrid3_result,
            )

            return (__warp_se_11)
        end
    end

    func s1___warp_usrfn0_mulDiv_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(
        __warp_usrid2_denominator : Uint256,
        __warp_usrid6_prod1 : Uint256,
        __warp_usrid0_a : Uint256,
        __warp_usrid1_b : Uint256,
        __warp_usrid4_prod0 : Uint256,
        __warp_usrid3_result : Uint256,
    ) -> (__warp_usrid3_result : Uint256):
        alloc_locals

        let (__warp_se_12) = warp_gt256(__warp_usrid2_denominator, __warp_usrid6_prod1)

        assert __warp_se_12 = 1

        let __warp_usrid7_remainder = Uint256(low=0, high=0)

        let (__warp_se_13) = warp_mulmod(
            __warp_usrid0_a, __warp_usrid1_b, __warp_usrid2_denominator
        )

        let __warp_usrid7_remainder = __warp_se_13

        let (__warp_se_14) = warp_gt256(__warp_usrid7_remainder, __warp_usrid4_prod0)

        if __warp_se_14 != 0:
            let (__warp_se_15) = warp_sub_unsafe256(__warp_usrid6_prod1, Uint256(low=1, high=0))

            let __warp_usrid6_prod1 = __warp_se_15

            let (__warp_se_16) = s1___warp_usrfn0_mulDiv_if_part1_if_part1_if_part1(
                __warp_usrid4_prod0,
                __warp_usrid7_remainder,
                __warp_usrid2_denominator,
                __warp_usrid6_prod1,
                __warp_usrid3_result,
            )

            return (__warp_se_16)
        else:
            let (__warp_se_17) = s1___warp_usrfn0_mulDiv_if_part1_if_part1_if_part1(
                __warp_usrid4_prod0,
                __warp_usrid7_remainder,
                __warp_usrid2_denominator,
                __warp_usrid6_prod1,
                __warp_usrid3_result,
            )

            return (__warp_se_17)
        end
    end

    func s1___warp_usrfn0_mulDiv_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(
        __warp_usrid4_prod0 : Uint256,
        __warp_usrid7_remainder : Uint256,
        __warp_usrid2_denominator : Uint256,
        __warp_usrid6_prod1 : Uint256,
        __warp_usrid3_result : Uint256,
    ) -> (__warp_usrid3_result : Uint256):
        alloc_locals

        let (__warp_se_18) = warp_sub_unsafe256(__warp_usrid4_prod0, __warp_usrid7_remainder)

        let __warp_usrid4_prod0 = __warp_se_18

        let (__warp_se_19) = warp_negate256(__warp_usrid2_denominator)

        let (__warp_usrid8_twos) = warp_bitwise_and256(__warp_se_19, __warp_usrid2_denominator)

        let (__warp_se_20) = warp_div_unsafe256(__warp_usrid2_denominator, __warp_usrid8_twos)

        let __warp_usrid2_denominator = __warp_se_20

        let (__warp_se_21) = warp_div_unsafe256(__warp_usrid4_prod0, __warp_usrid8_twos)

        let __warp_usrid4_prod0 = __warp_se_21

        let (__warp_se_22) = warp_sub_unsafe256(Uint256(low=0, high=0), __warp_usrid8_twos)

        let (__warp_se_23) = warp_div_unsafe256(__warp_se_22, __warp_usrid8_twos)

        let (__warp_se_24) = warp_add_unsafe256(__warp_se_23, Uint256(low=1, high=0))

        let __warp_usrid8_twos = __warp_se_24

        let (__warp_se_25) = warp_mul_unsafe256(__warp_usrid6_prod1, __warp_usrid8_twos)

        let (__warp_se_26) = warp_bitwise_or256(__warp_usrid4_prod0, __warp_se_25)

        let __warp_usrid4_prod0 = __warp_se_26

        let (__warp_se_27) = warp_mul_unsafe256(Uint256(low=3, high=0), __warp_usrid2_denominator)

        let (__warp_usrid9_inv) = warp_xor256(__warp_se_27, Uint256(low=2, high=0))

        let (__warp_se_28) = warp_mul_unsafe256(__warp_usrid2_denominator, __warp_usrid9_inv)

        let (__warp_se_29) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_28)

        let (__warp_se_30) = warp_mul_unsafe256(__warp_usrid9_inv, __warp_se_29)

        let __warp_usrid9_inv = __warp_se_30

        let (__warp_se_31) = warp_mul_unsafe256(__warp_usrid2_denominator, __warp_usrid9_inv)

        let (__warp_se_32) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_31)

        let (__warp_se_33) = warp_mul_unsafe256(__warp_usrid9_inv, __warp_se_32)

        let __warp_usrid9_inv = __warp_se_33

        let (__warp_se_34) = warp_mul_unsafe256(__warp_usrid2_denominator, __warp_usrid9_inv)

        let (__warp_se_35) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_34)

        let (__warp_se_36) = warp_mul_unsafe256(__warp_usrid9_inv, __warp_se_35)

        let __warp_usrid9_inv = __warp_se_36

        let (__warp_se_37) = warp_mul_unsafe256(__warp_usrid2_denominator, __warp_usrid9_inv)

        let (__warp_se_38) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_37)

        let (__warp_se_39) = warp_mul_unsafe256(__warp_usrid9_inv, __warp_se_38)

        let __warp_usrid9_inv = __warp_se_39

        let (__warp_se_40) = warp_mul_unsafe256(__warp_usrid2_denominator, __warp_usrid9_inv)

        let (__warp_se_41) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_40)

        let (__warp_se_42) = warp_mul_unsafe256(__warp_usrid9_inv, __warp_se_41)

        let __warp_usrid9_inv = __warp_se_42

        let (__warp_se_43) = warp_mul_unsafe256(__warp_usrid2_denominator, __warp_usrid9_inv)

        let (__warp_se_44) = warp_sub_unsafe256(Uint256(low=2, high=0), __warp_se_43)

        let (__warp_se_45) = warp_mul_unsafe256(__warp_usrid9_inv, __warp_se_44)

        let __warp_usrid9_inv = __warp_se_45

        let (__warp_se_46) = warp_mul_unsafe256(__warp_usrid4_prod0, __warp_usrid9_inv)

        let __warp_usrid3_result = __warp_se_46

        return (__warp_usrid3_result)
    end

    # @notice Calculates ceil(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
    # @param a The multiplicand
    # @param b The multiplier
    # @param denominator The divisor
    # @return result The 256-bit result
    func s1___warp_usrfn1_mulDivRoundingUp{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid10_a : Uint256, __warp_usrid11_b : Uint256, __warp_usrid12_denominator : Uint256
    ) -> (__warp_usrid13_result : Uint256):
        alloc_locals

        let __warp_usrid13_result = Uint256(low=0, high=0)

        let (__warp_se_47) = s1___warp_usrfn0_mulDiv(
            __warp_usrid10_a, __warp_usrid11_b, __warp_usrid12_denominator
        )

        let __warp_usrid13_result = __warp_se_47

        let (__warp_se_48) = warp_mul_unsafe256(__warp_usrid10_a, __warp_usrid11_b)

        let (__warp_se_49) = warp_mod256(__warp_se_48, __warp_usrid12_denominator)

        let (__warp_se_50) = warp_gt256(__warp_se_49, Uint256(low=0, high=0))

        if __warp_se_50 != 0:
            let (__warp_se_51) = warp_lt256(
                __warp_usrid13_result,
                Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455),
            )

            assert __warp_se_51 = 1

            let (__warp_se_52) = warp_add_unsafe256(__warp_usrid13_result, Uint256(low=1, high=0))

            let __warp_se_53 = __warp_se_52

            let __warp_usrid13_result = __warp_se_53

            warp_sub_unsafe256(__warp_se_53, Uint256(low=1, high=0))

            let (__warp_se_54) = s1___warp_usrfn1_mulDivRoundingUp_if_part1(__warp_usrid13_result)

            return (__warp_se_54)
        else:
            let (__warp_se_55) = s1___warp_usrfn1_mulDivRoundingUp_if_part1(__warp_usrid13_result)

            return (__warp_se_55)
        end
    end

    func s1___warp_usrfn1_mulDivRoundingUp_if_part1(__warp_usrid13_result : Uint256) -> (
        __warp_usrid13_result : Uint256
    ):
        alloc_locals

        return (__warp_usrid13_result)
    end
end

# Original soldity abi: ["constructor()","mulDiv(uint256,uint256,uint256)","mulDivRoundingUp(uint256,uint256,uint256)"]
