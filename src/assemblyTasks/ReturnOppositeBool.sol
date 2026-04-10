// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnOppositeBool {
    function main(bool _bool) external pure returns (bool) {
        assembly {
            switch _bool
            case 0 {
                mstore(0x00, 1)
                return(0x00, 32)
            }
            case 1 {
                mstore(0x00, 0)
                return(0x00, 32)
            }
            // your code here
            // return the opposite of `_bool`
        }
    }
}