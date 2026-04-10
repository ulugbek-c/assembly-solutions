# Assembly Solutions

A comprehensive collection of Solidity assembly (`yul`) implementations for common Ethereum smart contract operations. This project uses **Foundry** for testing and development.

## Overview

This repository contains 80+ assembly language implementations covering:

- **Arithmetic Operations**: Addition, subtraction, multiplication, division, logarithms, square roots
- **Data Structures**: Fixed arrays, dynamic arrays, mappings, packed storage, structs
- **Storage Operations**: Read/write operations, bit manipulation, packed storage access
- **Control Flow**: Conditional logic, loops, event emissions, fallback functions
- **Contract Interactions**: Contract creation, function calls, ether transfers
- **Utilities**: Hashing (Keccak), event encoding, data validation

## Quick Start

### Prerequisites

- [Foundry](https://getfoundry.sh/)
- Rust (installed with Foundry)

### Installation

```bash
git clone https://github.com/yourusername/assembly-solutions.git
cd assembly-solutions
forge install
```

### Build

```bash
forge build
```

### Run Tests

```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -v

# Run a specific test file
forge test --match-contract CalldataLengthTest

# Run a specific test function
forge test --match-test test_CalldataLength
```

### Format Code

```bash
forge fmt
```

### Gas Snapshots

```bash
forge snapshot
```

## Project Structure

```
├── src/
│   └── assemblyTasks/         # Assembly implementations
│       ├── AbsoluteValue.sol
│       ├── Calculator.sol
│       ├── CalculatorInFallback.sol
│       ├── BasicBank.sol
│       └── ... (80+ more)
├── test/
│   └── AssemblySolutions/     # Comprehensive test suite (92 tests)
│       ├── Calculator.t.sol
│       ├── CalldataLength.t.sol
│       └── ...
├── lib/                        # Dependencies (forge-std, OpenZeppelin, etc.)
└── foundry.toml               # Foundry configuration
```

## Key Examples

### Basic Operations

- **Calculator.sol**: Basic arithmetic (add, sub, mul, div)
- **CalculatorInFallback.sol**: Dispatcher pattern with fallback function
- **Double.sol**: Simple assembly function
- **AbsoluteValue.sol**: Conditional logic in assembly

### Storage Operations

- **ReadFromStorage.sol**: Reading from storage slots
- **WriteToStorage.sol**: Writing to storage slots
- **ReadFromMapping.sol**: Accessing mapping values
- **WriteToMapping.sol**: Writing to mappings
- **ReadFromPacked64.sol** / **WriteToPacked64.sol**: Packed storage access

### Arrays & Dynamics

- **PushToDynamicArray.sol**: Appending to dynamic arrays
- **PopFromDynamicArray.sol**: Removing from dynamic arrays
- **ReadFromDynamicArray.sol**: Accessing dynamic array elements
- **WriteDynamicArrayToStorage.sol**: Storing arrays

### Contract Operations

- **CreateSimple.sol**: Basic contract creation
- **CreateSimplePayable.sol**: Creation with ether handling
- **SimpleCall.sol**: Cross-contract calls
- **SendEther.sol**: Ether transfers

### Events & Data

- **EventWithData.sol**: Emitting events with parameters
- **EventWithIndexedData.sol**: Indexed event parameters
- **EventWithComplexData.sol**: Complex event data structures
- **BatchEvents.sol**: Multiple event emissions

## Testing

All contracts are thoroughly tested with property-based fuzzing:

```bash
# Run full test suite (92 tests pass)
forge test

# Tests use Foundry's vm.assume() for constraint-based fuzzing
```

## Configuration

See `foundry.toml` for configuration details:

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]

[fuzz]
runs = 100
seed = '0x2'

[invariant]
runs = 64
depth = 32
fail_on_revert = true
```

## Learning Resources

- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Yul Language Reference](https://docs.soliditylang.org/en/latest/yul.html)
- [EVM Opcodes](https://www.evm.codes/)

## About

These are solutions to the **80 assembly problems** from the [RareSkills Yul/Assembly Course](https://www.rareskills.io/). I've implemented all problems and added comprehensive Foundry tests for each one. If you're learning assembly, I highly recommend checking out the [RareSkills course](https://www.rareskills.io/) for detailed explanations and guided learning.

## License

AGPL-3.0-or-later
