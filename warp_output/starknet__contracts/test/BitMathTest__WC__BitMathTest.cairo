%lang starknet

from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.gt import warp_gt256
from warplib.maths.ge import warp_ge256
from warplib.maths.shr import warp_shr256
from warplib.maths.add import warp_add8
from warplib.maths.int_conversions import warp_uint256
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.sub import warp_sub

# Contract Def BitMathTest

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

namespace BitMathTest:
    # Dynamic variables - Arrays and Maps

    # Static variables

    @view
    func mostSignificantBit_e6bcbc65{
        syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256) -> (__warp_usrid1_r : felt):
        alloc_locals

        warp_external_input_check_int256(__warp_usrid0_x)

        let (__warp_se_0) = s1___warp_usrfn0_mostSignificantBit(__warp_usrid0_x)

        return (__warp_se_0)
    end

    @view
    func leastSignificantBit_d230d23f{
        syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256) -> (__warp_usrid3_r : felt):
        alloc_locals

        warp_external_input_check_int256(__warp_usrid2_x)

        let (__warp_se_1) = s1___warp_usrfn1_leastSignificantBit(__warp_usrid2_x)

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

    # @notice Returns the index of the most significant bit of the number,
    #     where the least significant bit is at index 0 and the most significant bit is at index 255
    # @dev The function satisfies the property:
    #     x >= 2**mostSignificantBit(x) and x < 2**(mostSignificantBit(x)+1)
    # @param x the value for which to compute the most significant bit, must be greater than 0
    # @return r the index of the most significant bit
    func s1___warp_usrfn0_mostSignificantBit{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid0_x : Uint256
    ) -> (__warp_usrid1_r : felt):
        alloc_locals

        let __warp_usrid1_r = 0

        let (__warp_se_2) = warp_gt256(__warp_usrid0_x, Uint256(low=0, high=0))

        assert __warp_se_2 = 1

        let (__warp_se_3) = warp_ge256(__warp_usrid0_x, Uint256(low=0, high=1))

        if __warp_se_3 != 0:
            let (__warp_se_4) = warp_shr256(__warp_usrid0_x, 128)

            let __warp_usrid0_x = __warp_se_4

            let (__warp_se_5) = warp_add8(__warp_usrid1_r, 128)

            let __warp_usrid1_r = __warp_se_5

            let (__warp_se_6) = s1___warp_usrfn0_mostSignificantBit_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_6)
        else:
            let (__warp_se_7) = s1___warp_usrfn0_mostSignificantBit_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_7)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_8) = warp_ge256(__warp_usrid0_x, Uint256(low=18446744073709551616, high=0))

        if __warp_se_8 != 0:
            let (__warp_se_9) = warp_shr256(__warp_usrid0_x, 64)

            let __warp_usrid0_x = __warp_se_9

            let (__warp_se_10) = warp_add8(__warp_usrid1_r, 64)

            let __warp_usrid1_r = __warp_se_10

            let (__warp_se_11) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_11)
        else:
            let (__warp_se_12) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_12)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_13) = warp_ge256(__warp_usrid0_x, Uint256(low=4294967296, high=0))

        if __warp_se_13 != 0:
            let (__warp_se_14) = warp_shr256(__warp_usrid0_x, 32)

            let __warp_usrid0_x = __warp_se_14

            let (__warp_se_15) = warp_add8(__warp_usrid1_r, 32)

            let __warp_usrid1_r = __warp_se_15

            let (__warp_se_16) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_16)
        else:
            let (__warp_se_17) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_17)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_18) = warp_ge256(__warp_usrid0_x, Uint256(low=65536, high=0))

        if __warp_se_18 != 0:
            let (__warp_se_19) = warp_shr256(__warp_usrid0_x, 16)

            let __warp_usrid0_x = __warp_se_19

            let (__warp_se_20) = warp_add8(__warp_usrid1_r, 16)

            let __warp_usrid1_r = __warp_se_20

            let (
                __warp_se_21
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_21)
        else:
            let (
                __warp_se_22
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_22)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_23) = warp_ge256(__warp_usrid0_x, Uint256(low=256, high=0))

        if __warp_se_23 != 0:
            let (__warp_se_24) = warp_shr256(__warp_usrid0_x, 8)

            let __warp_usrid0_x = __warp_se_24

            let (__warp_se_25) = warp_add8(__warp_usrid1_r, 8)

            let __warp_usrid1_r = __warp_se_25

            let (
                __warp_se_26
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_26)
        else:
            let (
                __warp_se_27
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_27)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_28) = warp_ge256(__warp_usrid0_x, Uint256(low=16, high=0))

        if __warp_se_28 != 0:
            let (__warp_se_29) = warp_shr256(__warp_usrid0_x, 4)

            let __warp_usrid0_x = __warp_se_29

            let (__warp_se_30) = warp_add8(__warp_usrid1_r, 4)

            let __warp_usrid1_r = __warp_se_30

            let (
                __warp_se_31
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_31)
        else:
            let (
                __warp_se_32
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_32)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_33) = warp_ge256(__warp_usrid0_x, Uint256(low=4, high=0))

        if __warp_se_33 != 0:
            let (__warp_se_34) = warp_shr256(__warp_usrid0_x, 2)

            let __warp_usrid0_x = __warp_se_34

            let (__warp_se_35) = warp_add8(__warp_usrid1_r, 2)

            let __warp_usrid1_r = __warp_se_35

            let (
                __warp_se_36
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_36)
        else:
            let (
                __warp_se_37
            ) = s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_37)
        end
    end

    func s1___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_38) = warp_ge256(__warp_usrid0_x, Uint256(low=2, high=0))

        if __warp_se_38 != 0:
            let (__warp_se_39) = warp_add8(__warp_usrid1_r, 1)

            let __warp_usrid1_r = __warp_se_39

            return (__warp_usrid1_r)
        else:
            return (__warp_usrid1_r)
        end
    end

    # @notice Returns the index of the least significant bit of the number,
    #     where the least significant bit is at index 0 and the most significant bit is at index 255
    # @dev The function satisfies the property:
    #     (x & 2**leastSignificantBit(x)) != 0 and (x & (2**(leastSignificantBit(x)) - 1)) == 0)
    # @param x the value for which to compute the least significant bit, must be greater than 0
    # @return r the index of the least significant bit
    func s1___warp_usrfn1_leastSignificantBit{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256) -> (__warp_usrid3_r : felt):
        alloc_locals

        let __warp_usrid3_r = 0

        let (__warp_se_40) = warp_gt256(__warp_usrid2_x, Uint256(low=0, high=0))

        assert __warp_se_40 = 1

        let __warp_usrid3_r = 255

        let (__warp_se_41) = warp_uint256(340282366920938463463374607431768211455)

        let (__warp_se_42) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_41)

        let (__warp_se_43) = warp_gt256(__warp_se_42, Uint256(low=0, high=0))

        if __warp_se_43 != 0:
            let (__warp_se_44) = warp_sub(__warp_usrid3_r, 128)

            let __warp_usrid3_r = __warp_se_44

            let (__warp_se_45) = s1___warp_usrfn1_leastSignificantBit_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_45)
        else:
            let (__warp_se_46) = warp_shr256(__warp_usrid2_x, 128)

            let __warp_usrid2_x = __warp_se_46

            let (__warp_se_47) = s1___warp_usrfn1_leastSignificantBit_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_47)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_48) = warp_uint256(18446744073709551615)

        let (__warp_se_49) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_48)

        let (__warp_se_50) = warp_gt256(__warp_se_49, Uint256(low=0, high=0))

        if __warp_se_50 != 0:
            let (__warp_se_51) = warp_sub(__warp_usrid3_r, 64)

            let __warp_usrid3_r = __warp_se_51

            let (__warp_se_52) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_52)
        else:
            let (__warp_se_53) = warp_shr256(__warp_usrid2_x, 64)

            let __warp_usrid2_x = __warp_se_53

            let (__warp_se_54) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_54)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_55) = warp_uint256(4294967295)

        let (__warp_se_56) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_55)

        let (__warp_se_57) = warp_gt256(__warp_se_56, Uint256(low=0, high=0))

        if __warp_se_57 != 0:
            let (__warp_se_58) = warp_sub(__warp_usrid3_r, 32)

            let __warp_usrid3_r = __warp_se_58

            let (__warp_se_59) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_59)
        else:
            let (__warp_se_60) = warp_shr256(__warp_usrid2_x, 32)

            let __warp_usrid2_x = __warp_se_60

            let (__warp_se_61) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_61)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_62) = warp_uint256(65535)

        let (__warp_se_63) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_62)

        let (__warp_se_64) = warp_gt256(__warp_se_63, Uint256(low=0, high=0))

        if __warp_se_64 != 0:
            let (__warp_se_65) = warp_sub(__warp_usrid3_r, 16)

            let __warp_usrid3_r = __warp_se_65

            let (
                __warp_se_66
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_66)
        else:
            let (__warp_se_67) = warp_shr256(__warp_usrid2_x, 16)

            let __warp_usrid2_x = __warp_se_67

            let (
                __warp_se_68
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_68)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_69) = warp_uint256(255)

        let (__warp_se_70) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_69)

        let (__warp_se_71) = warp_gt256(__warp_se_70, Uint256(low=0, high=0))

        if __warp_se_71 != 0:
            let (__warp_se_72) = warp_sub(__warp_usrid3_r, 8)

            let __warp_usrid3_r = __warp_se_72

            let (
                __warp_se_73
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_73)
        else:
            let (__warp_se_74) = warp_shr256(__warp_usrid2_x, 8)

            let __warp_usrid2_x = __warp_se_74

            let (
                __warp_se_75
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_75)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_76) = warp_bitwise_and256(__warp_usrid2_x, Uint256(low=15, high=0))

        let (__warp_se_77) = warp_gt256(__warp_se_76, Uint256(low=0, high=0))

        if __warp_se_77 != 0:
            let (__warp_se_78) = warp_sub(__warp_usrid3_r, 4)

            let __warp_usrid3_r = __warp_se_78

            let (
                __warp_se_79
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_79)
        else:
            let (__warp_se_80) = warp_shr256(__warp_usrid2_x, 4)

            let __warp_usrid2_x = __warp_se_80

            let (
                __warp_se_81
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_81)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_82) = warp_bitwise_and256(__warp_usrid2_x, Uint256(low=3, high=0))

        let (__warp_se_83) = warp_gt256(__warp_se_82, Uint256(low=0, high=0))

        if __warp_se_83 != 0:
            let (__warp_se_84) = warp_sub(__warp_usrid3_r, 2)

            let __warp_usrid3_r = __warp_se_84

            let (
                __warp_se_85
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_85)
        else:
            let (__warp_se_86) = warp_shr256(__warp_usrid2_x, 2)

            let __warp_usrid2_x = __warp_se_86

            let (
                __warp_se_87
            ) = s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_87)
        end
    end

    func s1___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_88) = warp_bitwise_and256(__warp_usrid2_x, Uint256(low=1, high=0))

        let (__warp_se_89) = warp_gt256(__warp_se_88, Uint256(low=0, high=0))

        if __warp_se_89 != 0:
            let (__warp_se_90) = warp_sub(__warp_usrid3_r, 1)

            let __warp_usrid3_r = __warp_se_90

            return (__warp_usrid3_r)
        else:
            return (__warp_usrid3_r)
        end
    end
end

# Original soldity abi: ["constructor()","mostSignificantBit(uint256)","leastSignificantBit(uint256)"]
