//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./interface/IGameStorage.sol";
import "./types/GameState.sol";

// These are "second lowest level" modifiers
contract StateModifier {
    IGameStorage public gameStorage;

    // initiate pointer to gameStorage contract to access low level setter functions
    constructor(IGameStorage _gameStorage) {
        gameStorage = _gameStorage;
    }

    function checkAndModifyStamina(address _player) public {
        if (gameStorage.getStamina(_player) > 10) {
            gameStorage.setStamina(_player, 10);
        }
    }
}
