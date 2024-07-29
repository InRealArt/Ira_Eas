// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IraSchemaRegistrar} from "../src/IraSchemaRegistrar.sol";
import {ISchemaRegistry} from "eas-contracts/ISchemaRegistry.sol";
import {SEPOLIA_CHAIN_ID, SEPOLIA_OFFICIAL_REGISTRY_ADDRESS} from "./lib/DeployConstants.sol";

contract DeployIraSchemaRegistrar is Script {

    mapping (uint chainId => address registryAddress) registryAddresses;

    function setUp() internal {
        // Sepolia 
        registryAddresses[SEPOLIA_CHAIN_ID] = SEPOLIA_OFFICIAL_REGISTRY_ADDRESS;
    }

    function run() public returns (IraSchemaRegistrar){
        setUp();
        vm.startBroadcast();
        uint256 chainId = block.chainid;
        IraSchemaRegistrar schemaRegistrar = new IraSchemaRegistrar(ISchemaRegistry(registryAddresses[chainId]));
        vm.stopBroadcast();
        return schemaRegistrar;
    }
}
