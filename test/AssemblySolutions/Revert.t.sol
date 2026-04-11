// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SimpleRevert} from "../../src/assemblyTasks/Revert.sol";

contract RevertWithErrorTest is Test {
    SimpleRevert public c;

    function setUp() public {
        c = new SimpleRevert();
    }

    function test_RevertWithError() public {
        vm.expectRevert(bytes("RevertRevert"));
        c.main();
    }
}
