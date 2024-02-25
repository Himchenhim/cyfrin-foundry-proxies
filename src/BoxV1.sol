// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import {Proxy} from "../lib/openzeppelin-contracts/contracts/proxy/Proxy.sol";
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

// storage is stored in the PROXY, not in the IMPLEMENATION 

// Proxy (borrowing func) -> implementation (if implemetation has a constructor: number=1) 

// proxy -> deploy implementation -> call some "initializer" function.

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    // linter
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers(); // don't let any initialization happen
        // owner = msg.sender   // we CANNOT DO THAT!
    }

    function initialize() public initializer{
        __Ownable_init(msg.sender); // sets owner to msg.sender == `owner = msg.sender`
        __UUPSUpgradeable_init(); // does not do anything, but! Best practice to have it -> to show, that this UUPS proxy
    }


    function getNumber() external view returns(uint256){
        return number;
    }

    function version() external pure returns(uint256){
        return 1;
    }

    function _authorizeUpgrade (address newImplementation) internal override {
        // if ( msg.sender != owner){revert;}
    }
}