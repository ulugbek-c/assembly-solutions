// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfString {
    function main() external pure returns (string memory, string memory) {
        assembly {
            let s := "Hello"
            let z := "RareSkills"
            mstore(0x00,0x40)
            mstore(0x20,0x80)
            mstore(0x40,0x05)
            mstore(0x60,s)
            mstore(0x80, 0xa)
            mstore(0xa0, z)
            return(0x00,0xc0)
            // your code here
            // return the tuple of string: ("Hello", "RareSkills")
        }
    }
}