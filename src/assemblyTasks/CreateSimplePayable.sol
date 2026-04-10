// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimplePayable {
    function main(uint256 dummy, bytes memory deploymentBytecode) external payable  returns (address addr) {
        assembly {
            let p := mload(0x40)
            let m := mload(0x80)
            addr := create(callvalue(),0xa0,m)
        }
    }
}
