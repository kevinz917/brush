//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// master game state for all data
import "./types/common.sol";

library GameState {
    struct User {
        Common.Point location;
        string name;
        uint256 stamina;
    }

    struct MasterGameStorage {
        // admin state
        bool isWorldPaused;
        // player data
        address nextGameStorage; // TBD!!!
        mapping(address => User) playerState;
    }
}
