// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {
    function main(address[] calldata recipients) external payable {
        assembly {
            let m := calldataload(0x24)
            let d := div(selfbalance(), m)
            let g := gas()
            let f
            for { let i := 0 } lt(i, m) { i := add(i, 1) } {
                let value := calldataload(add(0x44, mul(0x20, i)))
                f := call(g, value, d, m, 0, m, 0)
            }
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length
        }
    }
}
