//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./common.sol";

// master game state for all data
library GameState {
    // possible, placeable items
    enum BuiltItemtype {
        DYE_GENERATOR,
        CHEST,
        EMPTY_ITEM
    }

    struct User {
        Common.Point location;
        string name;
        uint256 stamina;
    }

    // generates dye aka primary resource
    struct DyeGenerator {
        uint256 rate;
        uint256 cost;
    }

    struct Location {
        address owner;
        bool isMined;
        BuiltItemtype itemId;
    }

    struct MasterGameStorage {
        // admin state
        bool isWorldPaused;
        // TODO: How do people
        uint256 dyeGeneratorNonce;
        address nextGameStorage; // TBD!!!
        mapping(address => User) playerState;
        mapping(uint256 => mapping(uint256 => Location)) mapState; // x -> y -> Location
        mapping(uint256 => DyeGenerator) dyeGenerators; // dye generators placed around the world
    }
}
