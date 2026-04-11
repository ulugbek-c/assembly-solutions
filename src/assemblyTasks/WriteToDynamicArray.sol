// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            let len := mload(x) // x.length
            sstore(writeHere.slot, len) // store length

            // --------------------------------------------------------
            // 2. Compute storage start = keccak256(myArray.slot)
            // --------------------------------------------------------
            mstore(0x00, writeHere.slot)
            let start := keccak256(0x00, 0x20)

            // --------------------------------------------------------
            // 3. Compute pointer to array data in memory
            // --------------------------------------------------------
            // Memory layout of dynamic arrays:
            //  [0x00] length
            //  [0x20] element 0
            //  [0x40] element 1
            //  ...
            let dataPtr := add(x, 0x20)

            // --------------------------------------------------------
            // 4. Loop and write each element to storage
            // --------------------------------------------------------
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                let value := mload(add(dataPtr, mul(i, 0x20))) // 2 * 32
                sstore(add(start, i), value)
            }
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
