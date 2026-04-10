// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AbsoluteValue{

  function main(int256 x) external pure returns (uint256) {
      assembly {
        let d 
        if slt(x,0){
        mstore(0x00,x)
        d := add(not(mload(0x00)),1)
        }
        if and(iszero(slt(x,0)), gt(x,0)){
            d := x
        }
        mstore(0x00,d)
        return (0x00,0x20)
          // your code here
          // return the absolute value of x
          // hint: use signed comparisons
          // hint: https://www.rareskills.io/post/signed-int-solidity

      }
  }
}