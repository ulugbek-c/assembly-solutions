// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfTwoValues {
    function main(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            if lt(x, y) {
                mstore(0x0, y)
                return(0x0, 0x20)
            }

            if lt(y, x) {
                mstore(0x0, x)
                return(0x0, 0x20)
            }
            // your code here
            // return the maximum value between x and y
            // assume the two values are not the same
            // Hint: use If-statement to check

            // here is how you do a conditional statement in yul
            // https://docs.soliditylang.org/en/latest/yul.html#if
        }
    }
}
