// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {DecentralisedStableCoin} from "./DecentralisedStableCoin.sol";

/**
 * @title DSCEngine
 * @author 0xsyber88
 * @notice Core of the DSC  system. It handles all the logic for minting and redeeming DSC, as well as depositing & withdrawing collateral.
 *
 * system is desgned to be to be as minimal as possible and have the tokens maintain a 1 token == $1 peg.
 * Collatera: Exogenous
 * Dollar Pegged
 * Algorithmically Stable
 *
 * Our DSC should always be "overCollateralised". At no point should the value of all the collateral be less than or equal to the value of all the DSC.
 */
contract DSCEngine {
    //////////////////
    // Errors       //
    //////////////////
    error DSCEngine__NeedsMoreThanZero();
    error DSCEngine__TokenAdressesAndPriceFeedAddressMustBeSameLength();
    error DSCEngine__TokenNotAllowed();

    //////////////////////
    // State Variables  //
    //////////////////////

    mapping(address token => address priceFeed) private s_priceFeeds;
    DecentralisedStableCoin private immutable i_dsc;

    //////////////////
    // Modifiers    //
    //////////////////
    modifier moreThanZero(uint256 amount) {
        if (amount == 0) {
            revert DSCEngine___NeedsMoreThanZero();
        }
        _;
    }

    modifier isAllowedToken(address token) {
        if (s_priceFeeds[token] == address(0)) {
            revert DSCEngine__TokenNotAllowed();
        }
        _;
    }

    //////////////////
    // Functions    //
    //////////////////

    constructor(address[] memory tokenAddresses, address[] memory priceFeedAddresses, address dscAddress) {
        if (tokenAddresses.length != priceFeedAddresses.length) {
            revert DSCEngine__TokenAdressesAndPriceFeedAddressMustBeSameLength();
        }

        for (uint256 i = 0; i < tokenAddresses.length; i++) {
            s_priceFeeds[tokenAddresses[i]] = priceFeedAddresses[i];
        }
        i_dsc = DecentralisedStableCoin(dscAddress);
    }

    /////////////////////////
    // External Functions  //
    ////////////////////////
    function depositCollateralAndMintDsc() external {}
    /**
     *
     * @param tokenCollateralAddress The address of the token to deposit as collateral
     * @param amountCollateral Amount of collateral to deposit
     */
    function depositCollateral(address tokenCollateralAddress, uint256 amountCollateral)
        external
        moreThanZero(amountCollateral)
        isAllowedToken(tokenCollateralAddress)
    {}

    function redeemCollateralForDsc() external {}
    function redeemCollateral() external {}
    function mintDsc() external {}
    function burnDsc() external {}
    function liquidate() external {}
    function getHealthFactor() external view {}
}
