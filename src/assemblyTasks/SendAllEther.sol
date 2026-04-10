// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SendAllEther {

    function main(address payable to) external payable {
        assembly {
            let m := mload(0x40)
            let f := call(gas(), to, selfbalance(), m, 0, m, 0)
            // your code here
            // send the entire contract balance to `to`
            // hint: use the `call` opcode: https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
            // hint: use the `selfbalance()` opcode

        }
    }
}