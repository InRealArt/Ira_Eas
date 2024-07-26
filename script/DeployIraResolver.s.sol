// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IraResolver} from "../src/IraResolver.sol";
import {ISchemaRegistry} from "eas-contracts/ISchemaRegistry.sol";
import { IEAS } from "eas-contracts/IEAS.sol";
import {SEPOLIA_CHAIN_ID, SEPOLIA_OFFICIAL_EAS_ADDRESS} from "./lib/DeployConstants.sol";

contract DeployIraResolver is Script {

    mapping (uint chainId => address easAddress) easAddresses;
    mapping (uint chainId => address attesterAddress) attesterAddresses;

    function setUp() public {
        // Sepolia 
        easAddresses[SEPOLIA_CHAIN_ID] = SEPOLIA_OFFICIAL_EAS_ADDRESS;
        attesterAddresses[SEPOLIA_CHAIN_ID] = 0xCB23DeF95E386Bd5e8102ad53fc98B7e23416Fa4;
        // Mainnet
        //easAddresses[1] = 0xC2679fBD37d54388Ce493F1DB75320D236e1815e;
    }

    function run() public returns (IraResolver){
        vm.startBroadcast();
        uint256 chainId = block.chainid;
        IraResolver resolver = new IraResolver(IEAS(easAddresses[chainId]), attesterAddresses[chainId]);
        vm.stopBroadcast();
        return resolver;
    }
}
