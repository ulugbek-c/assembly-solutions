// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract SquareRoot {
    function main(uint256 y) external pure returns (uint256) {
        assembly {
            let z
            if gt(y,3){
                z := y
                let x := add(div(y,2),1)
                for {} lt(x,z){}{
                    z := x
                    x := div(add(div(y,x),x),2)
                    
                }
                
            }
            if and(iszero(gt(y,3)),iszero(eq(y,0))){
                z := 1
            }
            mstore(0x00,z)
            return (0x00,0x20)
        }
    }
}