pragma solidity 0.8.26;

import { SchemaResolver } from "eas-contracts/resolver/SchemaResolver.sol";
import { IEAS, Attestation } from "eas-contracts/IEAS.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

/// @title IraResolver
/// @notice A schema resolver that checks whether the attestation is from a specific attester.
contract IraResolver is SchemaResolver, Ownable {

    address[] private s_attesters;

    constructor(IEAS eas, address _attester) SchemaResolver(eas) Ownable(msg.sender){
        s_attesters.push(_attester);
    }

    function setAttester(address _attester) public onlyOwner() {
        s_attesters.push(_attester);
    }

    function isAttester(address _attester) internal view returns(bool) {
        bool _isAttester = false;
        address[] memory attesters = s_attesters;
        for (uint i = 0; i < attesters.length; i++) {
            if (attesters[i] == _attester) {
                _isAttester = true;
                break;
            }
        }
        return _isAttester;
    }

    function onAttest(Attestation calldata attestation, uint256 /*value*/) internal view override returns (bool) {
        return isAttester(attestation.attester);
    }

    function onRevoke(Attestation calldata /*attestation*/, uint256 /*value*/) internal pure override returns (bool) {
        return true;
    }
}