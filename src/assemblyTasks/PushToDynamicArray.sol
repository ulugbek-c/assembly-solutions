// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PushToDynamicArray {
    uint256[] pushToMe = [23, 4, 19, 3, 44, 88];

    function main(uint256 newValue) external {
        assembly {
            let sw := pushToMe.slot
            mstore(0x00, sw)
            let h := sload(sw)
            let w := keccak256(0x00, 0x20)
            let jw := add(w,h)
            sstore(jw, newValue)
            sstore(sw, add(h, 1))
            // your code here
            // push the newValue to the dynamic array `pushToMe`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return pushToMe;
    }
}