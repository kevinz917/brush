//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IGameStorage {
    function setPlayerAlias(string memory _name) external;

    function getStamina(address _player) external returns (uint256);

    function setStamina(address _player, uint256 _stamina) external;
}
