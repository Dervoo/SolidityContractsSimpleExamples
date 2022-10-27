// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Bits {
    // https://www.binaryconvert.com/result_unsigned_int.html?hexadecimal=00000023 -> Binary Converter
    function and(uint x, uint y) external pure returns(uint) {
        return x & y;
        // x = 30 y = 35
        // x -> 16 + 8 + 4 + 2 + 0 = 30 -> 11110 -> 011110
        // y -> 32 + 0 + 0 + 0 + 2 + 1 = 35 ->      100011
        //  10 -> 0 + 2 = 2
        // by default we have 00000000000000000000101010101 for EXAMPLE
    }
    
    function or(uint x, uint y) external pure returns(uint) {
        return x | y;
        // x = 12 = 1100
        // y = 9  = 1001
        // x | y =  1101 (we copy places with at least one number 1, while there are two zeros we copy zero -> 8 + 4 + 0 + 1 -> 13
    }

    function xor(uint x, uint y) external pure returns(uint) {
        return x ^ y;
        // xclusive or
        // simillar situation to or but this time if only one of two binaries has 1 then we copy 1 but if both binaries have 1 we copy 0
        // 1100
        // 0101
        //=1001
    }

    function not(uint8 x) external pure returns(uint) {
        return ~x;
        // converts into totally opposite
        // 11110011 into 00001100
    }

    function shiftLeft(uint x, uint bits) external pure returns(uint) {
        return x << bits;
        // 1 << 0 = 0001 -> 0001 = 1
        // 1 << 1 = 0001 -> 0010 = 2
        // 1 << 2 = 0001 -> 0100 = 4
        // 3 = 0011
        // 3 << 2 = 0011 -> 1100 = 12
    }

    function shiftRight(uint x, uint bits) external pure returns(uint) {
        // 8 >> 0 = 1000 -> 1000 = 8
        // 8 >> 1 = 1000 -> 0100 = 4
        // 8 >> 2 = 1000 -> 0010 = 2
        // 8 >> 3 = 1000 -> 0001 = 1
        // 8 >> 4 = 1000 -> 0000 = 0
        return x >> bits;
    }
}