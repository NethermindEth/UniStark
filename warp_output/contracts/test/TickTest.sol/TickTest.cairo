%lang starknet


from starkware.cairo.common.dict import dict_read, dict_write
from starkware.cairo.common.uint256 import Uint256
from warplib.maths.external_input_check_ints import warp_external_input_check_int24, warp_external_input_check_int128, warp_external_input_check_int256, warp_external_input_check_int56, warp_external_input_check_int160, warp_external_input_check_int32
from warplib.maths.external_input_check_bool import warp_external_input_check_bool
from warplib.memory import wm_alloc
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from warplib.maths.div_signed_unsafe import warp_div_signed_unsafe24
from warplib.maths.mul_signed_unsafe import warp_mul_signed_unsafe24
from warplib.maths.sub_signed_unsafe import warp_sub_signed_unsafe24, warp_sub_signed_unsafe56, warp_sub_signed_unsafe256
from warplib.maths.div_unsafe import warp_div_unsafe
from warplib.maths.add_unsafe import warp_add_unsafe24, warp_add_unsafe128
from warplib.maths.ge_signed import warp_ge_signed24, warp_ge_signed256
from warplib.maths.sub_unsafe import warp_sub_unsafe256, warp_sub_unsafe160, warp_sub_unsafe32, warp_sub_unsafe128
from warplib.maths.lt_signed import warp_lt_signed24, warp_lt_signed128
from warplib.maths.le import warp_le
from warplib.maths.eq import warp_eq, warp_eq256
from warplib.maths.neq import warp_neq
from warplib.maths.le_signed import warp_le_signed24, warp_le_signed256
from warplib.maths.int_conversions import warp_int128_to_int256, warp_int256_to_int128
from warplib.maths.negate import warp_negate128
from warplib.maths.lt import warp_lt
from warplib.maths.ge import warp_ge
from warplib.maths.add_signed_unsafe import warp_add_signed_unsafe256


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


