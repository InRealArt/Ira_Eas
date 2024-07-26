// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IraSchemaRegistrar} from "../src/IraSchemaRegistrar.sol";
import {ISchemaRegistry} from "eas-contracts/ISchemaRegistry.sol";

contract DeploySchemaRegistrar is Script {
    function setUp() public {}

    function run() public returns (IraSchemaRegistrar){
        vm.startBroadcast();
        IraSchemaRegistrar schemaRegistrar = new IraSchemaRegistrar(ISchemaRegistry(0xC2679fBD37d54388Ce493F1DB75320D236e1815e));
        vm.stopBroadcast();
        return schemaRegistrar;
    }
}
