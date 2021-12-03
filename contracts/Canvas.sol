//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {PausableUpgradeable} from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import {ReentrancyGuardUpgradeable} from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./interface/IToken.sol";
import "./interface/ISetting.sol";

struct Pixel {
    address owner;
    uint256 color;
    uint256 lastPlaced;
}

// someone can screenshot once per day
struct Screenshot {
    address owner;
    uint256 _date;
}

// canvas
contract Canvas is PausableUpgradeable {
    ISetting public setting;
    IToken public nft;

    // every epoch is 24 hours;
    uint256 public epoch;

    mapping(uint256 => mapping(uint256 => Pixel)) public canvas; // x => y => HEX
    mapping(uint256 => bool) public colors; // allowed colors
    mapping(address => uint256) public lastPlaced; // when user last placed a pixel

    mapping(uint256 => mapping(uint256 => Screenshot)) public screenshots;
    mapping(address => uint256) public lastScreenshotted; // when users last screenshotted

    // initialize
    function initialize(
        IToken _nft,
        ISetting _setting,
        uint256[] memory _colors
    ) external initializer {
        __Pausable_init();

        // initialize color pallette
        for (uint256 i = 0; i < _colors.length; i++) {
            colors[_colors[i]] = true;
        }

        nft = _nft;
        setting = _setting;
        epoch = 60 * 60 * 24;
    }

    ////////////////////
    ///// functions ////
    ////////////////////

    // user paints a pixel
    function paint(
        uint256 _x,
        uint256 _y,
        uint256 _color
    ) external canUserPlace whenNotPaused {
        require(setting.isColorValid(_color), "INVALID COLOR");
        // require(colors[_color], "VALID COLOR");
        canvas[_x][_y] = Pixel({
            owner: msg.sender,
            color: _color,
            lastPlaced: block.timestamp
        });

        lastPlaced[msg.sender] = block.timestamp;
    }

    // screenshot a portion of the canvas
    // perhaps every week the DAO can admit someone for proof of work aka curating.
    // proceeds will go to the DAO, and
    function screenshot(uint256 _x, uint256 _y) external canUserScreenshot {
        // require()
    }

    ////////////////////
    ///// modifiers ////
    ////////////////////

    // User can place 1 pixel a day;
    modifier canUserPlace() {
        require(
            block.timestamp - lastPlaced[msg.sender] >= epoch,
            "WAIT FOR COOLDOWN"
        );
        _;
    }

    // user can screenshot once per day
    modifier canUserScreenshot() {
        require(
            block.timestamp - lastScreenshotted[msg.sender] >= epoch,
            "WAIT FOR COOLDOWN"
        );
        _;
    }
}