func wm_to_storage0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(loc : felt, mem_loc: felt) -> (loc: felt){
    alloc_locals;
let (elem_mem_loc_0) = dict_read{dict_ptr=warp_memory}(mem_loc);
WARP_STORAGE.write(loc, elem_mem_loc_0);
let (elem_mem_loc_1) = dict_read{dict_ptr=warp_memory}(mem_loc + 1);
WARP_STORAGE.write(loc + 1, elem_mem_loc_1);
let (elem_mem_loc_2) = dict_read{dict_ptr=warp_memory}(mem_loc + 2);
WARP_STORAGE.write(loc + 2, elem_mem_loc_2);
let (elem_mem_loc_3) = dict_read{dict_ptr=warp_memory}(mem_loc + 3);
WARP_STORAGE.write(loc + 3, elem_mem_loc_3);
let (elem_mem_loc_4) = dict_read{dict_ptr=warp_memory}(mem_loc + 4);
WARP_STORAGE.write(loc + 4, elem_mem_loc_4);
let (elem_mem_loc_5) = dict_read{dict_ptr=warp_memory}(mem_loc + 5);
WARP_STORAGE.write(loc + 5, elem_mem_loc_5);
let (elem_mem_loc_6) = dict_read{dict_ptr=warp_memory}(mem_loc + 6);
WARP_STORAGE.write(loc + 6, elem_mem_loc_6);
let (elem_mem_loc_7) = dict_read{dict_ptr=warp_memory}(mem_loc + 7);
WARP_STORAGE.write(loc + 7, elem_mem_loc_7);
let (elem_mem_loc_8) = dict_read{dict_ptr=warp_memory}(mem_loc + 8);
WARP_STORAGE.write(loc + 8, elem_mem_loc_8);
let (elem_mem_loc_9) = dict_read{dict_ptr=warp_memory}(mem_loc + 9);
WARP_STORAGE.write(loc + 9, elem_mem_loc_9);
    return (loc,);
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

func WSM0_Info_39bc053d_liquidityGross(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM1_Info_39bc053d_liquidityNet(loc: felt) -> (memberLoc: felt){
    return (loc + 1,);
}

func WSM2_Info_39bc053d_feeGrowthOutside0X128(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM3_Info_39bc053d_feeGrowthOutside1X128(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WSM4_Info_39bc053d_tickCumulativeOutside(loc: felt) -> (memberLoc: felt){
    return (loc + 6,);
}

func WSM5_Info_39bc053d_secondsPerLiquidityOutsideX128(loc: felt) -> (memberLoc: felt){
    return (loc + 7,);
}

func WSM6_Info_39bc053d_secondsOutside(loc: felt) -> (memberLoc: felt){
    return (loc + 8,);
}

func WSM7_Info_39bc053d_initialized(loc: felt) -> (memberLoc: felt){
    return (loc + 9,);
}

func WS0_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS1_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    let (read1) = WARP_STORAGE.read(loc + 1);
    return (Uint256(low=read0,high=read1),);
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

func extern_input_check0{range_check_ptr : felt}(arg : Info_39bc053d) -> (){
alloc_locals;
warp_external_input_check_int128(arg.liquidityGross);
warp_external_input_check_int128(arg.liquidityNet);
warp_external_input_check_int256(arg.feeGrowthOutside0X128);
warp_external_input_check_int256(arg.feeGrowthOutside1X128);
warp_external_input_check_int56(arg.tickCumulativeOutside);
warp_external_input_check_int160(arg.secondsPerLiquidityOutsideX128);
warp_external_input_check_int32(arg.secondsOutside);
warp_external_input_check_bool(arg.initialized);
return ();
}

func cd_to_memory0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(calldata : Info_39bc053d) -> (mem_loc: felt){
    alloc_locals;
    let (mem_start) = wm_alloc(Uint256(0xa, 0x0));
dict_write{dict_ptr=warp_memory}(mem_start, calldata.liquidityGross);
dict_write{dict_ptr=warp_memory}(mem_start + 1, calldata.liquidityNet);
dict_write{dict_ptr=warp_memory}(mem_start + 2, calldata.feeGrowthOutside0X128.low);
dict_write{dict_ptr=warp_memory}(mem_start + 3, calldata.feeGrowthOutside0X128.high);
dict_write{dict_ptr=warp_memory}(mem_start + 4, calldata.feeGrowthOutside1X128.low);
dict_write{dict_ptr=warp_memory}(mem_start + 5, calldata.feeGrowthOutside1X128.high);
dict_write{dict_ptr=warp_memory}(mem_start + 6, calldata.tickCumulativeOutside);
dict_write{dict_ptr=warp_memory}(mem_start + 7, calldata.secondsPerLiquidityOutsideX128);
dict_write{dict_ptr=warp_memory}(mem_start + 8, calldata.secondsOutside);
dict_write{dict_ptr=warp_memory}(mem_start + 9, calldata.initialized);
    return (mem_start,);
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


// Contract Def TickTest


namespace TickTest{

    // Dynamic variables - Arrays and Maps

    const __warp_0_ticks = 1;

    // Static variables

    // @notice Derives max liquidity per tick from given tick spacing
    // @dev Executed within the pool constructor
    // @param tickSpacing The amount of required tick separation, realized in multiples of `tickSpacing`
    //     e.g., a tickSpacing of 3 requires ticks to be initialized every 3rd tick i.e., ..., -6, -3, 0, 3, 6, ...
    // @return The max liquidity per tick
    func s1_tickSpacingToMaxLiquidityPerTick_82c66f87{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_tickSpacing : felt)-> (__warp_1 : felt){
    alloc_locals;


        
            
            let (__warp_se_9) = warp_div_signed_unsafe24(15889944, __warp_0_tickSpacing);
            
            let (__warp_2_minTick) = warp_mul_signed_unsafe24(__warp_se_9, __warp_0_tickSpacing);
            
            let (__warp_se_10) = warp_div_signed_unsafe24(887272, __warp_0_tickSpacing);
            
            let (__warp_3_maxTick) = warp_mul_signed_unsafe24(__warp_se_10, __warp_0_tickSpacing);
            
            let (__warp_se_11) = warp_sub_signed_unsafe24(__warp_3_maxTick, __warp_2_minTick);
            
            let (__warp_se_12) = warp_div_unsafe(__warp_se_11, __warp_0_tickSpacing);
            
            let (__warp_4_numTicks) = warp_add_unsafe24(__warp_se_12, 1);
            
            let (__warp_se_13) = warp_div_unsafe(340282366920938463463374607431768211455, __warp_4_numTicks);
            
            
            
            return (__warp_se_13,);

    }

    // @notice Retrieves fee growth data
    // @param self The mapping containing all tick information for initialized ticks
    // @param tickLower The lower tick boundary of the position
    // @param tickUpper The upper tick boundary of the position
    // @param tickCurrent The current tick
    // @param feeGrowthGlobal0X128 The all-time global fee growth, per unit of liquidity, in token0
    // @param feeGrowthGlobal1X128 The all-time global fee growth, per unit of liquidity, in token1
    // @return feeGrowthInside0X128 The all-time fee growth in token0, per unit of liquidity, inside the position's tick boundaries
    // @return feeGrowthInside1X128 The all-time fee growth in token1, per unit of liquidity, inside the position's tick boundaries
    func getFeeGrowthInside_5ae8{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_self : felt, __warp_6_tickLower : felt, __warp_7_tickUpper : felt, __warp_8_tickCurrent : felt, __warp_9_feeGrowthGlobal0X128 : Uint256, __warp_10_feeGrowthGlobal1X128 : Uint256)-> (__warp_11_feeGrowthInside0X128 : Uint256, __warp_12_feeGrowthInside1X128 : Uint256){
    alloc_locals;


        
        let __warp_12_feeGrowthInside1X128 = Uint256(low=0, high=0);
        
        let __warp_11_feeGrowthInside0X128 = Uint256(low=0, high=0);
        
            
            let (__warp_13_lower) = WS0_INDEX_felt_to_Info_39bc053d(__warp_5_self, __warp_6_tickLower);
            
            let (__warp_14_upper) = WS0_INDEX_felt_to_Info_39bc053d(__warp_5_self, __warp_7_tickUpper);
            
            let __warp_15_feeGrowthBelow0X128 = Uint256(low=0, high=0);
            
            let __warp_16_feeGrowthBelow1X128 = Uint256(low=0, high=0);
            
            let (__warp_se_14) = warp_ge_signed24(__warp_8_tickCurrent, __warp_6_tickLower);
            
                
                if (__warp_se_14 != 0){
                
                    
                    let (__warp_se_15) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_13_lower);
                    
                    let (__warp_se_16) = WS1_READ_Uint256(__warp_se_15);
                    
                    let __warp_15_feeGrowthBelow0X128 = __warp_se_16;
                    
                    let (__warp_se_17) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_13_lower);
                    
                    let (__warp_se_18) = WS1_READ_Uint256(__warp_se_17);
                    
                    let __warp_16_feeGrowthBelow1X128 = __warp_se_18;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
                    tempvar __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
                    tempvar __warp_10_feeGrowthGlobal1X128 = __warp_10_feeGrowthGlobal1X128;
                    tempvar __warp_16_feeGrowthBelow1X128 = __warp_16_feeGrowthBelow1X128;
                    tempvar __warp_9_feeGrowthGlobal0X128 = __warp_9_feeGrowthGlobal0X128;
                    tempvar __warp_15_feeGrowthBelow0X128 = __warp_15_feeGrowthBelow0X128;
                    tempvar __warp_14_upper = __warp_14_upper;
                    tempvar __warp_8_tickCurrent = __warp_8_tickCurrent;
                    tempvar __warp_7_tickUpper = __warp_7_tickUpper;
                }else{
                
                    
                    let (__warp_se_19) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_13_lower);
                    
                    let (__warp_se_20) = WS1_READ_Uint256(__warp_se_19);
                    
                    let (__warp_se_21) = warp_sub_unsafe256(__warp_9_feeGrowthGlobal0X128, __warp_se_20);
                    
                    let __warp_15_feeGrowthBelow0X128 = __warp_se_21;
                    
                    let (__warp_se_22) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_13_lower);
                    
                    let (__warp_se_23) = WS1_READ_Uint256(__warp_se_22);
                    
                    let (__warp_se_24) = warp_sub_unsafe256(__warp_10_feeGrowthGlobal1X128, __warp_se_23);
                    
                    let __warp_16_feeGrowthBelow1X128 = __warp_se_24;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
                    tempvar __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
                    tempvar __warp_10_feeGrowthGlobal1X128 = __warp_10_feeGrowthGlobal1X128;
                    tempvar __warp_16_feeGrowthBelow1X128 = __warp_16_feeGrowthBelow1X128;
                    tempvar __warp_9_feeGrowthGlobal0X128 = __warp_9_feeGrowthGlobal0X128;
                    tempvar __warp_15_feeGrowthBelow0X128 = __warp_15_feeGrowthBelow0X128;
                    tempvar __warp_14_upper = __warp_14_upper;
                    tempvar __warp_8_tickCurrent = __warp_8_tickCurrent;
                    tempvar __warp_7_tickUpper = __warp_7_tickUpper;
                }
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
                tempvar __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
                tempvar __warp_10_feeGrowthGlobal1X128 = __warp_10_feeGrowthGlobal1X128;
                tempvar __warp_16_feeGrowthBelow1X128 = __warp_16_feeGrowthBelow1X128;
                tempvar __warp_9_feeGrowthGlobal0X128 = __warp_9_feeGrowthGlobal0X128;
                tempvar __warp_15_feeGrowthBelow0X128 = __warp_15_feeGrowthBelow0X128;
                tempvar __warp_14_upper = __warp_14_upper;
                tempvar __warp_8_tickCurrent = __warp_8_tickCurrent;
                tempvar __warp_7_tickUpper = __warp_7_tickUpper;
            
            let __warp_17_feeGrowthAbove0X128 = Uint256(low=0, high=0);
            
            let __warp_18_feeGrowthAbove1X128 = Uint256(low=0, high=0);
            
            let (__warp_se_25) = warp_lt_signed24(__warp_8_tickCurrent, __warp_7_tickUpper);
            
                
                if (__warp_se_25 != 0){
                
                    
                    let (__warp_se_26) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_14_upper);
                    
                    let (__warp_se_27) = WS1_READ_Uint256(__warp_se_26);
                    
                    let __warp_17_feeGrowthAbove0X128 = __warp_se_27;
                    
                    let (__warp_se_28) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_14_upper);
                    
                    let (__warp_se_29) = WS1_READ_Uint256(__warp_se_28);
                    
                    let __warp_18_feeGrowthAbove1X128 = __warp_se_29;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
                    tempvar __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
                    tempvar __warp_18_feeGrowthAbove1X128 = __warp_18_feeGrowthAbove1X128;
                    tempvar __warp_10_feeGrowthGlobal1X128 = __warp_10_feeGrowthGlobal1X128;
                    tempvar __warp_16_feeGrowthBelow1X128 = __warp_16_feeGrowthBelow1X128;
                    tempvar __warp_17_feeGrowthAbove0X128 = __warp_17_feeGrowthAbove0X128;
                    tempvar __warp_9_feeGrowthGlobal0X128 = __warp_9_feeGrowthGlobal0X128;
                    tempvar __warp_15_feeGrowthBelow0X128 = __warp_15_feeGrowthBelow0X128;
                }else{
                
                    
                    let (__warp_se_30) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_14_upper);
                    
                    let (__warp_se_31) = WS1_READ_Uint256(__warp_se_30);
                    
                    let (__warp_se_32) = warp_sub_unsafe256(__warp_9_feeGrowthGlobal0X128, __warp_se_31);
                    
                    let __warp_17_feeGrowthAbove0X128 = __warp_se_32;
                    
                    let (__warp_se_33) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_14_upper);
                    
                    let (__warp_se_34) = WS1_READ_Uint256(__warp_se_33);
                    
                    let (__warp_se_35) = warp_sub_unsafe256(__warp_10_feeGrowthGlobal1X128, __warp_se_34);
                    
                    let __warp_18_feeGrowthAbove1X128 = __warp_se_35;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
                    tempvar __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
                    tempvar __warp_18_feeGrowthAbove1X128 = __warp_18_feeGrowthAbove1X128;
                    tempvar __warp_10_feeGrowthGlobal1X128 = __warp_10_feeGrowthGlobal1X128;
                    tempvar __warp_16_feeGrowthBelow1X128 = __warp_16_feeGrowthBelow1X128;
                    tempvar __warp_17_feeGrowthAbove0X128 = __warp_17_feeGrowthAbove0X128;
                    tempvar __warp_9_feeGrowthGlobal0X128 = __warp_9_feeGrowthGlobal0X128;
                    tempvar __warp_15_feeGrowthBelow0X128 = __warp_15_feeGrowthBelow0X128;
                }
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
                tempvar __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
                tempvar __warp_18_feeGrowthAbove1X128 = __warp_18_feeGrowthAbove1X128;
                tempvar __warp_10_feeGrowthGlobal1X128 = __warp_10_feeGrowthGlobal1X128;
                tempvar __warp_16_feeGrowthBelow1X128 = __warp_16_feeGrowthBelow1X128;
                tempvar __warp_17_feeGrowthAbove0X128 = __warp_17_feeGrowthAbove0X128;
                tempvar __warp_9_feeGrowthGlobal0X128 = __warp_9_feeGrowthGlobal0X128;
                tempvar __warp_15_feeGrowthBelow0X128 = __warp_15_feeGrowthBelow0X128;
            
            let (__warp_se_36) = warp_sub_unsafe256(__warp_9_feeGrowthGlobal0X128, __warp_15_feeGrowthBelow0X128);
            
            let (__warp_se_37) = warp_sub_unsafe256(__warp_se_36, __warp_17_feeGrowthAbove0X128);
            
            let __warp_11_feeGrowthInside0X128 = __warp_se_37;
            
            let (__warp_se_38) = warp_sub_unsafe256(__warp_10_feeGrowthGlobal1X128, __warp_16_feeGrowthBelow1X128);
            
            let (__warp_se_39) = warp_sub_unsafe256(__warp_se_38, __warp_18_feeGrowthAbove1X128);
            
            let __warp_12_feeGrowthInside1X128 = __warp_se_39;
        
        let __warp_11_feeGrowthInside0X128 = __warp_11_feeGrowthInside0X128;
        
        let __warp_12_feeGrowthInside1X128 = __warp_12_feeGrowthInside1X128;
        
        
        
        return (__warp_11_feeGrowthInside0X128, __warp_12_feeGrowthInside1X128);

    }

    // @notice Updates a tick and returns true if the tick was flipped from initialized to uninitialized, or vice versa
    // @param self The mapping containing all tick information for initialized ticks
    // @param tick The tick that will be updated
    // @param tickCurrent The current tick
    // @param liquidityDelta A new amount of liquidity to be added (subtracted) when tick is crossed from left to right (right to left)
    // @param feeGrowthGlobal0X128 The all-time global fee growth, per unit of liquidity, in token0
    // @param feeGrowthGlobal1X128 The all-time global fee growth, per unit of liquidity, in token1
    // @param secondsPerLiquidityCumulativeX128 The all-time seconds per max(1, liquidity) of the pool
    // @param tickCumulative The tick * time elapsed since the pool was first initialized
    // @param time The current block timestamp cast to a uint32
    // @param upper true for updating a position's upper tick, or false for updating a position's lower tick
    // @param maxLiquidity The maximum liquidity allocation for a single tick
    // @return flipped Whether the tick was flipped from initialized to uninitialized, or vice versa
    func update_3bf3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_19_self : felt, __warp_20_tick : felt, __warp_21_tickCurrent : felt, __warp_22_liquidityDelta : felt, __warp_23_feeGrowthGlobal0X128 : Uint256, __warp_24_feeGrowthGlobal1X128 : Uint256, __warp_25_secondsPerLiquidityCumulativeX128 : felt, __warp_26_tickCumulative : felt, __warp_27_time : felt, __warp_28_upper : felt, __warp_29_maxLiquidity : felt)-> (__warp_30_flipped : felt){
    alloc_locals;


        
        let __warp_30_flipped = 0;
        
        let (__warp_31_info) = WS0_INDEX_felt_to_Info_39bc053d(__warp_19_self, __warp_20_tick);
        
        let (__warp_se_40) = WSM0_Info_39bc053d_liquidityGross(__warp_31_info);
        
        let (__warp_32_liquidityGrossBefore) = WS0_READ_felt(__warp_se_40);
        
        let (__warp_33_liquidityGrossAfter) = addDelta_402d44fb(__warp_32_liquidityGrossBefore, __warp_22_liquidityDelta);
        
        let (__warp_se_41) = warp_le(__warp_33_liquidityGrossAfter, __warp_29_maxLiquidity);
        
        with_attr error_message("LO"){
            assert __warp_se_41 = 1;
        }
        
        let (__warp_se_42) = warp_eq(__warp_33_liquidityGrossAfter, 0);
        
        let (__warp_se_43) = warp_eq(__warp_32_liquidityGrossBefore, 0);
        
        let (__warp_se_44) = warp_neq(__warp_se_42, __warp_se_43);
        
        let __warp_30_flipped = __warp_se_44;
        
        let (__warp_se_45) = warp_eq(__warp_32_liquidityGrossBefore, 0);
        
            
            if (__warp_se_45 != 0){
            
                
                let (__warp_se_46) = warp_le_signed24(__warp_20_tick, __warp_21_tickCurrent);
                
                    
                    if (__warp_se_46 != 0){
                    
                        
                        let (__warp_se_47) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_31_info);
                        
                        WS_WRITE0(__warp_se_47, __warp_23_feeGrowthGlobal0X128);
                        
                        let (__warp_se_48) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_31_info);
                        
                        WS_WRITE0(__warp_se_48, __warp_24_feeGrowthGlobal1X128);
                        
                        let (__warp_se_49) = WSM5_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_31_info);
                        
                        WS_WRITE1(__warp_se_49, __warp_25_secondsPerLiquidityCumulativeX128);
                        
                        let (__warp_se_50) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_31_info);
                        
                        WS_WRITE1(__warp_se_50, __warp_26_tickCumulative);
                        
                        let (__warp_se_51) = WSM6_Info_39bc053d_secondsOutside(__warp_31_info);
                        
                        WS_WRITE1(__warp_se_51, __warp_27_time);
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_30_flipped = __warp_30_flipped;
                        tempvar __warp_28_upper = __warp_28_upper;
                        tempvar __warp_31_info = __warp_31_info;
                        tempvar __warp_22_liquidityDelta = __warp_22_liquidityDelta;
                        tempvar __warp_33_liquidityGrossAfter = __warp_33_liquidityGrossAfter;
                    }else{
                    
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_30_flipped = __warp_30_flipped;
                        tempvar __warp_28_upper = __warp_28_upper;
                        tempvar __warp_31_info = __warp_31_info;
                        tempvar __warp_22_liquidityDelta = __warp_22_liquidityDelta;
                        tempvar __warp_33_liquidityGrossAfter = __warp_33_liquidityGrossAfter;
                    }
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_30_flipped = __warp_30_flipped;
                    tempvar __warp_28_upper = __warp_28_upper;
                    tempvar __warp_31_info = __warp_31_info;
                    tempvar __warp_22_liquidityDelta = __warp_22_liquidityDelta;
                    tempvar __warp_33_liquidityGrossAfter = __warp_33_liquidityGrossAfter;
                
                let (__warp_se_52) = WSM7_Info_39bc053d_initialized(__warp_31_info);
                
                WS_WRITE1(__warp_se_52, 1);
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_30_flipped = __warp_30_flipped;
                tempvar __warp_28_upper = __warp_28_upper;
                tempvar __warp_31_info = __warp_31_info;
                tempvar __warp_22_liquidityDelta = __warp_22_liquidityDelta;
                tempvar __warp_33_liquidityGrossAfter = __warp_33_liquidityGrossAfter;
            }else{
            
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_30_flipped = __warp_30_flipped;
                tempvar __warp_28_upper = __warp_28_upper;
                tempvar __warp_31_info = __warp_31_info;
                tempvar __warp_22_liquidityDelta = __warp_22_liquidityDelta;
                tempvar __warp_33_liquidityGrossAfter = __warp_33_liquidityGrossAfter;
            }
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar range_check_ptr = range_check_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_30_flipped = __warp_30_flipped;
            tempvar __warp_28_upper = __warp_28_upper;
            tempvar __warp_31_info = __warp_31_info;
            tempvar __warp_22_liquidityDelta = __warp_22_liquidityDelta;
            tempvar __warp_33_liquidityGrossAfter = __warp_33_liquidityGrossAfter;
        
        let (__warp_se_53) = WSM0_Info_39bc053d_liquidityGross(__warp_31_info);
        
        WS_WRITE1(__warp_se_53, __warp_33_liquidityGrossAfter);
        
            
            if (__warp_28_upper != 0){
            
                
                let (__warp_se_54) = WSM1_Info_39bc053d_liquidityNet(__warp_31_info);
                
                let (__warp_se_55) = WS0_READ_felt(__warp_se_54);
                
                let (__warp_se_56) = warp_int128_to_int256(__warp_se_55);
                
                let (__warp_se_57) = warp_int128_to_int256(__warp_22_liquidityDelta);
                
                let (__warp_pse_3) = sub_adefc37b(__warp_se_56, __warp_se_57);
                
                let (__warp_pse_4) = toInt128_dd2a0316(__warp_pse_3);
                
                let (__warp_se_58) = WSM1_Info_39bc053d_liquidityNet(__warp_31_info);
                
                WS_WRITE1(__warp_se_58, __warp_pse_4);
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_30_flipped = __warp_30_flipped;
            }else{
            
                
                let (__warp_se_59) = WSM1_Info_39bc053d_liquidityNet(__warp_31_info);
                
                let (__warp_se_60) = WS0_READ_felt(__warp_se_59);
                
                let (__warp_se_61) = warp_int128_to_int256(__warp_se_60);
                
                let (__warp_se_62) = warp_int128_to_int256(__warp_22_liquidityDelta);
                
                let (__warp_pse_5) = add_a5f3c23b(__warp_se_61, __warp_se_62);
                
                let (__warp_pse_6) = toInt128_dd2a0316(__warp_pse_5);
                
                let (__warp_se_63) = WSM1_Info_39bc053d_liquidityNet(__warp_31_info);
                
                WS_WRITE1(__warp_se_63, __warp_pse_6);
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_30_flipped = __warp_30_flipped;
            }
            tempvar syscall_ptr = syscall_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar range_check_ptr = range_check_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar __warp_30_flipped = __warp_30_flipped;
        
        
        
        return (__warp_30_flipped,);

    }

    // @notice Clears tick data
    // @param self The mapping containing all initialized tick information for initialized ticks
    // @param tick The tick that will be cleared
    func clear_db51{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_34_self : felt, __warp_35_tick : felt)-> (){
    alloc_locals;


        
        let (__warp_se_64) = WS0_INDEX_felt_to_Info_39bc053d(__warp_34_self, __warp_35_tick);
        
        WS_STRUCT_Info_DELETE(__warp_se_64);
        
        
        
        return ();

    }

    // @notice Transitions to next tick as needed by price movement
    // @param self The mapping containing all tick information for initialized ticks
    // @param tick The destination tick of the transition
    // @param feeGrowthGlobal0X128 The all-time global fee growth, per unit of liquidity, in token0
    // @param feeGrowthGlobal1X128 The all-time global fee growth, per unit of liquidity, in token1
    // @param secondsPerLiquidityCumulativeX128 The current seconds per liquidity
    // @param tickCumulative The tick * time elapsed since the pool was first initialized
    // @param time The current block.timestamp
    // @return liquidityNet The amount of liquidity added (subtracted) when tick is crossed from left to right (right to left)
    func cross_5d47{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_36_self : felt, __warp_37_tick : felt, __warp_38_feeGrowthGlobal0X128 : Uint256, __warp_39_feeGrowthGlobal1X128 : Uint256, __warp_40_secondsPerLiquidityCumulativeX128 : felt, __warp_41_tickCumulative : felt, __warp_42_time : felt)-> (__warp_43_liquidityNet : felt){
    alloc_locals;


        
        let __warp_43_liquidityNet = 0;
        
            
            let (__warp_44_info) = WS0_INDEX_felt_to_Info_39bc053d(__warp_36_self, __warp_37_tick);
            
            let (__warp_se_65) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_44_info);
            
            let (__warp_se_66) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_44_info);
            
            let (__warp_se_67) = WS1_READ_Uint256(__warp_se_66);
            
            let (__warp_se_68) = warp_sub_unsafe256(__warp_38_feeGrowthGlobal0X128, __warp_se_67);
            
            WS_WRITE0(__warp_se_65, __warp_se_68);
            
            let (__warp_se_69) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_44_info);
            
            let (__warp_se_70) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_44_info);
            
            let (__warp_se_71) = WS1_READ_Uint256(__warp_se_70);
            
            let (__warp_se_72) = warp_sub_unsafe256(__warp_39_feeGrowthGlobal1X128, __warp_se_71);
            
            WS_WRITE0(__warp_se_69, __warp_se_72);
            
            let (__warp_se_73) = WSM5_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_44_info);
            
            let (__warp_se_74) = WSM5_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_44_info);
            
            let (__warp_se_75) = WS0_READ_felt(__warp_se_74);
            
            let (__warp_se_76) = warp_sub_unsafe160(__warp_40_secondsPerLiquidityCumulativeX128, __warp_se_75);
            
            WS_WRITE1(__warp_se_73, __warp_se_76);
            
            let (__warp_se_77) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_44_info);
            
            let (__warp_se_78) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_44_info);
            
            let (__warp_se_79) = WS0_READ_felt(__warp_se_78);
            
            let (__warp_se_80) = warp_sub_signed_unsafe56(__warp_41_tickCumulative, __warp_se_79);
            
            WS_WRITE1(__warp_se_77, __warp_se_80);
            
            let (__warp_se_81) = WSM6_Info_39bc053d_secondsOutside(__warp_44_info);
            
            let (__warp_se_82) = WSM6_Info_39bc053d_secondsOutside(__warp_44_info);
            
            let (__warp_se_83) = WS0_READ_felt(__warp_se_82);
            
            let (__warp_se_84) = warp_sub_unsafe32(__warp_42_time, __warp_se_83);
            
            WS_WRITE1(__warp_se_81, __warp_se_84);
            
            let (__warp_se_85) = WSM1_Info_39bc053d_liquidityNet(__warp_44_info);
            
            let (__warp_se_86) = WS0_READ_felt(__warp_se_85);
            
            let __warp_43_liquidityNet = __warp_se_86;
        
        
        
        return (__warp_43_liquidityNet,);

    }

    // @notice Add a signed liquidity delta to liquidity and revert if it overflows or underflows
    // @param x The liquidity before change
    // @param y The delta by which liquidity should be changed
    // @return z The liquidity delta
    func addDelta_402d44fb{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : felt, __warp_1_y : felt)-> (__warp_2_z : felt){
    alloc_locals;


        
        let __warp_2_z = 0;
        
            
            let (__warp_se_87) = warp_lt_signed128(__warp_1_y, 0);
            
                
                if (__warp_se_87 != 0){
                
                    
                    let (__warp_se_88) = warp_negate128(__warp_1_y);
                    
                    let (__warp_pse_7) = warp_sub_unsafe128(__warp_0_x, __warp_se_88);
                    
                    let __warp_2_z = __warp_pse_7;
                    
                    let (__warp_se_89) = warp_lt(__warp_pse_7, __warp_0_x);
                    
                    with_attr error_message("LS"){
                        assert __warp_se_89 = 1;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_2_z = __warp_2_z;
                }else{
                
                    
                    let (__warp_pse_8) = warp_add_unsafe128(__warp_0_x, __warp_1_y);
                    
                    let __warp_2_z = __warp_pse_8;
                    
                    let (__warp_se_90) = warp_ge(__warp_pse_8, __warp_0_x);
                    
                    with_attr error_message("LA"){
                        assert __warp_se_90 = 1;
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

    // @notice Cast a int256 to a int128, revert on overflow or underflow
    // @param y The int256 to be downcasted
    // @return z The downcasted integer, now type int128
    func toInt128_dd2a0316{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_2_y : Uint256)-> (__warp_3_z : felt){
    alloc_locals;


        
        let __warp_3_z = 0;
        
        let (__warp_pse_10) = warp_int256_to_int128(__warp_2_y);
        
        let __warp_3_z = __warp_pse_10;
        
        let (__warp_se_91) = warp_int128_to_int256(__warp_pse_10);
        
        let (__warp_se_92) = warp_eq256(__warp_se_91, __warp_2_y);
        
        assert __warp_se_92 = 1;
        
        
        
        return (__warp_3_z,);

    }

    // @notice Returns x + y, reverts if overflows or underflows
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_a5f3c23b{range_check_ptr : felt}(__warp_9_x : Uint256, __warp_10_y : Uint256)-> (__warp_11_z : Uint256){
    alloc_locals;


        
        let __warp_11_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_14) = warp_add_signed_unsafe256(__warp_9_x, __warp_10_y);
            
            let __warp_11_z = __warp_pse_14;
            
            let (__warp_se_93) = warp_ge_signed256(__warp_pse_14, __warp_9_x);
            
            let (__warp_se_94) = warp_ge_signed256(__warp_10_y, Uint256(low=0, high=0));
            
            let (__warp_se_95) = warp_eq(__warp_se_93, __warp_se_94);
            
            assert __warp_se_95 = 1;
        
        
        
        return (__warp_11_z,);

    }

    // @notice Returns x - y, reverts if overflows or underflows
    // @param x The minuend
    // @param y The subtrahend
    // @return z The difference of x and y
    func sub_adefc37b{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_x : Uint256, __warp_13_y : Uint256)-> (__warp_14_z : Uint256){
    alloc_locals;


        
        let __warp_14_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_15) = warp_sub_signed_unsafe256(__warp_12_x, __warp_13_y);
            
            let __warp_14_z = __warp_pse_15;
            
            let (__warp_se_96) = warp_le_signed256(__warp_pse_15, __warp_12_x);
            
            let (__warp_se_97) = warp_ge_signed256(__warp_13_y, Uint256(low=0, high=0));
            
            let (__warp_se_98) = warp_eq(__warp_se_96, __warp_se_97);
            
            assert __warp_se_98 = 1;
        
        
        
        return (__warp_14_z,);

    }

}


    @view
    func tickSpacingToMaxLiquidityPerTick_82c66f87{syscall_ptr : felt*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_1_tickSpacing : felt)-> (__warp_2 : felt){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_1_tickSpacing);
        
        let (__warp_pse_0) = TickTest.s1_tickSpacingToMaxLiquidityPerTick_82c66f87(__warp_1_tickSpacing);
        
        
        
        return (__warp_pse_0,);

    }


    @external
    func setTick_5cb083ce{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_3_tick : felt, __warp_4_info : Info_39bc053d)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        extern_input_check0(__warp_4_info);
        
        warp_external_input_check_int24(__warp_3_tick);
        
        let (__warp_4_infocd_to_wm_param_) = cd_to_memory0(__warp_4_info);
        
        let (__warp_se_0) = WS0_INDEX_felt_to_Info_39bc053d(TickTest.__warp_0_ticks, __warp_3_tick);
        
        wm_to_storage0(__warp_se_0, __warp_4_infocd_to_wm_param_);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return ();
    }
    }


    @view
    func getFeeGrowthInside_30e3ff4c{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_5_tickLower : felt, __warp_6_tickUpper : felt, __warp_7_tickCurrent : felt, __warp_8_feeGrowthGlobal0X128 : Uint256, __warp_9_feeGrowthGlobal1X128 : Uint256)-> (feeGrowthInside0X128 : Uint256, feeGrowthInside1X128 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_9_feeGrowthGlobal1X128);
        
        warp_external_input_check_int256(__warp_8_feeGrowthGlobal0X128);
        
        warp_external_input_check_int24(__warp_7_tickCurrent);
        
        warp_external_input_check_int24(__warp_6_tickUpper);
        
        warp_external_input_check_int24(__warp_5_tickLower);
        
        let (feeGrowthInside0X128, feeGrowthInside1X128) = TickTest.getFeeGrowthInside_5ae8(TickTest.__warp_0_ticks, __warp_5_tickLower, __warp_6_tickUpper, __warp_7_tickCurrent, __warp_8_feeGrowthGlobal0X128, __warp_9_feeGrowthGlobal1X128);
        
        
        
        return (feeGrowthInside0X128, feeGrowthInside1X128);

    }


    @external
    func update_20b90da9{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_tick : felt, __warp_11_tickCurrent : felt, __warp_12_liquidityDelta : felt, __warp_13_feeGrowthGlobal0X128 : Uint256, __warp_14_feeGrowthGlobal1X128 : Uint256, __warp_15_secondsPerLiquidityCumulativeX128 : felt, __warp_16_tickCumulative : felt, __warp_17_time : felt, __warp_18_upper : felt, __warp_19_maxLiquidity : felt)-> (flipped : felt){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_19_maxLiquidity);
        
        warp_external_input_check_bool(__warp_18_upper);
        
        warp_external_input_check_int32(__warp_17_time);
        
        warp_external_input_check_int56(__warp_16_tickCumulative);
        
        warp_external_input_check_int160(__warp_15_secondsPerLiquidityCumulativeX128);
        
        warp_external_input_check_int256(__warp_14_feeGrowthGlobal1X128);
        
        warp_external_input_check_int256(__warp_13_feeGrowthGlobal0X128);
        
        warp_external_input_check_int128(__warp_12_liquidityDelta);
        
        warp_external_input_check_int24(__warp_11_tickCurrent);
        
        warp_external_input_check_int24(__warp_10_tick);
        
        let (__warp_pse_1) = TickTest.update_3bf3(TickTest.__warp_0_ticks, __warp_10_tick, __warp_11_tickCurrent, __warp_12_liquidityDelta, __warp_13_feeGrowthGlobal0X128, __warp_14_feeGrowthGlobal1X128, __warp_15_secondsPerLiquidityCumulativeX128, __warp_16_tickCumulative, __warp_17_time, __warp_18_upper, __warp_19_maxLiquidity);
        
        
        
        return (__warp_pse_1,);

    }


    @external
    func clear_b613524a{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_20_tick : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_20_tick);
        
        TickTest.clear_db51(TickTest.__warp_0_ticks, __warp_20_tick);
        
        
        
        return ();

    }


    @external
    func cross_df33fa88{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_21_tick : felt, __warp_22_feeGrowthGlobal0X128 : Uint256, __warp_23_feeGrowthGlobal1X128 : Uint256, __warp_24_secondsPerLiquidityCumulativeX128 : felt, __warp_25_tickCumulative : felt, __warp_26_time : felt)-> (liquidityNet : felt){
    alloc_locals;


        
        warp_external_input_check_int32(__warp_26_time);
        
        warp_external_input_check_int56(__warp_25_tickCumulative);
        
        warp_external_input_check_int160(__warp_24_secondsPerLiquidityCumulativeX128);
        
        warp_external_input_check_int256(__warp_23_feeGrowthGlobal1X128);
        
        warp_external_input_check_int256(__warp_22_feeGrowthGlobal0X128);
        
        warp_external_input_check_int24(__warp_21_tick);
        
        let (__warp_pse_2) = TickTest.cross_5d47(TickTest.__warp_0_ticks, __warp_21_tick, __warp_22_feeGrowthGlobal0X128, __warp_23_feeGrowthGlobal1X128, __warp_24_secondsPerLiquidityCumulativeX128, __warp_25_tickCumulative, __warp_26_time);
        
        
        
        return (__warp_pse_2,);

    }


    @view
    func ticks_f30dba93{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_27__i0 : felt)-> (__warp_28 : felt, __warp_29 : felt, __warp_30 : Uint256, __warp_31 : Uint256, __warp_32 : felt, __warp_33 : felt, __warp_34 : felt, __warp_35 : felt){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_27__i0);
        
        let (__warp_36__temp0) = WS0_INDEX_felt_to_Info_39bc053d(TickTest.__warp_0_ticks, __warp_27__i0);
        
        let (__warp_se_1) = WSM0_Info_39bc053d_liquidityGross(__warp_36__temp0);
        
        let (__warp_28) = WS0_READ_felt(__warp_se_1);
        
        let (__warp_se_2) = WSM1_Info_39bc053d_liquidityNet(__warp_36__temp0);
        
        let (__warp_29) = WS0_READ_felt(__warp_se_2);
        
        let (__warp_se_3) = WSM2_Info_39bc053d_feeGrowthOutside0X128(__warp_36__temp0);
        
        let (__warp_30) = WS1_READ_Uint256(__warp_se_3);
        
        let (__warp_se_4) = WSM3_Info_39bc053d_feeGrowthOutside1X128(__warp_36__temp0);
        
        let (__warp_31) = WS1_READ_Uint256(__warp_se_4);
        
        let (__warp_se_5) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_36__temp0);
        
        let (__warp_32) = WS0_READ_felt(__warp_se_5);
        
        let (__warp_se_6) = WSM5_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_36__temp0);
        
        let (__warp_33) = WS0_READ_felt(__warp_se_6);
        
        let (__warp_se_7) = WSM6_Info_39bc053d_secondsOutside(__warp_36__temp0);
        
        let (__warp_34) = WS0_READ_felt(__warp_se_7);
        
        let (__warp_se_8) = WSM7_Info_39bc053d_initialized(__warp_36__temp0);
        
        let (__warp_35) = WS0_READ_felt(__warp_se_8);
        
        
        
        return (__warp_28, __warp_29, __warp_30, __warp_31, __warp_32, __warp_33, __warp_34, __warp_35);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(1);
    WARP_NAMEGEN.write(1);


        
        
        
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