// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PopFromDynamicArray {
    uint256[] popFromMe = [23, 4, 19, 3, 44, 88];

    function main() external {
        assembly {
            let bt := 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e568
            let sw := popFromMe.slot
            let sb := sub(sw, 1)
            mstore(0x00, sb)
            let h := sload(sw)
            let w := keccak256(0x00, 0x20)
            sstore(bt, 0)
            sstore(sw, sub(h, 1))
            // your code here
            // pop the last element from the dynamic array `popFromMe`
            // dont forget to clean the popped element's slot.
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return popFromMe;
    }

    function lastElementSlotValue(bytes32 s) external view returns (uint256 r) {
        assembly {
            r := sload(s)
        }
    }
}
