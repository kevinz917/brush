//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./interface/IController.sol";

// module list
// [0]: Canvas
// [1]: Setting
// ...

contract Controller is IController {
    address public wizard;
    mapping(uint256 => address) public modules; // module id -> module
    mapping(address => uint256) public idOfModule;

    // write access
    // for every module id, we store a list of addresses that can write to it using delegateCall
    mapping(uint256 => mapping(address => bool)) public writes; // write access

    event SetModule(uint256 _id, address _module, address _setter);

    // initiate list of modules
    constructor(address[] memory _modules) {
        for (uint8 i = 0; i < _modules.length; i++) {
            modules[i] = modules[i];
        }
    }

    // set module
    // to remove module, set address to 0x
    function setModule(uint256 _id, address _module)
        public
        override
        onlyWizard
    {
        modules[_id] = _module;

        emit SetModule(_id, _module, msg.sender);
    }

    function canWrite(uint256 _id, address _caller)
        public
        view
        override
        returns (bool)
    {
        return writes[_id][_caller];
    }

    // modifiers
    modifier onlyWizard() {
        require(msg.sender == wizard, "ONLY WIZARD");
        _;
    }
}
