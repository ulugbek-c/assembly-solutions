// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BasicBank {
    // emit these
    event Deposit(address indexed depositor, uint256 amount);
    event Withdraw(address indexed withdrawer, uint256 amount);

    error InsufficientBalance();

    mapping(address => uint256) public balances;

    function deposit() external payable {
        bytes32 depositSelector = Deposit.selector;
        assembly {
            let m := mload(0x40)
            let s := call(gas(),address(),callvalue(), m,0,m,0)
            let sl := balances.slot
            mstore(0x00,caller())
            mstore(0x20, sl)
            mstore(m, callvalue())
            let kk := keccak256(0x00,0x40)
            let lod := sload(kk)
            sstore(kk, add(callvalue(),lod))
            log2(m,0x20,depositSelector,caller())
            // emit Deposit(msg.sender, msg.value)
            // increment the balance of the msg.sender by msg.value
        }
    }

    function withdraw(uint256 amount) external returns (uint256 bal) {
        bytes32 withdrawSelector = Withdraw.selector;
        bytes4 insufficientBalanceSelector = InsufficientBalance.selector;
        assembly {
            let m := mload(0x40)
            mstore(m,amount)
            mstore(0x00,caller())
            mstore(0x20, 0)
            let kk := keccak256(0x00,0x40)
            let lod := sload(kk)
                mstore(0x60, insufficientBalanceSelector)
            if gt(amount,selfbalance()){
                revert(0x60, 0x04)
            }
            let s := call(gas(),caller(),amount, m,0,m,0)
            sstore(kk, sub(lod,amount))
            log2(m,0x20, withdrawSelector,caller())

            // emit Withdraw(msg.sender, amount)
            // if the balance is less than amount, revert InsufficientBalance()
            // decrement the balance of the msg.sender by amount
            // send the amount to the msg.sender
        }
    }

}