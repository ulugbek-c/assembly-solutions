// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract LengthOfDynamicArray {
    function main(uint256[] memory x) external view returns (uint256) {
        assembly {
            let n := mload(x)
            mstore(0x0, n)
            return(0x0, 32)
            // your code here
            // return the length of array `x`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
