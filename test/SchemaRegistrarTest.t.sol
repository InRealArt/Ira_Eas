// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IraSchemaRegistrar} from "../src/IraSchemaRegistrar.sol";
import {IraResolver} from "../src/IraResolver.sol";
import {DeployIraResolver} from "../script/DeployIraResolver.s.sol";
import {DeployIraSchemaRegistrar} from "../script/DeployIraSchemaRegistrar.s.sol";

contract SchemaRegistrarTest is Test {

    address NON_GRANTED_ATTESTER = makeAddr("NON_GRANTED_ATTESTER");
    IraResolver iraResolver;
    IraSchemaRegistrar iraSchemaRegistrar;
    DeployIraResolver deployIraResolver;
    DeployIraSchemaRegistrar deployIraSchemaRegistrar;

    function setUp() public {
        iraResolver = new DeployIraResolver().run();
        iraSchemaRegistrar = new DeployIraSchemaRegistrar().run();
    }

    function test1() public {
        vm.startPrank(NON_GRANTED_ATTESTER);
        iraSchemaRegistrar.register('string name', iraResolver, true);
        vm.stopPrank();
    }

}
