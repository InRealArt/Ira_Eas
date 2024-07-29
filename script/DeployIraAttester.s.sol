// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IraAttester} from "../src/IraAttester.sol";
import { IEAS } from "eas-contracts/IEAS.sol";
import {SEPOLIA_CHAIN_ID, SEPOLIA_OFFICIAL_EAS_ADDRESS} from "./lib/DeployConstants.sol";

contract DeployIraSchemaRegistrar is Script {

    mapping (uint chainId => address easAddress) easAddresses;

    function setUp() internal {
        // Sepolia 
        easAddresses[SEPOLIA_CHAIN_ID] = SEPOLIA_OFFICIAL_EAS_ADDRESS;
        // Mainnet
        //easAddresses[1] = 0xC2679fBD37d54388Ce493F1DB75320D236e1815e;
    }

    function run() public returns (IraAttester){
        setUp();
        vm.startBroadcast();
        uint256 chainId = block.chainid;
        IraAttester iraAttester = new IraAttester(IEAS(easAddresses[chainId]));
        vm.stopBroadcast();
        return iraAttester;
    }
}
