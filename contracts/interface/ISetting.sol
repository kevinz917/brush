//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ISetting {
    function isColorValid(uint256 _color) external returns (bool);
}
