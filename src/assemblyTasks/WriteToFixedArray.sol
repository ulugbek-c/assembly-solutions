// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToFixedArray {
    uint256[5] writeHere;

    function main(uint256[5] memory x) external {
        assembly {
            let s := calldataload(4)
            let s1 := calldataload(add(4,32))
            let s2 := calldataload(add(4,64))
            let s3 := calldataload(add(4,96))
            let s4 := calldataload(add(4,128))
            
            sstore(0, s)
            sstore(1, s1)
            sstore(2, s2)
            sstore(3, s3)
            sstore(4, s4)
            // your code here
            // store the values in the fixed array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[5] memory) {
        return writeHere;
    }
}