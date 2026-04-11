// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract DeployOneByte {
    // deploy a contract whose runtime code is a single 0x00 byte
    function main() public returns (address) {
        assembly {
            let ptr := mload(0x40) // free memory pointer

            // Initcode (13 bytes):
            // 60 01    PUSH1 0x01
            // 60 00    PUSH1 0x00
            // 60 0c    PUSH1 0x0c   <- source offset of runtime byte
            // 39       CODECOPY
            // 60 01    PUSH1 0x01
            // 60 00    PUSH1 0x00
            // f3       RETURN
            // 00       runtime byte (one STOP/0x00)
            mstore8(add(ptr, 0), 0x60)
            mstore8(add(ptr, 1), 0x01)
            mstore8(add(ptr, 2), 0x60)
            mstore8(add(ptr, 3), 0x00)
            mstore8(add(ptr, 4), 0x60)
            mstore8(add(ptr, 5), 0x0c)
            mstore8(add(ptr, 6), 0x39)
            mstore8(add(ptr, 7), 0x60)
            mstore8(add(ptr, 8), 0x01)
            mstore8(add(ptr, 9), 0x60)
            mstore8(add(ptr, 10), 0x00)
            mstore8(add(ptr, 11), 0xf3)
            mstore8(add(ptr, 12), 0x00) // runtime byte

            // advance free memory pointer (keep 32-byte aligned)
            mstore(0x40, add(ptr, 0x20))

            // create with initcode at ptr, length 13
            let deployed := create(0, ptr, 13)
            mstore(0x00, deployed)
            return(0x00, 0x20)
            // if iszero(deployed) { revert(0, 0) }
        }
    }
}
