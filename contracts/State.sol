//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./interface/IController.sol";

// example: this is a storage contract, and only authorized contracts can
// set state for this

// TODO: Make this proxy upgradeable
contract StateContract {
    // uint256 public name;
    // IController public controller;
    // constructor(IController _controller) {
    //     controller = _controller;
    // }
    // // only authorized contracts can call this function
    // function exampleModifyState(uint256 _name) public onlyApprovedWriteApps {
    //     name = _name;
    // }
    // // allow authorized modules, fetched from Controler.sol, to call this function using degateCall and therefore modify its storage.
    // function delegateCallSetName(address _target, uint256 _name)
    //     public
    //     onlyApprovedWriteApps
    // {
    //     (bool success, bytes memory data) = _target.delegatecall(
    //         abi.encodeWithSignature("setName(uint256)", _name)
    //     );
    // }
    // // modifiers
    // modifier onlyApprovedWriteApps() {
    //     require(
    //         controller.canWrite(controller.idOfModule(msg.sender), msg.sender)
    //     );
    //     _;
    // }
}
