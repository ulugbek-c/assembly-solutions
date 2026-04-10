// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SimpleRevert {
    // error RevertRevert();

  function main() external pure {
      assembly {
          // your code here
          // revert with no message
          // hint: https://www.rareskills.io/post/assembly-revert

          let ptr := mload(0x40)
          mstore(ptr, 12)
          mstore(add(ptr,32),0x5265766572745265766572740000000000000000000000000000000000000000)


            // mstore(0x00, 0xaf09338e)
          revert(add(ptr,32),12)
          
      }
  }
}