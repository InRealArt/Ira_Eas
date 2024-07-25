// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SchemaRegistrar} from "../src/SchemaRegistrar.sol";
import {ISchemaRegistry} from "eas-contracts/ISchemaRegistry.sol";

contract DeploySchemaRegistrar is Script {
    function setUp() public {}

    function run() public returns (SchemaRegistrar){
        vm.startBroadcast();
        SchemaRegistrar schemaRegistrar = new SchemaRegistrar(ISchemaRegistry(0xC2679fBD37d54388Ce493F1DB75320D236e1815e));
        vm.stopBroadcast();
        return schemaRegistrar;
    }
}
