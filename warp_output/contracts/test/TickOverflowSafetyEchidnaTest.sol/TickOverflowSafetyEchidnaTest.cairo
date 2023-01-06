%lang starknet


from warplib.maths.external_input_check_ints import warp_external_input_check_int256, warp_external_input_check_int24, warp_external_input_check_int128
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from warplib.maths.neq import warp_neq
from warplib.maths.lt_signed import warp_lt_signed24, warp_lt_signed128
from warplib.maths.add_signed import warp_add_signed24, warp_add_signed256
from warplib.maths.gt import warp_gt, warp_gt256
from warplib.block_methods import warp_block_timestamp
from warplib.maths.int_conversions import warp_int256_to_int32, warp_int128_to_int256, warp_int256_to_int128
from warplib.maths.sub_signed import warp_sub_signed24
from warplib.maths.add import warp_add256
from warplib.maths.gt_signed import warp_gt_signed24
from warplib.maths.eq import warp_eq, warp_eq256
from warplib.maths.ge_signed import warp_ge_signed256
from warplib.maths.div import warp_div, warp_div256
from warplib.maths.le import warp_le
from warplib.maths.le_signed import warp_le_signed24, warp_le_signed256
from warplib.maths.sub_unsafe import warp_sub_unsafe256, warp_sub_unsafe160, warp_sub_unsafe32, warp_sub_unsafe128
from warplib.maths.sub_signed_unsafe import warp_sub_signed_unsafe56, warp_sub_signed_unsafe256
from warplib.maths.negate import warp_negate128
from warplib.maths.lt import warp_lt
from warplib.maths.add_unsafe import warp_add_unsafe128
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

