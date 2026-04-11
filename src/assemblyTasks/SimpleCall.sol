// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SimpleCall {
    function main(address t) external {
        assembly {
            let m := mload(0x40)
            mstore(m, shl(224, 0xc2985578))
            let f := call(gas(), t, callvalue(), m, 0x04, m, 0)
            if iszero(f) { revert(0, 0) }
            // your code here
            // call "t.foo()"
            // hint: "foo()" has function selector 0xc2985578
        }
    }
}
