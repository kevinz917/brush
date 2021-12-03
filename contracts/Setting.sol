//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {PausableUpgradeable} from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "./interface/ISetting.sol";

// should we separate out the settings here?
// setting might include: color inclusion, DAO parameters, etc.
contract Setting is ISetting, PausableUpgradeable {
    address DAO;

    mapping(uint256 => bool) public colors; // allowed color pallette

    // initialize
    function initialize(uint256[] memory _colors) external initializer {
        // initialize color pallette
        for (uint256 i = 0; i < _colors.length; i++) {
            colors[_colors[i]] = true;
        }
    }

    // check valid color
    function isColorValid(uint256 _color)
        external
        view
        override
        returns (bool)
    {
        return colors[_color];
    }

    // add color
    function addColor(uint256 _color) external onlyDAO {
        colors[_color] = true;
    }

    // remove color
    function removeColor(uint256 _color) external onlyDAO {
        colors[_color] = false;
    }

    modifier onlyDAO() {
        require(msg.sender == DAO, "NOT DAO");
        _;
    }
}
