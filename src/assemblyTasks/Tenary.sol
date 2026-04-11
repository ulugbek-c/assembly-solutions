// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {
            if gt(a, b) { sstore(result.slot, 10) }
            if and(iszero(gt(a, b)), gt(b, c)) { sstore(result.slot, 20) }
            // sstore(result.slot,30)

            if and(iszero(gt(a, b)), iszero(gt(b, c))) { sstore(result.slot, 30) }

            // switch gt(a,b)
            // case 0 {sstore(result.slot, 10)}
            // switch gt(b,c)
            // case 1 {sstore(result.slot, 20)}
            // case 2 {sstore(result.slot,30)}
            // your code here
            // store `10` in the storage variable `result` if a > b,
            // else if b > c, store `20`,
            // else, store `30`
        }
    }
}
