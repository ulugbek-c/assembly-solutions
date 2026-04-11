// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithComplexData {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, address[] players, uint256[] scores);

    function main(address emitter, address[] memory players, uint256[] memory scores) external {
        assembly {
            let m := mload(players)
            let n := mload(scores)
            mstore(0x00, players)
            mstore(0x40, 0x40)
            mstore(0x60, add(mul(m, 0x20), 0x60))
            log2(
                0x40,
                add(add(add(mul(m, 0x20), 0x60), mul(n, 0x20)), 0x20),
                0x06af3d8f9866c9f54dcf425d9da9f75849af90454a25bca9df5fb24d80683e6a,
                emitter
            )
            // your code here
            // emit the `MyEvent(address,address[],uint256[])` event
            // Hint: Use `log2` to emit the event with the hash as the topic0 and `emitter` as topic1, then the data
        }
    }
}
