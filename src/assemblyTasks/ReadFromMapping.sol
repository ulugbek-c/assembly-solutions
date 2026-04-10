// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromMapping {
    mapping(uint256 index => uint256) readMe;

    function setValue(uint256 index, uint256 value) external {
        readMe[index] = value;
    }

    function main(uint256 index) external view returns (uint256) {
        assembly {
            let num := readMe.slot
            // let a := add(num, index)
            mstore(0x00,index)
            mstore(0x20, num)
            let k := keccak256(0x00,0x40)
            // let v := sload(k)
            mstore(0x00, k)
            let b := mload(0x00)
            let c := sload(b)
            mstore(0x00,c)
            return(0x00, 0x20)
            // your code here
            // read the value at the `index` in the mapping `readMe`
            // and return it
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}