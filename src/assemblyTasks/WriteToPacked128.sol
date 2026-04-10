// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked128 {
    uint128 public writeHere = 1;
    uint128 public someValue = 7;

    function main(uint256 v) external {
        assembly {
            let s := sload(0)
            let mask := not(sub(shl(128, 1), 1))
            s := and(s, mask)
            s := or(s, v)
            sstore(0, s)
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            // Hint: storage slots are arranged sequentially. Determine the storage slot of `writeHere`
            // and use `sstore` to modify only the `writeHere` variable.
        }
    }
}