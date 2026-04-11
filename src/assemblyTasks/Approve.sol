// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Approve {
    // emit these
    function main(address token, uint256 amount) external {
        assembly {
            let m := mload(0x40)
            mstore(m, shl(224, 0x095ea7b3))
            mstore(0xa4, amount)
            mstore(add(m, 4), token)
            // mstore(0xc0,shl(224,amount))
            // mstore(0x0,amount)
            let c := call(gas(), token, 0, m, 0x44, m, 0x20)
            // log3(0x0, 0x20, 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925, address(), token)
            if iszero(c) { revert(0, 0) }
            // your code here
            // approve "token" to spend "amount"
            // hint: approve has function selector 0x095ea7b3 and signature "approve(address,uint256)"
        }
    }
}
