//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IUserController {
    function isPermissionX(address _user, uint256 _permission)
        external
        view
        returns (bool);
}
