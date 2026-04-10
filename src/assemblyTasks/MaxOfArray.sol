// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13; // CHATGPT was here

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            
            if lt(arr,0){
                revert(0x00,0x00)
            }
            // Load the first element as initial max (stack)
            let max := mload(add(arr, 32)) // Skip array length

            // Loop through the array (start from index 1)
            let arrPtr := add(arr, 64) // Skip length + first element
            let endPtr := add(arrPtr, mul(sub(mload(arr), 1), 32)) // arr.length * 32

            for { let i := arrPtr } lt(i, endPtr) { i := add(i, 32) } {
                let current := mload(i)
                if gt(current, max) {
                    max := current
                }
            }

            // Return max (stack)
            mstore(0, max)
            return(0, 32)
        }
            // your code here
            // return the maximum value in the array
            // revert if array is empty
        
    }
}