//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "./interface/IUserController.sol";

// Current permission table:
// 0: Admin
// 1: whitelisted user
// 3: special privilage
// ...

contract UserController is IUserController, OwnableUpgradeable {
    mapping(address => mapping(uint256 => bool)) public userPermissions;
    mapping(uint256 => bool) public allPermissions; // all possible permissions

    // TODO: Make this only owners can use
    // add permission to user
    function setPermissionForUser(
        address _user,
        uint256 _permission,
        bool _validity
    ) public onlyOwner {
        userPermissions[_user][_permission] = _validity;
    }

    // this is basically a modifier
    function isPermissionX(address _user, uint256 _permission)
        public
        view
        returns (bool)
    {
        require(allPermissions[_permission], "NONEXISTENT PERMISSION");
        return userPermissions[_user][_permission];
    }
}
