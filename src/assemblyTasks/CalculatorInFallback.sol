// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CalculatorInFallback {
    uint256 public result;

    fallback() external {
        assembly {
            let selector := shr(224, calldataload(0))
            if eq(selector, 0x771602f7) {
                let a := calldataload(4)
                let b := calldataload(0x24)
                let c := add(a, b)
                sstore(result.slot, c)
            }
            if eq(selector, 0xb67d77c5) {
                let a := calldataload(4)
                let b := calldataload(0x24)
                let c := sub(a, b)
                sstore(result.slot, c)
            }

            if eq(selector, 0xc8a4ac9c) {
                let a := calldataload(4)
                let b := calldataload(0x24)
                let c := mul(a, b)
                sstore(result.slot, c)
            }
            if eq(selector, 0xa391c15b) {
                let d := calldataload(4)
                let e := calldataload(0x24)
                let w := div(d, e)
                sstore(result.slot, w)
            }
        }
        // your code here
        // compare the function selector in the calldata with the any of the selectors below, then
        // execute a logic based on the right function selector and store the result in `result` variable.
        // assumming operations won't overflow

        // add(uint256,uint256) -> 0x771602f7 (add two numbers and store result in storage)
        // sub(uint256,uint256) -> 0xb67d77c5 (sub two numbers and store result in storage)
        // mul(uint256,uint256) -> 0xc8a4ac9c (mul two numbers and store result in storage)
        // div(uint256,uint256) -> 0xa391c15b (div two numbers and store result in storage)
    }
}
