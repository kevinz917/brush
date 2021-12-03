//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// import { ERC721Checkpointable } from "./base/ERC721Checkpointable.sol"; TODO: Read NounsDAO's contract here
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "hardhat/console.sol"; // REMOVE ALL IN PROD

contract Token is ERC721Enumerable, Ownable {
    address public minter; // minter
}
