// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DecentralisedStableCoin} from "../../src/DecentralisedStableCoin.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";


contract DSCEngineTest is Test {
    DeployDSC deployer;
    DecentralisedStableCoin dsc;
    DSCEngine dscEngine;
    HelperConfig config;
    address ethUsdPriceFeed;
    address weth;

    function setUp() public {
        deployer = new DeployDSC();
        // vm.startBroadcast();
        (dsc, dscEngine, config) = deployer.run();
        // vm.stopBroadcast();
        (ethUsdPriceFeed,, weth,,) = config.activeNetworkConfig();


    }

    //////////////////
    // Price Test   //
    //////////////////

    function testGetUsdValue() public view {
        uint256 ethAmount = 15e18;
        uint256 expectedUsd = 30000e18;
        uint256 actualUsd = dscEngine.getUsdValue(weth, ethAmount);
        assertEq(expectedUsd, actualUsd);

    }

    //////////////////////////////
    // Deposit Collateral Test  //
    /////////////////////////////

}