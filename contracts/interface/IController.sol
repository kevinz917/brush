//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IController {
    function idOfModule(address _caller) external returns (uint256);

    function setModule(uint256 _id, address _module) external;

    function canWrite(uint256 _id, address _caller)
        external
        view
        returns (bool);
}
