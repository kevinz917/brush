//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IMotherboard {
    function getModuleAddress(uint256 _moduleCode) external returns (address);
}
