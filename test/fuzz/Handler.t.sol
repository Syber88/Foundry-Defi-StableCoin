// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {DecentralisedStableCoin} from "../../src/DecentralisedStableCoin.sol";


contract Handler is Test{
    DSCEngine dscEngine;
    DecentralisedStableCoin dsc;

    constructor(DSCEngine _dsceEngine, DecentralisedStableCoin _dsc) {
        // contracts we want the handler to make calls to
        dscEngine = _dsceEngine;
        dsc = _dsc;
    }

}