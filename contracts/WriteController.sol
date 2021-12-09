//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./interface/IUserController.sol";
import "./interface/IMotherboard.sol";
import "./interface/IController.sol";

// Permission control for the contracts.
// TODO: Make this upgradable
contract WriteController {
    IMotherboard public motherboard;

    address public wizard;
    mapping(address => mapping(address => bool)) public allowedToWrite; // base -> requesting party -> bool

    event SetModule(uint256 _id, address _module, address _setter);

    // whitelist function to be able to call other contract
    // in theory, individual functions should have specific controls?
    // ex: we can assign functionIds and permission them more carefully
    function CanWrite(address _base, address _caller)
        public
        view
        returns (bool)
    {
        // require(motherboard.getModuleAddress(0));
        return allowedToWrite[_base][_caller];
    }

    function addCanWrite(address _base, address _caller) public onlyAdmin {
        allowedToWrite[_base][_caller] = true;
    }

    // modifier
    // only admin pulls from IUserController permissions
    modifier onlyAdmin() {
        require(
            IUserController(motherboard.getModuleAddress(0)).isPermissionX(
                msg.sender,
                0
            ),
            "INVALID PERMISSION"
        );
        _;
    }
}
