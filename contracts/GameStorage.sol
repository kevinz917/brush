//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./GameState.sol";

// where the game data is stored
contract GameStorage {
    GameState.MasterGameStorage public s; // game storage

    ///////////////////////////////////////////////
    // put all low level getters and setters here?
    // currently: for each "variable", we have a getter and setter (mimicing db)
    ///////////////////////////////////////////////

    // TODO: Add permission control

    function setPlayerAlias(string memory _name) public {
        s.playerState[msg.sender].name = _name;
    }

    function getStamina(address _player) public view returns (uint256) {
        return s.playerState[_player].stamina;
    }

    function setStamina(address _player, uint256 _stamina) public {
        s.playerState[_player].stamina = _stamina;
    }
}
