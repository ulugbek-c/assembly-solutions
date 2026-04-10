// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimpleCalldata {
    function main(bytes calldata deploymentBytecode) external returns (address) {
        assembly {
            // let p := mload(0x40)
            // let g := calldataload(deploymentBytecode.offset)
            calldatacopy(0,0x44,deploymentBytecode.length)
            // mstore(0x00, g)
            let c :=  create(0,0x00,deploymentBytecode.length)
            mstore(0,c)
            return (0, 0x20)
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: use calldatacopy to copy the deploymentBytecode to memory
       }
    }
}