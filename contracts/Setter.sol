//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./interface/IController.sol";

// module demonstrating sett storage in StateContract.sol
contract Setter {
    uint256 name;
    IController public controller;

    constructor(IController _controller) {
        controller = _controller;
    }

    function setName(uint256 _name) public {
        name = _name;
    }
}
