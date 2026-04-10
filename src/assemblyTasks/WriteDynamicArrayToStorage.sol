// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13; 
contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
        let len := calldataload(0x24)
        sstore(writeHere.slot, len)

        // ---------------------------
        // 2. storage start = keccak256(myArray.slot)
        // ---------------------------
        mstore(0x00, writeHere.slot)
        let start := keccak256(0x00, 0x20)

        // ---------------------------
        // 3. Pointer to first element in calldata
        // ---------------------------
        // first element is at (4 + offset + 32)
        let arrOffset := calldataload(0x04)
        let dataPtr := add(4, add(arrOffset, 32))

        // ---------------------------
        // 4. Loop: read from calldata, write to storage
        // ---------------------------
        for { let i := 0 } lt(i, len) { i := add(i, 1) } {
            let value := calldataload(add(dataPtr, mul(i, 32)))
            sstore(add(start, i), value)

            // --------------------------------------------------------
            // 2. Compute storage start = keccak256(myArray.slot)
            // --------------------------------------------------------

            // --------------------------------------------------------
            // 3. Compute pointer to array data in memory
            // --------------------------------------------------------
            // Memory layout of dynamic arrays:
            //  [0x00] length
            //  [0x20] element 0
            //  [0x40] element 1
            //  ...

            // --------------------------------------------------------
            // 4. Loop and write each element to storage
            // --------------------------------------------------------
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`
        }
    }
}
}