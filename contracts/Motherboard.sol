//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "./interface/IMotherboard.sol";

// motherboard slots
// 0: permission controller for users
// 1: permission controller for contracts
contract Motherboard is IMotherboard, OwnableUpgradeable {
    mapping(uint256 => address) public getModuleAddress;

    // initialize set of modules
    constructor(uint256[] memory _moduleCodes, address[] memory _modules) {
        for (uint8 i = 0; i < _moduleCodes.length; i++) {
            getModuleAddress[_moduleCodes[i]] = _modules[i];
        }
    }

    function setModuleAddress(uint256 _moduleCode, address _module)
        public
        onlyOwner
    {
        getModuleAddress[_moduleCode] = _module;
    }
}
