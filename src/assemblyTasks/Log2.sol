// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Log2 {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            if eq(x, 0) { revert(0, 0) }
            let r
            r := shl(7, gt(x, 0xffffffffffffffffffffffffffffffff))
            r := or(r, shl(6, gt(shr(r, x), 0xffffffffffffffff)))
            r := or(r, shl(5, gt(shr(r, x), 0xffffffff)))
            r := or(r, shl(4, gt(shr(r, x), 0xffff)))
            r := or(r, shl(3, gt(shr(r, x), 0xff)))
            r := or(r, shl(2, gt(shr(r, x), 0xf)))
            r := or(r, byte(shr(r, x), 0x0000010102020202030303030303030300000000000000000000000000000000))
            mstore(0x00, r)
            return(0x00, 0x20)
            // your code here
            // return log2 of x rounded down
            // revert if x is 0
            // hint: log2 is the index of the highest bit that is set in x
            // for example:
            //   bin(1) = 0001, so log2(2) = 0
            //   bin(2) = 0010, so log2(2) = 1
            //   bin(3) = 0011, so log2(3) = 1
            //   bin(4) = 0100, so log2(4) = 2
            //   bin(5) = 0101, so log2(5) = 2
            //   bin(6) = 0110, so log2(6) = 2
            //   bin(7) = 0111, so log2(6) = 2
            //   bin(8) = 1000, so log2(6) = 3
        }
    }
}
