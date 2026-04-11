// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BatchEvents {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, uint256 num);

    function main(address[] memory emitters, bytes32[] memory ids, uint256[] memory nums) external {
        assembly {
            let r := mload(0x40)
            // let r1 := mload(sub(r,mul(3,0x20)))
            let m := mload(emitters)
            // mstore(r, r1)
            // log3(r,0x20,0x044d482819499c9d5fde1245ce63873b1259fc52fc78651ccdcdf7392637d374,
            // keccak256(0xa0, mul(m,0x20)),
            // keccak256(add(add(0xa0, mul(m,0x20)),0x20),mul(m1,0x20)))

            for { let y := 0 } lt(y, m) { y := add(y, 1) } {
                let f := mload(add(0xa0, mul(y, 0x20)))
                let q := mload(add(0x120, mul(y, 0x20)))
                let a := add(mload(0x40), 0x40)
                let r1 := mload(add(add(0x180, 0x20), mul(y, 0x20)))
                mstore(r, r1)

                log3(r, 0x20, 0x044d482819499c9d5fde1245ce63873b1259fc52fc78651ccdcdf7392637d374, f, q)
            }

            // log4(r, 0x00,0x044d482819499c9d5fde1245ce63873b1259fc52fc78651ccdcdf7392637d374,
            // keccak256(0xa0, mul(m,0x20)),
            // keccak256(add(add(0xa0, mul(m,0x20)),0x20),mul(m1,0x20)),
            // keccak256(add(add(add(add(0xa0, mul(m,0x20)),0x20),mul(m1,0x20)),0x20),mul(m2,0x20)))
            // let v := mload(emitters)
            // let m := mload(ids)
            // let n := mload(nums)
            // mstore(0, emitters)
            // mstore(0x20, 0x60)
            // mstore(0x40, add(add(mul(v, 0x20),0x60),0x20))
            // mstore(0x60, add(add(add(add(mul(v, 0x20),0x60),0x20),mul(m,0x20)),0x20))
            // log1(0x20, add(add(add(add(add(add(mul(v, 0x20),0x60),0x20),mul(m,0x20)),0x20),mul(n,0x20)),0x20), 0x569b09517b72481d3983f2396b83389bb1b5f468e652bb36e8ae5a33b5df234c)
            // your code here
            // emit the `MyEvent(address,bytes32,uint256)` event
            // Assuming all arrays (emitters, ids, and nums) are of equal length.
            // iterate over the set of parameters and emit events based on the array length.
        }
    }
}
