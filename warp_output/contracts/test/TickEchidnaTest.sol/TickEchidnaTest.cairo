%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int24
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.le_signed import warp_le_signed24
from warplib.maths.gt_signed import warp_gt_signed24
from warplib.maths.div_signed import warp_div_signed24
from warplib.maths.mul_signed import warp_mul_signed24
from warplib.maths.negate import warp_negate24
from warplib.maths.eq import warp_eq
from warplib.maths.sub_signed import warp_sub_signed24
from warplib.maths.mod_signed import warp_mod_signed24
from warplib.maths.div import warp_div
from warplib.maths.int_conversions import warp_uint256
from warplib.maths.add import warp_add256
from warplib.maths.mul import warp_mul256
from warplib.maths.le import warp_le256
from warplib.maths.div_signed_unsafe import warp_div_signed_unsafe24
from warplib.maths.mul_signed_unsafe import warp_mul_signed_unsafe24
from warplib.maths.sub_signed_unsafe import warp_sub_signed_unsafe24
from warplib.maths.div_unsafe import warp_div_unsafe
from warplib.maths.add_unsafe import warp_add_unsafe24


struct Info_39bc053d{
    liquidityGross : felt,
    liquidityNet : felt,
    feeGrowthOutside0X128 : Uint256,
    feeGrowthOutside1X128 : Uint256,
    tickCumulativeOutside : felt,
    secondsPerLiquidityOutsideX128 : felt,
    secondsOutside : felt,
    initialized : felt,
}


func WS_STRUCT_Info_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc : felt){
   alloc_locals;
    WS1_DELETE(loc);
    WS2_DELETE(loc + 1);
    WS3_DELETE(loc + 2);
    WS3_DELETE(loc + 4);
    WS4_DELETE(loc + 6);
    WS5_DELETE(loc + 7);
    WS6_DELETE(loc + 8);
    WS7_DELETE(loc + 9);
   return ();
}

func WS1_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS2_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS3_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    WARP_STORAGE.write(loc + 1, 0);
    return ();
}

func WS4_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS5_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS6_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WS7_DELETE{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt){
    WARP_STORAGE.write(loc, 0);
    return ();
}

func WSM0_Info_39bc053d_feeGrowthOutside0X128(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM1_Info_39bc053d_feeGrowthOutside1X128(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WSM2_Info_39bc053d_liquidityGross(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM3_Info_39bc053d_secondsPerLiquidityOutsideX128(loc: felt) -> (memberLoc: felt){
    return (loc + 7,);
}

func WSM4_Info_39bc053d_tickCumulativeOutside(loc: felt) -> (memberLoc: felt){
    return (loc + 6,);
}

func WSM5_Info_39bc053d_secondsOutside(loc: felt) -> (memberLoc: felt){
    return (loc + 8,);
}

func WSM6_Info_39bc053d_initialized(loc: felt) -> (memberLoc: felt){
    return (loc + 9,);
}

func WSM7_Info_39bc053d_liquidityNet(loc: felt) -> (memberLoc: felt){
    return (loc + 1,);
}

func WS0_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    let (read1) = WARP_STORAGE.read(loc + 1);
    return (Uint256(low=read0,high=read1),);
}

func WS1_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: Uint256) -> (res: Uint256){
    WARP_STORAGE.write(loc, value.low);
    WARP_STORAGE.write(loc + 1, value.high);
    return (value,);
}

func WS_WRITE1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}

@storage_var
func WARP_MAPPING0(name: felt, index: felt) -> (resLoc : felt){
}
func WS0_INDEX_felt_to_Info_39bc053d{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING0.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 10);
        WARP_MAPPING0.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}


// Contract Def TickEchidnaTest


namespace TickEchidnaTest{

    // Dynamic variables - Arrays and Maps

    // Static variables

