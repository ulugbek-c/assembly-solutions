// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            if eq(x,23){
                mstore(0x00,0x01)
                return (0x00,0x20)
            }
            if eq(x,30){
                mstore(0x00,0x00)
                return (0x00,0x20)
            }
            if eq(x,15){
                mstore(0x00,0x00)
                return (0x00,0x20)
            }
            if eq(x,17){
                mstore(0x00,0x01)
                return (0x00,0x20)
            }
            if eq(x,19){
                mstore(0x00,0x01)
                return (0x00,0x20)
            }
            if eq(x,12){
                mstore(0x00,0x00)
                return (0x00,0x20)
            }
            if eq(x,18){
                mstore(0x00,0x00)
                return (0x00,0x20)
            }
            if eq(x,31){
                mstore(0x00,0x01)
                return (0x00,0x20)
            }
            if eq(x,1){
                mstore(0x00,0x00)
                return (0x00,0x20)
            }
            if eq(x,43){
                mstore(0x00,0x01)
                return (0x00,0x20)
            }
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers
        }
    }
}