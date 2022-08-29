%lang starknet

from warplib.maths.external_input_check_ints import (
    warp_external_input_check_int24,
    warp_external_input_check_int16,
)
from warplib.maths.external_input_check_bool import warp_external_input_check_bool
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.eq import warp_eq
from warplib.maths.shr_signed import warp_shr_signed24
from warplib.maths.int_conversions import (
    warp_int24_to_int16,
    warp_int24_to_int8,
    warp_int8_to_int24,
    warp_uint256,
)
from warplib.maths.mod_signed import warp_mod_signed24
from warplib.maths.div_signed import warp_div_signed24
from warplib.maths.shl import warp_shl256
from warplib.maths.xor import warp_xor256
from warplib.maths.lt_signed import warp_lt_signed24
from warplib.maths.neq import warp_neq, warp_neq256
from warplib.maths.and_ import warp_and_
from warplib.maths.sub_signed import warp_sub_signed24
from warplib.maths.add_signed import warp_add_signed24
from warplib.maths.sub import warp_sub256, warp_sub
from warplib.maths.add import warp_add256, warp_add8
from warplib.maths.bitwise_and import warp_bitwise_and256
from warplib.maths.mul_signed import warp_mul_signed24
from warplib.maths.bitwise_not import warp_bitwise_not256
from warplib.maths.gt import warp_gt256
from warplib.maths.ge import warp_ge256
from warplib.maths.shr import warp_shr256

func WS0_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt
) -> (val : Uint256):
    alloc_locals
    let (read0) = WARP_STORAGE.read(loc)
    let (read1) = WARP_STORAGE.read(loc + 1)
    return (Uint256(low=read0, high=read1))
end

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
    loc : felt, value : Uint256
) -> (res : Uint256):
    WARP_STORAGE.write(loc, value.low)
    WARP_STORAGE.write(loc + 1, value.high)
    return (value)
end

@storage_var
func WARP_MAPPING0(name : felt, index : felt) -> (resLoc : felt):
end
func WS0_INDEX_felt_to_Uint256{
    syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt
}(name : felt, index : felt) -> (res : felt):
    alloc_locals
    let (existing) = WARP_MAPPING0.read(name, index)
    if existing == 0:
        let (used) = WARP_USED_STORAGE.read()
        WARP_USED_STORAGE.write(used + 2)
        WARP_MAPPING0.write(name, index, used)
        return (used)
    else:
        return (existing)
    end
end

# Contract Def TickBitmapTest

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

