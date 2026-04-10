// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BalanceOf {
    // emit these
    function main(address token) external view returns (uint256) {
        assembly {
            let m := mload(0x40)
            mstore(m,shl(224,0x70a08231))
            mstore(add(m,0x4),address())
            let s := staticcall(gas(),token,m,0x24,m,0x20)
            let d := returndatasize()
            returndatacopy(m,0,d)
            return (m,d)
            // your code here
            // return the balance of this contract using ERC20 "token"
            // assume "token" is an ERC20 contract
            // hint: balanceOf has function selector 0x70a08231 and signature "balanceOf(address)"
            // hint: since this is a view function, you should use staticcall
            // hint: use `returndatacopy` to copy the return data to the memory
       }
    }
}