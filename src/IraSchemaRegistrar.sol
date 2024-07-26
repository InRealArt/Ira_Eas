// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {ISchemaRegistry} from "eas-contracts/ISchemaRegistry.sol";
import {ISchemaResolver} from "eas-contracts/resolver/ISchemaResolver.sol";
import {SchemaRegistered} from "./IraSchemaRegistratEvents.sol";

/// @title SchemaRegistrar
/// @notice Schema Registration Example
contract IraSchemaRegistrar {
    error InvalidSchemaRegistry();
    error InvalidSchema();
    error InvalidResolver();

    mapping (string schema => bytes32 schemaUids) private schemas;

    bytes32[] private schemaUids;


    // The address of the global SchemaRegistry contract.
    ISchemaRegistry private immutable _schemaRegistry;

    /// @notice Creates a new Attester instance.
    /// @param schemaRegistry The address of the global EAS contract.
    constructor(ISchemaRegistry schemaRegistry) {
        if (address(schemaRegistry) == address(0)) {
            revert InvalidSchemaRegistry();
        }

        _schemaRegistry = schemaRegistry;
    }

    /// @notice Submits and reserves a new schema
    /// @param schema The schema data schema.s
    /// @param resolver An optional schema resolver.
    /// @param revocable Whether the schema allows revocations explicitly.
    /// @return The UID of the new schema.
    function register(string memory schema, ISchemaResolver resolver, bool revocable) external returns (bytes32) {
        if (bytes(schema).length == 0) {
            revert InvalidSchema();
        }

        if (address(resolver) == address(0)) {
            revert InvalidResolver();
        }

        bytes32 schemaUid =  _schemaRegistry.register(schema, resolver, revocable);   
        schemaUids.push(schemaUid);
        schemas[schema] = schemaUid;

        emit SchemaRegistered(schema, schemaUid);
        return schemaUid;
    }
}