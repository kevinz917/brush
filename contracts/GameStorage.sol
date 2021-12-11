//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./types/GameState.sol";
import "./types/common.sol";

// where the game data is stored
contract GameStorage {
    GameState.MasterGameStorage public s; // game storage

    ///////////////////////////////////////////////
    // put all low level getters and setters here (?)
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

    // location
    function getLocationInfo(uint256 _x, uint256 _y)
        public
        view
        returns (GameState.Location memory)
    {
        return s.mapState[_x][_y];
    }

    function setItemAtLocation(
        Common.Point memory _point,
        GameState.BuiltItemtype _itemId
    ) public {
        GameState.Location storage _locationData = s.mapState[_point.x][
            _point.y
        ];
        _locationData.itemId = _itemId;
    }

    function getDyeGeneratorNonce() public view returns (uint256) {
        return s.dyeGeneratorNonce;
    }

    // place dye generator
    function placeDyeGenerator(
        Common.Point memory _point,
        GameState.DyeGenerator memory _dyeGenerator
    ) public {
        GameState.Location storage _locationData = s.mapState[_point.x][
            _point.y
        ];
        _locationData.itemId = GameState.BuiltItemtype.DYE_GENERATOR;
        s.dyeGenerators[getDyeGeneratorNonce()] = _dyeGenerator;
    }

    // mine location
    function mineItemAtLocation(Common.Point memory _point) public {
        GameState.Location storage _locationData = s.mapState[_point.x][
            _point.y
        ];

        _locationData.isMined = true;
    }
}
