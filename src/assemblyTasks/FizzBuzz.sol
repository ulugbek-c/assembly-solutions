// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract FizzBuzz {
    function main(uint256 num) external pure returns (string memory) {
        assembly {
            let q := mod(num,3)
            let w := mod(num,5)
            let r
            if eq(q,0){
                r := "fizz"
                mstore(0x00,0x20)
                mstore(0x20,0x04)
                mstore(0x40,r)
            } 

            if and(iszero(eq(q,0)),eq(w,0)){
                r := "buzz"
                mstore(0x00,0x20)
                mstore(0x20,0x04)
                mstore(0x40,r)
            } 
            if and(eq(q,0),eq(w,0)){
                r := "fizzbuzz"
                mstore(0x00,0x20)
                mstore(0x20,0x08)
                mstore(0x40,r)
            }
            
            if and(iszero(eq(q,0)),iszero(eq(w,0))){
                r := ""
                mstore(0x00,0x20)
                mstore(0x20,0x0)
                mstore(0x40,r)
            }
            
            return (0x00,0x80)
            // your code here
            // if `num` is divisible by 3 return the word "fizz",
            // if divisible by 5 with the word "buzz",
            // if divisible by both 3 and 5 return the word "fizzbuzz",
            // else return an empty string "".

            // Assume `num` is greater than 0.
        }
    }
}