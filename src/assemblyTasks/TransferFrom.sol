// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract TransferFrom {
    address owner;
    address token;

    constructor(address _token) {
        owner = msg.sender;
        token = _token;
    }

    function main(uint256 amount) external {
        assembly {
            let m := mload(0x40)
            let s := sload(owner.slot)
            let s1 := sload(token.slot)
            mstore(m,shl(224,0x23b872dd))
            mstore(0x84,s)
            mstore(0xa4,address())
            mstore(0xc4,amount)
            let c := call(gas(),s1,0, m, 0x64,m,0x20)
            // your code here
            // transferFrom "token" to msg.sender "amount"
            // assume that you are already approved to spend "amount"
            // hint: you will need to sload the address of the token
            // hint: transferFrom has function selector 0x23b872dd and signature "transferFrom(address,address,uint256)"
        }
    }
}