func WSM1_Info_39bc053d_feeGrowthOutside0X128(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM2_Info_39bc053d_feeGrowthOutside1X128(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
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

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}

func WS_WRITE1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: Uint256) -> (res: Uint256){
    WARP_STORAGE.write(loc, value.low);
    WARP_STORAGE.write(loc + 1, value.high);
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


// Contract Def TickOverflowSafetyEchidnaTest


namespace TickOverflowSafetyEchidnaTest{

    // Dynamic variables - Arrays and Maps

    const __warp_1_ticks = 1;

    // Static variables

    const __warp_0_MAX_LIQUIDITY = 0;

    const __warp_2_tick = 2;

    const __warp_3_totalLiquidity = 3;

    const __warp_4_feeGrowthGlobal0X128 = 5;

    const __warp_5_feeGrowthGlobal1X128 = 7;

    const __warp_6_totalGrowth0 = 9;

    const __warp_7_totalGrowth1 = 11;


    func __warp_while17{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_15_target : felt)-> (__warp_15_target : felt){
    alloc_locals;


        
            
            let (__warp_se_0) = WS0_READ_felt(__warp_2_tick);
            
            let (__warp_se_1) = warp_neq(__warp_se_0, __warp_15_target);
            
                
                if (__warp_se_1 != 0){
                
                    
                    let (__warp_se_2) = WS0_READ_felt(__warp_2_tick);
                    
                    let (__warp_se_3) = warp_lt_signed24(__warp_se_2, __warp_15_target);
                    
                        
                        if (__warp_se_3 != 0){
                        
                            
                            let (__warp_se_4) = WS0_READ_felt(__warp_2_tick);
                            
                            let (__warp_se_5) = warp_add_signed24(__warp_se_4, 1);
                            
                            let (__warp_se_6) = WS0_INDEX_felt_to_Info_39bc053d(__warp_1_ticks, __warp_se_5);
                            
                            let (__warp_se_7) = WSM0_Info_39bc053d_liquidityGross(__warp_se_6);
                            
                            let (__warp_se_8) = WS0_READ_felt(__warp_se_7);
                            
                            let (__warp_se_9) = warp_gt(__warp_se_8, 0);
                            
                                
                                if (__warp_se_9 != 0){
                                
                                    
                                    let (__warp_se_10) = WS0_READ_felt(__warp_2_tick);
                                    
                                    let (__warp_se_11) = warp_add_signed24(__warp_se_10, 1);
                                    
                                    let (__warp_se_12) = WS1_READ_Uint256(__warp_4_feeGrowthGlobal0X128);
                                    
                                    let (__warp_se_13) = WS1_READ_Uint256(__warp_5_feeGrowthGlobal1X128);
                                    
                                    let (__warp_se_14) = warp_block_timestamp();
                                    
                                    let (__warp_se_15) = warp_int256_to_int32(__warp_se_14);
                                    
                                    cross_5d47(__warp_1_ticks, __warp_se_11, __warp_se_12, __warp_se_13, 0, 0, __warp_se_15);
                                    tempvar syscall_ptr = syscall_ptr;
                                    tempvar pedersen_ptr = pedersen_ptr;
                                    tempvar range_check_ptr = range_check_ptr;
                                    tempvar bitwise_ptr = bitwise_ptr;
                                    tempvar __warp_15_target = __warp_15_target;
                                }else{
                                
                                    tempvar syscall_ptr = syscall_ptr;
                                    tempvar pedersen_ptr = pedersen_ptr;
                                    tempvar range_check_ptr = range_check_ptr;
                                    tempvar bitwise_ptr = bitwise_ptr;
                                    tempvar __warp_15_target = __warp_15_target;
                                }
                                tempvar syscall_ptr = syscall_ptr;
                                tempvar pedersen_ptr = pedersen_ptr;
                                tempvar range_check_ptr = range_check_ptr;
                                tempvar bitwise_ptr = bitwise_ptr;
                                tempvar __warp_15_target = __warp_15_target;
                            
                            let (__warp_se_16) = WS0_READ_felt(__warp_2_tick);
                            
                            let (__warp_se_17) = warp_add_signed24(__warp_se_16, 1);
                            
                            let (__warp_se_18) = WS_WRITE0(__warp_2_tick, __warp_se_17);
                            
                            warp_sub_signed24(__warp_se_18, 1);
                            tempvar syscall_ptr = syscall_ptr;
                            tempvar pedersen_ptr = pedersen_ptr;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar __warp_15_target = __warp_15_target;
                        }else{
                        
                            
                            let (__warp_se_19) = WS0_READ_felt(__warp_2_tick);
                            
                            let (__warp_se_20) = WS0_INDEX_felt_to_Info_39bc053d(__warp_1_ticks, __warp_se_19);
                            
                            let (__warp_se_21) = WSM0_Info_39bc053d_liquidityGross(__warp_se_20);
                            
                            let (__warp_se_22) = WS0_READ_felt(__warp_se_21);
                            
                            let (__warp_se_23) = warp_gt(__warp_se_22, 0);
                            
                                
                                if (__warp_se_23 != 0){
                                
                                    
                                    let (__warp_se_24) = WS0_READ_felt(__warp_2_tick);
                                    
                                    let (__warp_se_25) = WS1_READ_Uint256(__warp_4_feeGrowthGlobal0X128);
                                    
                                    let (__warp_se_26) = WS1_READ_Uint256(__warp_5_feeGrowthGlobal1X128);
                                    
                                    let (__warp_se_27) = warp_block_timestamp();
                                    
                                    let (__warp_se_28) = warp_int256_to_int32(__warp_se_27);
                                    
                                    cross_5d47(__warp_1_ticks, __warp_se_24, __warp_se_25, __warp_se_26, 0, 0, __warp_se_28);
                                    tempvar syscall_ptr = syscall_ptr;
                                    tempvar pedersen_ptr = pedersen_ptr;
                                    tempvar range_check_ptr = range_check_ptr;
                                    tempvar bitwise_ptr = bitwise_ptr;
                                    tempvar __warp_15_target = __warp_15_target;
                                }else{
                                
                                    tempvar syscall_ptr = syscall_ptr;
                                    tempvar pedersen_ptr = pedersen_ptr;
                                    tempvar range_check_ptr = range_check_ptr;
                                    tempvar bitwise_ptr = bitwise_ptr;
                                    tempvar __warp_15_target = __warp_15_target;
                                }
                                tempvar syscall_ptr = syscall_ptr;
                                tempvar pedersen_ptr = pedersen_ptr;
                                tempvar range_check_ptr = range_check_ptr;
                                tempvar bitwise_ptr = bitwise_ptr;
                                tempvar __warp_15_target = __warp_15_target;
                            
                            let (__warp_se_29) = WS0_READ_felt(__warp_2_tick);
                            
                            let (__warp_se_30) = warp_sub_signed24(__warp_se_29, 1);
                            
                            let (__warp_se_31) = WS_WRITE0(__warp_2_tick, __warp_se_30);
                            
                            warp_add_signed24(__warp_se_31, 1);
                            tempvar syscall_ptr = syscall_ptr;
                            tempvar pedersen_ptr = pedersen_ptr;
                            tempvar range_check_ptr = range_check_ptr;
                            tempvar bitwise_ptr = bitwise_ptr;
                            tempvar __warp_15_target = __warp_15_target;
                        }
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar __warp_15_target = __warp_15_target;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_15_target = __warp_15_target;
                }else{
                
                    
                    
                    
                    return (__warp_15_target,);
                }
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_15_target = __warp_15_target;
        
        let (__warp_pse_0) = __warp_while17(__warp_15_target);
        
        
        
        return (__warp_pse_0,);

    }


    func __warp_init_TickOverflowSafetyEchidnaTest{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (){
    alloc_locals;


        
        let (__warp_se_90) = warp_div(340282366920938463463374607431768211455, 32);
        
        WS_WRITE0(__warp_0_MAX_LIQUIDITY, __warp_se_90);
        
        WS_WRITE0(__warp_2_tick, 0);
        
        WS_WRITE1(__warp_3_totalLiquidity, Uint256(low=0, high=0));
        
        let (__warp_se_91) = warp_div256(Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455), Uint256(low=2, high=0));
        
        WS_WRITE1(__warp_4_feeGrowthGlobal0X128, __warp_se_91);
        
        let (__warp_se_92) = warp_div256(Uint256(low=340282366920938463463374607431768211455, high=340282366920938463463374607431768211455), Uint256(low=2, high=0));
        
        WS_WRITE1(__warp_5_feeGrowthGlobal1X128, __warp_se_92);
        
        WS_WRITE1(__warp_6_totalGrowth0, Uint256(low=0, high=0));
        
        WS_WRITE1(__warp_7_totalGrowth1, Uint256(low=0, high=0));
        
        
        
        return ();

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
        
        let (__warp_se_93) = WSM0_Info_39bc053d_liquidityGross(__warp_31_info);
        
        let (__warp_32_liquidityGrossBefore) = WS0_READ_felt(__warp_se_93);
        
        let (__warp_33_liquidityGrossAfter) = addDelta_402d44fb(__warp_32_liquidityGrossBefore, __warp_22_liquidityDelta);
        
        let (__warp_se_94) = warp_le(__warp_33_liquidityGrossAfter, __warp_29_maxLiquidity);
        
        with_attr error_message("LO"){
            assert __warp_se_94 = 1;
        }
        
        let (__warp_se_95) = warp_eq(__warp_33_liquidityGrossAfter, 0);
        
        let (__warp_se_96) = warp_eq(__warp_32_liquidityGrossBefore, 0);
        
        let (__warp_se_97) = warp_neq(__warp_se_95, __warp_se_96);
        
        let __warp_30_flipped = __warp_se_97;
        
        let (__warp_se_98) = warp_eq(__warp_32_liquidityGrossBefore, 0);
        
            
            if (__warp_se_98 != 0){
            
                
                let (__warp_se_99) = warp_le_signed24(__warp_20_tick, __warp_21_tickCurrent);
                
                    
                    if (__warp_se_99 != 0){
                    
                        
                        let (__warp_se_100) = WSM1_Info_39bc053d_feeGrowthOutside0X128(__warp_31_info);
                        
                        WS_WRITE1(__warp_se_100, __warp_23_feeGrowthGlobal0X128);
                        
                        let (__warp_se_101) = WSM2_Info_39bc053d_feeGrowthOutside1X128(__warp_31_info);
                        
                        WS_WRITE1(__warp_se_101, __warp_24_feeGrowthGlobal1X128);
                        
                        let (__warp_se_102) = WSM3_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_31_info);
                        
                        WS_WRITE0(__warp_se_102, __warp_25_secondsPerLiquidityCumulativeX128);
                        
                        let (__warp_se_103) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_31_info);
                        
                        WS_WRITE0(__warp_se_103, __warp_26_tickCumulative);
                        
                        let (__warp_se_104) = WSM5_Info_39bc053d_secondsOutside(__warp_31_info);
                        
                        WS_WRITE0(__warp_se_104, __warp_27_time);
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
                
                let (__warp_se_105) = WSM6_Info_39bc053d_initialized(__warp_31_info);
                
                WS_WRITE0(__warp_se_105, 1);
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
        
        let (__warp_se_106) = WSM0_Info_39bc053d_liquidityGross(__warp_31_info);
        
        WS_WRITE0(__warp_se_106, __warp_33_liquidityGrossAfter);
        
            
            if (__warp_28_upper != 0){
            
                
                let (__warp_se_107) = WSM7_Info_39bc053d_liquidityNet(__warp_31_info);
                
                let (__warp_se_108) = WS0_READ_felt(__warp_se_107);
                
                let (__warp_se_109) = warp_int128_to_int256(__warp_se_108);
                
                let (__warp_se_110) = warp_int128_to_int256(__warp_22_liquidityDelta);
                
                let (__warp_pse_2) = sub_adefc37b(__warp_se_109, __warp_se_110);
                
                let (__warp_pse_3) = toInt128_dd2a0316(__warp_pse_2);
                
                let (__warp_se_111) = WSM7_Info_39bc053d_liquidityNet(__warp_31_info);
                
                WS_WRITE0(__warp_se_111, __warp_pse_3);
                tempvar syscall_ptr = syscall_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar range_check_ptr = range_check_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar __warp_30_flipped = __warp_30_flipped;
            }else{
            
                
                let (__warp_se_112) = WSM7_Info_39bc053d_liquidityNet(__warp_31_info);
                
                let (__warp_se_113) = WS0_READ_felt(__warp_se_112);
                
                let (__warp_se_114) = warp_int128_to_int256(__warp_se_113);
                
                let (__warp_se_115) = warp_int128_to_int256(__warp_22_liquidityDelta);
                
                let (__warp_pse_4) = add_a5f3c23b(__warp_se_114, __warp_se_115);
                
                let (__warp_pse_5) = toInt128_dd2a0316(__warp_pse_4);
                
                let (__warp_se_116) = WSM7_Info_39bc053d_liquidityNet(__warp_31_info);
                
                WS_WRITE0(__warp_se_116, __warp_pse_5);
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


        
        let (__warp_se_117) = WS0_INDEX_felt_to_Info_39bc053d(__warp_34_self, __warp_35_tick);
        
        WS_STRUCT_Info_DELETE(__warp_se_117);
        
        
        
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
            
            let (__warp_se_118) = WSM1_Info_39bc053d_feeGrowthOutside0X128(__warp_44_info);
            
            let (__warp_se_119) = WSM1_Info_39bc053d_feeGrowthOutside0X128(__warp_44_info);
            
            let (__warp_se_120) = WS1_READ_Uint256(__warp_se_119);
            
            let (__warp_se_121) = warp_sub_unsafe256(__warp_38_feeGrowthGlobal0X128, __warp_se_120);
            
            WS_WRITE1(__warp_se_118, __warp_se_121);
            
            let (__warp_se_122) = WSM2_Info_39bc053d_feeGrowthOutside1X128(__warp_44_info);
            
            let (__warp_se_123) = WSM2_Info_39bc053d_feeGrowthOutside1X128(__warp_44_info);
            
            let (__warp_se_124) = WS1_READ_Uint256(__warp_se_123);
            
            let (__warp_se_125) = warp_sub_unsafe256(__warp_39_feeGrowthGlobal1X128, __warp_se_124);
            
            WS_WRITE1(__warp_se_122, __warp_se_125);
            
            let (__warp_se_126) = WSM3_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_44_info);
            
            let (__warp_se_127) = WSM3_Info_39bc053d_secondsPerLiquidityOutsideX128(__warp_44_info);
            
            let (__warp_se_128) = WS0_READ_felt(__warp_se_127);
            
            let (__warp_se_129) = warp_sub_unsafe160(__warp_40_secondsPerLiquidityCumulativeX128, __warp_se_128);
            
            WS_WRITE0(__warp_se_126, __warp_se_129);
            
            let (__warp_se_130) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_44_info);
            
            let (__warp_se_131) = WSM4_Info_39bc053d_tickCumulativeOutside(__warp_44_info);
            
            let (__warp_se_132) = WS0_READ_felt(__warp_se_131);
            
            let (__warp_se_133) = warp_sub_signed_unsafe56(__warp_41_tickCumulative, __warp_se_132);
            
            WS_WRITE0(__warp_se_130, __warp_se_133);
            
            let (__warp_se_134) = WSM5_Info_39bc053d_secondsOutside(__warp_44_info);
            
            let (__warp_se_135) = WSM5_Info_39bc053d_secondsOutside(__warp_44_info);
            
            let (__warp_se_136) = WS0_READ_felt(__warp_se_135);
            
            let (__warp_se_137) = warp_sub_unsafe32(__warp_42_time, __warp_se_136);
            
            WS_WRITE0(__warp_se_134, __warp_se_137);
            
            let (__warp_se_138) = WSM7_Info_39bc053d_liquidityNet(__warp_44_info);
            
            let (__warp_se_139) = WS0_READ_felt(__warp_se_138);
            
            let __warp_43_liquidityNet = __warp_se_139;
        
        
        
        return (__warp_43_liquidityNet,);

    }

    // @notice Add a signed liquidity delta to liquidity and revert if it overflows or underflows
    // @param x The liquidity before change
    // @param y The delta by which liquidity should be changed
    // @return z The liquidity delta
    func addDelta_402d44fb{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_0_x : felt, __warp_1_y : felt)-> (__warp_2_z : felt){
    alloc_locals;


        
        let __warp_2_z = 0;
        
            
            let (__warp_se_140) = warp_lt_signed128(__warp_1_y, 0);
            
                
                if (__warp_se_140 != 0){
                
                    
                    let (__warp_se_141) = warp_negate128(__warp_1_y);
                    
                    let (__warp_pse_6) = warp_sub_unsafe128(__warp_0_x, __warp_se_141);
                    
                    let __warp_2_z = __warp_pse_6;
                    
                    let (__warp_se_142) = warp_lt(__warp_pse_6, __warp_0_x);
                    
                    with_attr error_message("LS"){
                        assert __warp_se_142 = 1;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar __warp_2_z = __warp_2_z;
                }else{
                
                    
                    let (__warp_pse_7) = warp_add_unsafe128(__warp_0_x, __warp_1_y);
                    
                    let __warp_2_z = __warp_pse_7;
                    
                    let (__warp_se_143) = warp_ge(__warp_pse_7, __warp_0_x);
                    
                    with_attr error_message("LA"){
                        assert __warp_se_143 = 1;
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
        
        let (__warp_pse_9) = warp_int256_to_int128(__warp_2_y);
        
        let __warp_3_z = __warp_pse_9;
        
        let (__warp_se_144) = warp_int128_to_int256(__warp_pse_9);
        
        let (__warp_se_145) = warp_eq256(__warp_se_144, __warp_2_y);
        
        assert __warp_se_145 = 1;
        
        
        
        return (__warp_3_z,);

    }

    // @notice Returns x + y, reverts if overflows or underflows
    // @param x The augend
    // @param y The addend
    // @return z The sum of x and y
    func add_a5f3c23b{range_check_ptr : felt}(__warp_9_x : Uint256, __warp_10_y : Uint256)-> (__warp_11_z : Uint256){
    alloc_locals;


        
        let __warp_11_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_13) = warp_add_signed_unsafe256(__warp_9_x, __warp_10_y);
            
            let __warp_11_z = __warp_pse_13;
            
            let (__warp_se_146) = warp_ge_signed256(__warp_pse_13, __warp_9_x);
            
            let (__warp_se_147) = warp_ge_signed256(__warp_10_y, Uint256(low=0, high=0));
            
            let (__warp_se_148) = warp_eq(__warp_se_146, __warp_se_147);
            
            assert __warp_se_148 = 1;
        
        
        
        return (__warp_11_z,);

    }

    // @notice Returns x - y, reverts if overflows or underflows
    // @param x The minuend
    // @param y The subtrahend
    // @return z The difference of x and y
    func sub_adefc37b{range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_12_x : Uint256, __warp_13_y : Uint256)-> (__warp_14_z : Uint256){
    alloc_locals;


        
        let __warp_14_z = Uint256(low=0, high=0);
        
            
            let (__warp_pse_14) = warp_sub_signed_unsafe256(__warp_12_x, __warp_13_y);
            
            let __warp_14_z = __warp_pse_14;
            
            let (__warp_se_149) = warp_le_signed256(__warp_pse_14, __warp_12_x);
            
            let (__warp_se_150) = warp_ge_signed256(__warp_13_y, Uint256(low=0, high=0));
            
            let (__warp_se_151) = warp_eq(__warp_se_149, __warp_se_150);
            
            assert __warp_se_151 = 1;
        
        
        
        return (__warp_14_z,);

    }

}


    @external
    func increaseFeeGrowthGlobal0X128_0b0c061f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_8_amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_8_amount);
        
        let (__warp_se_32) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_6_totalGrowth0);
        
        let (__warp_se_33) = warp_add256(__warp_se_32, __warp_8_amount);
        
        let (__warp_se_34) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_6_totalGrowth0);
        
        let (__warp_se_35) = warp_gt256(__warp_se_33, __warp_se_34);
        
        assert __warp_se_35 = 1;
        
        let (__warp_se_36) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_4_feeGrowthGlobal0X128);
        
        let (__warp_se_37) = warp_add256(__warp_se_36, __warp_8_amount);
        
        WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_4_feeGrowthGlobal0X128, __warp_se_37);
        
        let (__warp_se_38) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_6_totalGrowth0);
        
        let (__warp_se_39) = warp_add256(__warp_se_38, __warp_8_amount);
        
        WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_6_totalGrowth0, __warp_se_39);
        
        
        
        return ();

    }


    @external
    func increaseFeeGrowthGlobal1X128_3f03e194{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_9_amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_9_amount);
        
        let (__warp_se_40) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_7_totalGrowth1);
        
        let (__warp_se_41) = warp_add256(__warp_se_40, __warp_9_amount);
        
        let (__warp_se_42) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_7_totalGrowth1);
        
        let (__warp_se_43) = warp_gt256(__warp_se_41, __warp_se_42);
        
        assert __warp_se_43 = 1;
        
        let (__warp_se_44) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_5_feeGrowthGlobal1X128);
        
        let (__warp_se_45) = warp_add256(__warp_se_44, __warp_9_amount);
        
        WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_5_feeGrowthGlobal1X128, __warp_se_45);
        
        let (__warp_se_46) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_7_totalGrowth1);
        
        let (__warp_se_47) = warp_add256(__warp_se_46, __warp_9_amount);
        
        WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_7_totalGrowth1, __warp_se_47);
        
        
        
        return ();

    }


    @external
    func setPosition_541bdfb1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_10_tickLower : felt, __warp_11_tickUpper : felt, __warp_12_liquidityDelta : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int128(__warp_12_liquidityDelta);
        
        warp_external_input_check_int24(__warp_11_tickUpper);
        
        warp_external_input_check_int24(__warp_10_tickLower);
        
        let (__warp_se_48) = warp_gt_signed24(__warp_10_tickLower, 16777200);
        
        assert __warp_se_48 = 1;
        
        let (__warp_se_49) = warp_lt_signed24(__warp_11_tickUpper, 16);
        
        assert __warp_se_49 = 1;
        
        let (__warp_se_50) = warp_lt_signed24(__warp_10_tickLower, __warp_11_tickUpper);
        
        assert __warp_se_50 = 1;
        
        let (__warp_se_51) = WS0_READ_felt(TickOverflowSafetyEchidnaTest.__warp_2_tick);
        
        let (__warp_se_52) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_4_feeGrowthGlobal0X128);
        
        let (__warp_se_53) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_5_feeGrowthGlobal1X128);
        
        let (__warp_se_54) = warp_block_timestamp();
        
        let (__warp_se_55) = warp_int256_to_int32(__warp_se_54);
        
        let (__warp_se_56) = WS0_READ_felt(TickOverflowSafetyEchidnaTest.__warp_0_MAX_LIQUIDITY);
        
        let (__warp_13_flippedLower) = TickOverflowSafetyEchidnaTest.update_3bf3(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_10_tickLower, __warp_se_51, __warp_12_liquidityDelta, __warp_se_52, __warp_se_53, 0, 0, __warp_se_55, 0, __warp_se_56);
        
        let (__warp_se_57) = WS0_READ_felt(TickOverflowSafetyEchidnaTest.__warp_2_tick);
        
        let (__warp_se_58) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_4_feeGrowthGlobal0X128);
        
        let (__warp_se_59) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_5_feeGrowthGlobal1X128);
        
        let (__warp_se_60) = warp_block_timestamp();
        
        let (__warp_se_61) = warp_int256_to_int32(__warp_se_60);
        
        let (__warp_se_62) = WS0_READ_felt(TickOverflowSafetyEchidnaTest.__warp_0_MAX_LIQUIDITY);
        
        let (__warp_14_flippedUpper) = TickOverflowSafetyEchidnaTest.update_3bf3(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_11_tickUpper, __warp_se_57, __warp_12_liquidityDelta, __warp_se_58, __warp_se_59, 0, 0, __warp_se_61, 1, __warp_se_62);
        
            
            if (__warp_13_flippedLower != 0){
            
                
                let (__warp_se_63) = warp_lt_signed128(__warp_12_liquidityDelta, 0);
                
                    
                    if (__warp_se_63 != 0){
                    
                        
                        let (__warp_se_64) = WS0_INDEX_felt_to_Info_39bc053d(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_10_tickLower);
                        
                        let (__warp_se_65) = WSM0_Info_39bc053d_liquidityGross(__warp_se_64);
                        
                        let (__warp_se_66) = WS0_READ_felt(__warp_se_65);
                        
                        let (__warp_se_67) = warp_eq(__warp_se_66, 0);
                        
                        assert __warp_se_67 = 1;
                        
                        TickOverflowSafetyEchidnaTest.clear_db51(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_10_tickLower);
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                        tempvar __warp_14_flippedUpper = __warp_14_flippedUpper;
                        tempvar __warp_11_tickUpper = __warp_11_tickUpper;
                    }else{
                    
                        
                        let (__warp_se_68) = WS0_INDEX_felt_to_Info_39bc053d(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_10_tickLower);
                        
                        let (__warp_se_69) = WSM0_Info_39bc053d_liquidityGross(__warp_se_68);
                        
                        let (__warp_se_70) = WS0_READ_felt(__warp_se_69);
                        
                        let (__warp_se_71) = warp_gt(__warp_se_70, 0);
                        
                        assert __warp_se_71 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                        tempvar __warp_14_flippedUpper = __warp_14_flippedUpper;
                        tempvar __warp_11_tickUpper = __warp_11_tickUpper;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                    tempvar __warp_14_flippedUpper = __warp_14_flippedUpper;
                    tempvar __warp_11_tickUpper = __warp_11_tickUpper;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                tempvar __warp_14_flippedUpper = __warp_14_flippedUpper;
                tempvar __warp_11_tickUpper = __warp_11_tickUpper;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                tempvar __warp_14_flippedUpper = __warp_14_flippedUpper;
                tempvar __warp_11_tickUpper = __warp_11_tickUpper;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
            tempvar __warp_14_flippedUpper = __warp_14_flippedUpper;
            tempvar __warp_11_tickUpper = __warp_11_tickUpper;
        
            
            if (__warp_14_flippedUpper != 0){
            
                
                let (__warp_se_72) = warp_lt_signed128(__warp_12_liquidityDelta, 0);
                
                    
                    if (__warp_se_72 != 0){
                    
                        
                        let (__warp_se_73) = WS0_INDEX_felt_to_Info_39bc053d(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_11_tickUpper);
                        
                        let (__warp_se_74) = WSM0_Info_39bc053d_liquidityGross(__warp_se_73);
                        
                        let (__warp_se_75) = WS0_READ_felt(__warp_se_74);
                        
                        let (__warp_se_76) = warp_eq(__warp_se_75, 0);
                        
                        assert __warp_se_76 = 1;
                        
                        TickOverflowSafetyEchidnaTest.clear_db51(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_11_tickUpper);
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                    }else{
                    
                        
                        let (__warp_se_77) = WS0_INDEX_felt_to_Info_39bc053d(TickOverflowSafetyEchidnaTest.__warp_1_ticks, __warp_11_tickUpper);
                        
                        let (__warp_se_78) = WSM0_Info_39bc053d_liquidityGross(__warp_se_77);
                        
                        let (__warp_se_79) = WS0_READ_felt(__warp_se_78);
                        
                        let (__warp_se_80) = warp_gt(__warp_se_79, 0);
                        
                        assert __warp_se_80 = 1;
                        tempvar range_check_ptr = range_check_ptr;
                        tempvar syscall_ptr = syscall_ptr;
                        tempvar bitwise_ptr = bitwise_ptr;
                        tempvar pedersen_ptr = pedersen_ptr;
                        tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                    }
                    tempvar range_check_ptr = range_check_ptr;
                    tempvar syscall_ptr = syscall_ptr;
                    tempvar bitwise_ptr = bitwise_ptr;
                    tempvar pedersen_ptr = pedersen_ptr;
                    tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
                tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
            tempvar __warp_12_liquidityDelta = __warp_12_liquidityDelta;
        
        let (__warp_se_81) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_3_totalLiquidity);
        
        let (__warp_se_82) = warp_int128_to_int256(__warp_12_liquidityDelta);
        
        let (__warp_se_83) = warp_add_signed256(__warp_se_81, __warp_se_82);
        
        WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_3_totalLiquidity, __warp_se_83);
        
        let (__warp_se_84) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_3_totalLiquidity);
        
        let (__warp_se_85) = warp_ge_signed256(__warp_se_84, Uint256(low=0, high=0));
        
        assert __warp_se_85 = 1;
        
        let (__warp_se_86) = WS1_READ_Uint256(TickOverflowSafetyEchidnaTest.__warp_3_totalLiquidity);
        
        let (__warp_se_87) = warp_eq256(__warp_se_86, Uint256(low=0, high=0));
        
            
            if (__warp_se_87 != 0){
            
                
                WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_6_totalGrowth0, Uint256(low=0, high=0));
                
                WS_WRITE1(TickOverflowSafetyEchidnaTest.__warp_7_totalGrowth1, Uint256(low=0, high=0));
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
            }else{
            
                tempvar range_check_ptr = range_check_ptr;
                tempvar syscall_ptr = syscall_ptr;
                tempvar bitwise_ptr = bitwise_ptr;
                tempvar pedersen_ptr = pedersen_ptr;
            }
            tempvar range_check_ptr = range_check_ptr;
            tempvar syscall_ptr = syscall_ptr;
            tempvar bitwise_ptr = bitwise_ptr;
            tempvar pedersen_ptr = pedersen_ptr;
        
        
        
        return ();

    }


    @external
    func moveToTick_af759368{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_15_target : felt)-> (){
    alloc_locals;


        
        warp_external_input_check_int24(__warp_15_target);
        
        let (__warp_se_88) = warp_gt_signed24(__warp_15_target, 16777200);
        
        assert __warp_se_88 = 1;
        
        let (__warp_se_89) = warp_lt_signed24(__warp_15_target, 16);
        
        assert __warp_se_89 = 1;
        
        let (__warp_pse_1) = TickOverflowSafetyEchidnaTest.__warp_while17(__warp_15_target);
        
        let __warp_15_target = __warp_pse_1;
        
        
        
        return ();

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(13);
    WARP_NAMEGEN.write(1);


        
        TickOverflowSafetyEchidnaTest.__warp_init_TickOverflowSafetyEchidnaTest();
        
        
        
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