    // @notice Derives max liquidity per tick from given tick spacing
    // @dev Executed within the pool constructor
    // @param tickSpacing The amount of required tick separation, realized in multiples of `tickSpacing`
    //     e.g., a tickSpacing of 3 requires ticks to be initialized every 3rd tick i.e., ..., -6, -3, 0, 3, 6, ...
    // @return The max liquidity per tick
    func tickSpacingToMaxLiquidityPerTick_82c66f87{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tickSpacing : felt)-> (__warp_1 : felt){
    alloc_locals;


        
            
            let (__warp_se_17) = warp_div_signed_unsafe24(15889944, __warp_0_tickSpacing);
            
            let (__warp_2_minTick) = warp_mul_signed_unsafe24(__warp_se_17, __warp_0_tickSpacing);
            
            let (__warp_se_18) = warp_div_signed_unsafe24(887272, __warp_0_tickSpacing);
            
            let (__warp_3_maxTick) = warp_mul_signed_unsafe24(__warp_se_18, __warp_0_tickSpacing);
            
            let (__warp_se_19) = warp_sub_signed_unsafe24(__warp_3_maxTick, __warp_2_minTick);
            
            let (__warp_se_20) = warp_div_unsafe(__warp_se_19, __warp_0_tickSpacing);
            
            let (__warp_4_numTicks) = warp_add_unsafe24(__warp_se_20, 1);
            
            let (__warp_se_21) = warp_div_unsafe(340282366920938463463374607431768211455, __warp_4_numTicks);
            
            
            
            return (__warp_se_21,);

    }

}


    @view
    func checkTickSpacingToParametersInvariants_858027e5{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tickSpacing : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_0_tickSpacing);
        
        let (__warp_se_0) = warp_le_signed24(__warp_0_tickSpacing, 887272);
        
        assert __warp_se_0 = 1;
        
        let (__warp_se_1) = warp_gt_signed24(__warp_0_tickSpacing, 0);
        
        assert __warp_se_1 = 1;
        
        let (__warp_se_2) = warp_div_signed24(15889944, __warp_0_tickSpacing);
        
        let (__warp_1_minTick) = warp_mul_signed24(__warp_se_2, __warp_0_tickSpacing);
        
        let (__warp_se_3) = warp_div_signed24(887272, __warp_0_tickSpacing);
        
        let (__warp_2_maxTick) = warp_mul_signed24(__warp_se_3, __warp_0_tickSpacing);
        
        let (__warp_3_maxLiquidityPerTick) = TickEchidnaTest.tickSpacingToMaxLiquidityPerTick_82c66f87(__warp_0_tickSpacing);
        
        let (__warp_se_4) = warp_negate24(__warp_1_minTick);
        
        let (__warp_se_5) = warp_eq(__warp_2_maxTick, __warp_se_4);
        
        assert __warp_se_5 = 1;
        
        let (__warp_se_6) = warp_gt_signed24(__warp_2_maxTick, 0);
        
        assert __warp_se_6 = 1;
        
        let (__warp_se_7) = warp_sub_signed24(__warp_2_maxTick, __warp_1_minTick);
        
        let (__warp_se_8) = warp_mod_signed24(__warp_se_7, __warp_0_tickSpacing);
        
        let (__warp_se_9) = warp_eq(__warp_se_8, 0);
        
        assert __warp_se_9 = 1;
        
        let (__warp_se_10) = warp_sub_signed24(__warp_2_maxTick, __warp_1_minTick);
        
        let (__warp_se_11) = warp_div(__warp_se_10, __warp_0_tickSpacing);
        
        let (__warp_se_12) = warp_uint256(__warp_se_11);
        
        let (__warp_4_numTicks) = warp_add256(__warp_se_12, Uint256(low=1, high=0));
        
        let (__warp_se_13) = warp_uint256(__warp_3_maxLiquidityPerTick);
        
        let (__warp_se_14) = warp_mul256(__warp_se_13, __warp_4_numTicks);
        
        let (__warp_se_15) = warp_uint256(340282366920938463463374607431768211455);
        
        let (__warp_se_16) = warp_le256(__warp_se_14, __warp_se_15);
        
        assert __warp_se_16 = 1;
        
        
        
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