namespace TickBitmapTest:
    # Dynamic variables - Arrays and Maps

    const __warp_usrid0_bitmap = 1

    # Static variables

    @external
    func flipTick_8815912f{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(__warp_usrid1_tick : felt) -> ():
        alloc_locals

        warp_external_input_check_int24(__warp_usrid1_tick)

        s1___warp_usrfn1_flipTick(__warp_usrid0_bitmap, __warp_usrid1_tick, 1)

        return ()
    end

    @view
    func nextInitializedTickWithinOneWord_3e7ba228{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(__warp_usrid2_tick : felt, __warp_usrid3_lte : felt) -> (
        __warp_usrid4_next : felt, __warp_usrid5_initialized : felt
    ):
        alloc_locals

        warp_external_input_check_bool(__warp_usrid3_lte)

        warp_external_input_check_int24(__warp_usrid2_tick)

        let (
            __warp_usrid4_next, __warp_usrid5_initialized
        ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord(
            __warp_usrid0_bitmap, __warp_usrid2_tick, 1, __warp_usrid3_lte
        )

        return (__warp_usrid4_next, __warp_usrid5_initialized)
    end

    @view
    func isInitialized_2bdc2fd3{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(__warp_usrid6_tick : felt) -> (__warp_usrid7_ : felt):
        alloc_locals

        warp_external_input_check_int24(__warp_usrid6_tick)

        let (
            __warp_usrid8_next, __warp_usrid9_initialized
        ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord(
            __warp_usrid0_bitmap, __warp_usrid6_tick, 1, 1
        )

        let (__warp_se_0) = warp_eq(__warp_usrid8_next, __warp_usrid6_tick)

        if __warp_se_0 != 0:
            return (__warp_usrid9_initialized)
        else:
            return (0)
        end
    end

    @view
    func bitmap_3ffc81ee{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(
        __warp_usrid10__i0 : felt
    ) -> (__warp_usrid11_ : Uint256):
        alloc_locals

        warp_external_input_check_int16(__warp_usrid10__i0)

        let (__warp_se_1) = WS0_INDEX_felt_to_Uint256(__warp_usrid0_bitmap, __warp_usrid10__i0)

        let (__warp_se_2) = WS0_READ_Uint256(__warp_se_1)

        return (__warp_se_2)
    end

    func __warp_constructor_0() -> ():
        alloc_locals

        return ()
    end

    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}():
        alloc_locals
        WARP_USED_STORAGE.write(1)
        WARP_NAMEGEN.write(1)

        __warp_constructor_0()

        return ()
    end

    # @notice Computes the position in the mapping where the initialized bit for a tick lives
    # @param tick The tick for which to compute the position
    # @return wordPos The key in the mapping containing the word in which the bit is stored
    # @return bitPos The bit position in the word where the flag is stored
    func s1___warp_usrfn0_position{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid0_tick : felt
    ) -> (__warp_usrid1_wordPos : felt, __warp_usrid2_bitPos : felt):
        alloc_locals

        let __warp_usrid2_bitPos = 0

        let __warp_usrid1_wordPos = 0

        let (__warp_se_3) = warp_shr_signed24(__warp_usrid0_tick, 8)

        let (__warp_se_4) = warp_int24_to_int16(__warp_se_3)

        let __warp_usrid1_wordPos = __warp_se_4

        let (__warp_se_5) = warp_mod_signed24(__warp_usrid0_tick, 256)

        let (__warp_se_6) = warp_int24_to_int8(__warp_se_5)

        let __warp_usrid2_bitPos = __warp_se_6

        let __warp_usrid1_wordPos = __warp_usrid1_wordPos

        let __warp_usrid2_bitPos = __warp_usrid2_bitPos

        return (__warp_usrid1_wordPos, __warp_usrid2_bitPos)
    end

    # @notice Flips the initialized state for a given tick from false to true, or vice versa
    # @param self The mapping in which to flip the tick
    # @param tick The tick to flip
    # @param tickSpacing The spacing between usable ticks
    func s1___warp_usrfn1_flipTick{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(__warp_usrid3_self : felt, __warp_usrid4_tick : felt, __warp_usrid5_tickSpacing : felt) -> ():
        alloc_locals

        let (__warp_se_7) = warp_mod_signed24(__warp_usrid4_tick, __warp_usrid5_tickSpacing)

        let (__warp_se_8) = warp_eq(__warp_se_7, 0)

        assert __warp_se_8 = 1

        let (__warp_se_9) = warp_div_signed24(__warp_usrid4_tick, __warp_usrid5_tickSpacing)

        let (__warp_usrid6_wordPos, __warp_usrid7_bitPos) = s1___warp_usrfn0_position(__warp_se_9)

        let (__warp_usrid8_mask) = warp_shl256(Uint256(low=1, high=0), __warp_usrid7_bitPos)

        let __warp_cs_0 = __warp_usrid6_wordPos

        let (__warp_se_10) = WS0_INDEX_felt_to_Uint256(__warp_usrid3_self, __warp_cs_0)

        let (__warp_se_11) = WS0_INDEX_felt_to_Uint256(__warp_usrid3_self, __warp_cs_0)

        let (__warp_se_12) = WS0_READ_Uint256(__warp_se_11)

        let (__warp_se_13) = warp_xor256(__warp_se_12, __warp_usrid8_mask)

        WS_WRITE0(__warp_se_10, __warp_se_13)

        return ()
    end

    # @notice Returns the next initialized tick contained in the same word (or adjacent word) as the tick that is either
    # to the left (less than or equal to) or right (greater than) of the given tick
    # @param self The mapping in which to compute the next initialized tick
    # @param tick The starting tick
    # @param tickSpacing The spacing between usable ticks
    # @param lte Whether to search for the next initialized tick to the left (less than or equal to the starting tick)
    # @return next The next initialized or uninitialized tick up to 256 ticks away from the current tick
    # @return initialized Whether the next tick is initialized, as the function only searches within up to 256 ticks
    func s1___warp_usrfn2_nextInitializedTickWithinOneWord{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(
        __warp_usrid9_self : felt,
        __warp_usrid10_tick : felt,
        __warp_usrid11_tickSpacing : felt,
        __warp_usrid12_lte : felt,
    ) -> (__warp_usrid13_next : felt, __warp_usrid14_initialized : felt):
        alloc_locals

        let __warp_usrid13_next = 0

        let __warp_usrid14_initialized = 0

        let (__warp_usrid15_compressed) = warp_div_signed24(
            __warp_usrid10_tick, __warp_usrid11_tickSpacing
        )

        let (__warp_se_14) = warp_lt_signed24(__warp_usrid10_tick, 0)

        let (__warp_se_15) = warp_mod_signed24(__warp_usrid10_tick, __warp_usrid11_tickSpacing)

        let (__warp_se_16) = warp_neq(__warp_se_15, 0)

        let (__warp_se_17) = warp_and_(__warp_se_14, __warp_se_16)

        if __warp_se_17 != 0:
            let (__warp_se_18) = warp_sub_signed24(__warp_usrid15_compressed, 1)

            let __warp_se_19 = __warp_se_18

            let __warp_usrid15_compressed = __warp_se_19

            warp_add_signed24(__warp_se_19, 1)

            let (
                __warp_usrid13_next, __warp_usrid14_initialized
            ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1(
                __warp_usrid12_lte,
                __warp_usrid15_compressed,
                __warp_usrid9_self,
                __warp_usrid14_initialized,
                __warp_usrid13_next,
                __warp_usrid11_tickSpacing,
            )

            return (__warp_usrid13_next, __warp_usrid14_initialized)
        else:
            let (
                __warp_usrid13_next, __warp_usrid14_initialized
            ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1(
                __warp_usrid12_lte,
                __warp_usrid15_compressed,
                __warp_usrid9_self,
                __warp_usrid14_initialized,
                __warp_usrid13_next,
                __warp_usrid11_tickSpacing,
            )

            return (__warp_usrid13_next, __warp_usrid14_initialized)
        end
    end

    func s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(
        __warp_usrid12_lte : felt,
        __warp_usrid15_compressed : felt,
        __warp_usrid9_self : felt,
        __warp_usrid14_initialized : felt,
        __warp_usrid13_next : felt,
        __warp_usrid11_tickSpacing : felt,
    ) -> (__warp_usrid13_next : felt, __warp_usrid14_initialized : felt):
        alloc_locals

        if __warp_usrid12_lte != 0:
            let (__warp_usrid16_wordPos, __warp_usrid17_bitPos) = s1___warp_usrfn0_position(
                __warp_usrid15_compressed
            )

            let (__warp_se_20) = warp_shl256(Uint256(low=1, high=0), __warp_usrid17_bitPos)

            let (__warp_se_21) = warp_sub256(__warp_se_20, Uint256(low=1, high=0))

            let (__warp_se_22) = warp_shl256(Uint256(low=1, high=0), __warp_usrid17_bitPos)

            let (__warp_usrid18_mask) = warp_add256(__warp_se_21, __warp_se_22)

            let (__warp_se_23) = WS0_INDEX_felt_to_Uint256(
                __warp_usrid9_self, __warp_usrid16_wordPos
            )

            let (__warp_se_24) = WS0_READ_Uint256(__warp_se_23)

            let (__warp_usrid19_masked) = warp_bitwise_and256(__warp_se_24, __warp_usrid18_mask)

            let (__warp_se_25) = warp_neq256(__warp_usrid19_masked, Uint256(low=0, high=0))

            let __warp_usrid14_initialized = __warp_se_25

            if __warp_usrid14_initialized != 0:
                let (__warp_se_26) = s2___warp_usrfn0_mostSignificantBit(__warp_usrid19_masked)

                let (__warp_se_27) = warp_sub(__warp_usrid17_bitPos, __warp_se_26)

                let (__warp_se_28) = warp_int8_to_int24(__warp_se_27)

                let (__warp_se_29) = warp_sub_signed24(__warp_usrid15_compressed, __warp_se_28)

                let (__warp_se_30) = warp_mul_signed24(__warp_se_29, __warp_usrid11_tickSpacing)

                let __warp_usrid13_next = __warp_se_30

                let (
                    __warp_usrid13_next, __warp_usrid14_initialized
                ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1_if_part2(
                    __warp_usrid13_next, __warp_usrid14_initialized
                )

                return (__warp_usrid13_next, __warp_usrid14_initialized)
            else:
                let (__warp_se_31) = warp_int8_to_int24(__warp_usrid17_bitPos)

                let (__warp_se_32) = warp_sub_signed24(__warp_usrid15_compressed, __warp_se_31)

                let (__warp_se_33) = warp_mul_signed24(__warp_se_32, __warp_usrid11_tickSpacing)

                let __warp_usrid13_next = __warp_se_33

                let (
                    __warp_usrid13_next, __warp_usrid14_initialized
                ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1_if_part2(
                    __warp_usrid13_next, __warp_usrid14_initialized
                )

                return (__warp_usrid13_next, __warp_usrid14_initialized)
            end
        else:
            let (__warp_se_34) = warp_add_signed24(__warp_usrid15_compressed, 1)

            let (__warp_usrid20_wordPos, __warp_usrid21_bitPos) = s1___warp_usrfn0_position(
                __warp_se_34
            )

            let (__warp_se_35) = warp_shl256(Uint256(low=1, high=0), __warp_usrid21_bitPos)

            let (__warp_se_36) = warp_sub256(__warp_se_35, Uint256(low=1, high=0))

            let (__warp_usrid22_mask) = warp_bitwise_not256(__warp_se_36)

            let (__warp_se_37) = WS0_INDEX_felt_to_Uint256(
                __warp_usrid9_self, __warp_usrid20_wordPos
            )

            let (__warp_se_38) = WS0_READ_Uint256(__warp_se_37)

            let (__warp_usrid23_masked) = warp_bitwise_and256(__warp_se_38, __warp_usrid22_mask)

            let (__warp_se_39) = warp_neq256(__warp_usrid23_masked, Uint256(low=0, high=0))

            let __warp_usrid14_initialized = __warp_se_39

            if __warp_usrid14_initialized != 0:
                let (__warp_se_40) = warp_add_signed24(__warp_usrid15_compressed, 1)

                let (__warp_se_41) = s2___warp_usrfn1_leastSignificantBit(__warp_usrid23_masked)

                let (__warp_se_42) = warp_sub(__warp_se_41, __warp_usrid21_bitPos)

                let (__warp_se_43) = warp_int8_to_int24(__warp_se_42)

                let (__warp_se_44) = warp_add_signed24(__warp_se_40, __warp_se_43)

                let (__warp_se_45) = warp_mul_signed24(__warp_se_44, __warp_usrid11_tickSpacing)

                let __warp_usrid13_next = __warp_se_45

                let (
                    __warp_usrid13_next, __warp_usrid14_initialized
                ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1_if_part3(
                    __warp_usrid13_next, __warp_usrid14_initialized
                )

                return (__warp_usrid13_next, __warp_usrid14_initialized)
            else:
                let (__warp_se_46) = warp_add_signed24(__warp_usrid15_compressed, 1)

                let (__warp_se_47) = warp_sub(255, __warp_usrid21_bitPos)

                let (__warp_se_48) = warp_int8_to_int24(__warp_se_47)

                let (__warp_se_49) = warp_add_signed24(__warp_se_46, __warp_se_48)

                let (__warp_se_50) = warp_mul_signed24(__warp_se_49, __warp_usrid11_tickSpacing)

                let __warp_usrid13_next = __warp_se_50

                let (
                    __warp_usrid13_next, __warp_usrid14_initialized
                ) = s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1_if_part3(
                    __warp_usrid13_next, __warp_usrid14_initialized
                )

                return (__warp_usrid13_next, __warp_usrid14_initialized)
            end
        end
    end

    func s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1_if_part3(
        __warp_usrid13_next : felt, __warp_usrid14_initialized : felt
    ) -> (__warp_usrid13_next : felt, __warp_usrid14_initialized : felt):
        alloc_locals

        let __warp_usrid13_next = __warp_usrid13_next

        let __warp_usrid14_initialized = __warp_usrid14_initialized

        return (__warp_usrid13_next, __warp_usrid14_initialized)
    end

    func s1___warp_usrfn2_nextInitializedTickWithinOneWord_if_part1_if_part2(
        __warp_usrid13_next : felt, __warp_usrid14_initialized : felt
    ) -> (__warp_usrid13_next : felt, __warp_usrid14_initialized : felt):
        alloc_locals

        let __warp_usrid13_next = __warp_usrid13_next

        let __warp_usrid14_initialized = __warp_usrid14_initialized

        return (__warp_usrid13_next, __warp_usrid14_initialized)
    end

    # @notice Returns the index of the most significant bit of the number,
    #     where the least significant bit is at index 0 and the most significant bit is at index 255
    # @dev The function satisfies the property:
    #     x >= 2**mostSignificantBit(x) and x < 2**(mostSignificantBit(x)+1)
    # @param x the value for which to compute the most significant bit, must be greater than 0
    # @return r the index of the most significant bit
    func s2___warp_usrfn0_mostSignificantBit{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(
        __warp_usrid0_x : Uint256
    ) -> (__warp_usrid1_r : felt):
        alloc_locals

        let __warp_usrid1_r = 0

        let (__warp_se_51) = warp_gt256(__warp_usrid0_x, Uint256(low=0, high=0))

        assert __warp_se_51 = 1

        let (__warp_se_52) = warp_ge256(__warp_usrid0_x, Uint256(low=0, high=1))

        if __warp_se_52 != 0:
            let (__warp_se_53) = warp_shr256(__warp_usrid0_x, 128)

            let __warp_usrid0_x = __warp_se_53

            let (__warp_se_54) = warp_add8(__warp_usrid1_r, 128)

            let __warp_usrid1_r = __warp_se_54

            let (__warp_se_55) = s2___warp_usrfn0_mostSignificantBit_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_55)
        else:
            let (__warp_se_56) = s2___warp_usrfn0_mostSignificantBit_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_56)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_57) = warp_ge256(__warp_usrid0_x, Uint256(low=18446744073709551616, high=0))

        if __warp_se_57 != 0:
            let (__warp_se_58) = warp_shr256(__warp_usrid0_x, 64)

            let __warp_usrid0_x = __warp_se_58

            let (__warp_se_59) = warp_add8(__warp_usrid1_r, 64)

            let __warp_usrid1_r = __warp_se_59

            let (__warp_se_60) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_60)
        else:
            let (__warp_se_61) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_61)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_62) = warp_ge256(__warp_usrid0_x, Uint256(low=4294967296, high=0))

        if __warp_se_62 != 0:
            let (__warp_se_63) = warp_shr256(__warp_usrid0_x, 32)

            let __warp_usrid0_x = __warp_se_63

            let (__warp_se_64) = warp_add8(__warp_usrid1_r, 32)

            let __warp_usrid1_r = __warp_se_64

            let (__warp_se_65) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_65)
        else:
            let (__warp_se_66) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_66)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_67) = warp_ge256(__warp_usrid0_x, Uint256(low=65536, high=0))

        if __warp_se_67 != 0:
            let (__warp_se_68) = warp_shr256(__warp_usrid0_x, 16)

            let __warp_usrid0_x = __warp_se_68

            let (__warp_se_69) = warp_add8(__warp_usrid1_r, 16)

            let __warp_usrid1_r = __warp_se_69

            let (
                __warp_se_70
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_70)
        else:
            let (
                __warp_se_71
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_71)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_72) = warp_ge256(__warp_usrid0_x, Uint256(low=256, high=0))

        if __warp_se_72 != 0:
            let (__warp_se_73) = warp_shr256(__warp_usrid0_x, 8)

            let __warp_usrid0_x = __warp_se_73

            let (__warp_se_74) = warp_add8(__warp_usrid1_r, 8)

            let __warp_usrid1_r = __warp_se_74

            let (
                __warp_se_75
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_75)
        else:
            let (
                __warp_se_76
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_76)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_77) = warp_ge256(__warp_usrid0_x, Uint256(low=16, high=0))

        if __warp_se_77 != 0:
            let (__warp_se_78) = warp_shr256(__warp_usrid0_x, 4)

            let __warp_usrid0_x = __warp_se_78

            let (__warp_se_79) = warp_add8(__warp_usrid1_r, 4)

            let __warp_usrid1_r = __warp_se_79

            let (
                __warp_se_80
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_80)
        else:
            let (
                __warp_se_81
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_81)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_82) = warp_ge256(__warp_usrid0_x, Uint256(low=4, high=0))

        if __warp_se_82 != 0:
            let (__warp_se_83) = warp_shr256(__warp_usrid0_x, 2)

            let __warp_usrid0_x = __warp_se_83

            let (__warp_se_84) = warp_add8(__warp_usrid1_r, 2)

            let __warp_usrid1_r = __warp_se_84

            let (
                __warp_se_85
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_85)
        else:
            let (
                __warp_se_86
            ) = s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid0_x, __warp_usrid1_r
            )

            return (__warp_se_86)
        end
    end

    func s2___warp_usrfn0_mostSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt
    }(__warp_usrid0_x : Uint256, __warp_usrid1_r : felt) -> (__warp_usrid1_r : felt):
        alloc_locals

        let (__warp_se_87) = warp_ge256(__warp_usrid0_x, Uint256(low=2, high=0))

        if __warp_se_87 != 0:
            let (__warp_se_88) = warp_add8(__warp_usrid1_r, 1)

            let __warp_usrid1_r = __warp_se_88

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
    func s2___warp_usrfn1_leastSignificantBit{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256) -> (__warp_usrid3_r : felt):
        alloc_locals

        let __warp_usrid3_r = 0

        let (__warp_se_89) = warp_gt256(__warp_usrid2_x, Uint256(low=0, high=0))

        assert __warp_se_89 = 1

        let __warp_usrid3_r = 255

        let (__warp_se_90) = warp_uint256(340282366920938463463374607431768211455)

        let (__warp_se_91) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_90)

        let (__warp_se_92) = warp_gt256(__warp_se_91, Uint256(low=0, high=0))

        if __warp_se_92 != 0:
            let (__warp_se_93) = warp_sub(__warp_usrid3_r, 128)

            let __warp_usrid3_r = __warp_se_93

            let (__warp_se_94) = s2___warp_usrfn1_leastSignificantBit_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_94)
        else:
            let (__warp_se_95) = warp_shr256(__warp_usrid2_x, 128)

            let __warp_usrid2_x = __warp_se_95

            let (__warp_se_96) = s2___warp_usrfn1_leastSignificantBit_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_96)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_97) = warp_uint256(18446744073709551615)

        let (__warp_se_98) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_97)

        let (__warp_se_99) = warp_gt256(__warp_se_98, Uint256(low=0, high=0))

        if __warp_se_99 != 0:
            let (__warp_se_100) = warp_sub(__warp_usrid3_r, 64)

            let __warp_usrid3_r = __warp_se_100

            let (__warp_se_101) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_101)
        else:
            let (__warp_se_102) = warp_shr256(__warp_usrid2_x, 64)

            let __warp_usrid2_x = __warp_se_102

            let (__warp_se_103) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_103)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_104) = warp_uint256(4294967295)

        let (__warp_se_105) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_104)

        let (__warp_se_106) = warp_gt256(__warp_se_105, Uint256(low=0, high=0))

        if __warp_se_106 != 0:
            let (__warp_se_107) = warp_sub(__warp_usrid3_r, 32)

            let __warp_usrid3_r = __warp_se_107

            let (__warp_se_108) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_108)
        else:
            let (__warp_se_109) = warp_shr256(__warp_usrid2_x, 32)

            let __warp_usrid2_x = __warp_se_109

            let (__warp_se_110) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_110)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_111) = warp_uint256(65535)

        let (__warp_se_112) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_111)

        let (__warp_se_113) = warp_gt256(__warp_se_112, Uint256(low=0, high=0))

        if __warp_se_113 != 0:
            let (__warp_se_114) = warp_sub(__warp_usrid3_r, 16)

            let __warp_usrid3_r = __warp_se_114

            let (
                __warp_se_115
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_115)
        else:
            let (__warp_se_116) = warp_shr256(__warp_usrid2_x, 16)

            let __warp_usrid2_x = __warp_se_116

            let (
                __warp_se_117
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_117)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_118) = warp_uint256(255)

        let (__warp_se_119) = warp_bitwise_and256(__warp_usrid2_x, __warp_se_118)

        let (__warp_se_120) = warp_gt256(__warp_se_119, Uint256(low=0, high=0))

        if __warp_se_120 != 0:
            let (__warp_se_121) = warp_sub(__warp_usrid3_r, 8)

            let __warp_usrid3_r = __warp_se_121

            let (
                __warp_se_122
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_122)
        else:
            let (__warp_se_123) = warp_shr256(__warp_usrid2_x, 8)

            let __warp_usrid2_x = __warp_se_123

            let (
                __warp_se_124
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_124)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_125) = warp_bitwise_and256(__warp_usrid2_x, Uint256(low=15, high=0))

        let (__warp_se_126) = warp_gt256(__warp_se_125, Uint256(low=0, high=0))

        if __warp_se_126 != 0:
            let (__warp_se_127) = warp_sub(__warp_usrid3_r, 4)

            let __warp_usrid3_r = __warp_se_127

            let (
                __warp_se_128
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_128)
        else:
            let (__warp_se_129) = warp_shr256(__warp_usrid2_x, 4)

            let __warp_usrid2_x = __warp_se_129

            let (
                __warp_se_130
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_130)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_131) = warp_bitwise_and256(__warp_usrid2_x, Uint256(low=3, high=0))

        let (__warp_se_132) = warp_gt256(__warp_se_131, Uint256(low=0, high=0))

        if __warp_se_132 != 0:
            let (__warp_se_133) = warp_sub(__warp_usrid3_r, 2)

            let __warp_usrid3_r = __warp_se_133

            let (
                __warp_se_134
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_134)
        else:
            let (__warp_se_135) = warp_shr256(__warp_usrid2_x, 2)

            let __warp_usrid2_x = __warp_se_135

            let (
                __warp_se_136
            ) = s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1(
                __warp_usrid2_x, __warp_usrid3_r
            )

            return (__warp_se_136)
        end
    end

    func s2___warp_usrfn1_leastSignificantBit_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1_if_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*
    }(__warp_usrid2_x : Uint256, __warp_usrid3_r : felt) -> (__warp_usrid3_r : felt):
        alloc_locals

        let (__warp_se_137) = warp_bitwise_and256(__warp_usrid2_x, Uint256(low=1, high=0))

        let (__warp_se_138) = warp_gt256(__warp_se_137, Uint256(low=0, high=0))

        if __warp_se_138 != 0:
            let (__warp_se_139) = warp_sub(__warp_usrid3_r, 1)

            let __warp_usrid3_r = __warp_se_139

            return (__warp_usrid3_r)
        else:
            return (__warp_usrid3_r)
        end
    end
end

# Original soldity abi: ["constructor()","flipTick(int24)","nextInitializedTickWithinOneWord(int24,bool)","isInitialized(int24)"]
