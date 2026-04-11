// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            let c := x.length
            let c1 := y.length
            sstore(writeHere1.slot, c)
            sstore(writeHere2.slot, c1)

            // ---------------------------
            // 2. storage start = keccak256(myArray.slot)
            // ---------------------------
            mstore(0x00, writeHere1.slot)
            let start := keccak256(0x00, 0x20)
            mstore(0x00, writeHere2.slot)
            let start1 := keccak256(0x00, 0x20)

            // ---------------------------
            // 3. Pointer to first element in calldata
            // ---------------------------
            // first element is at (4 + offset + 32)
            let arrOffset := calldataload(0x04)
            let dataPtr := add(4, add(arrOffset, 32)) //64+32+4=100
            let arrOffset2 := calldataload(0x24)
            let dataPtr2 := add(4, add(arrOffset2, 32)) //  288 + 32 + 4 = 324

            // ---------------------------
            // 4. Loop: read from calldata, write to storage
            // ---------------------------
            for { let i := 0 } lt(i, c) { i := add(i, 1) } {
                let value := calldataload(add(dataPtr, mul(i, 32))) //100 + 2 * 32 = 164
                sstore(add(start, i), value)
                // your code here
                // write the dynamic calldata array `x` to storage variable `writeHere1` and
                // dynamic calldata array `y` to storage variable `writeHere2`
            }
            for { let o := 0 } lt(o, c1) { o := add(o, 1) } {
                let value1 := calldataload(add(dataPtr2, mul(o, 32))) // 324 + 2 * 32 = 388    324 + 4 * 32 = 452    324 + 5 * 32 = 484
                sstore(add(start1, o), value1)
                // your code here
                // write the dynamic calldata array `x` to storage variable `writeHere1` and
                // dynamic calldata array `y` to storage variable `writeHere2`
            }
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`
        }
    }
}
