// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

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
    error DSCEngine__Token

    //////////////////////
    // State Variables  //
    //////////////////////
    

     mapping (address token => address pricesFeed) s_priceFeeds;


    //////////////////
    // Modifiers    //
    //////////////////
    modifier moreThanZero (uint256 amount) {
        if (amount ==0){
            revert DSCEngine___NeedsMoreThanZero();
        }
        _;
    
    }

    // modifier isAllowedToken(){}

    //////////////////
    // Functions    //
    //////////////////

    constructor(
        address[] memory tokenAddress,
        address[] memory priceFeedAddress,
        address dscAddress
    ){
        if (tokenAddress.length != priceFeedAddress.length) {
            revert();
        }



    }

    /////////////////////////
    // External Functions  //
    ////////////////////////
    function depositCollateralAndMintDsc() external {


    }
    /**
     * 
     * @param tokenCollateralAddress The address of the token to deposit as collateral
     * @param amountCollateral Amount of collateral to deposit
     */
    function depositCollateral(address tokenCollateralAddress, uint256 amountCollateral) external moreThanZero(amountCollateral){


    }

    function redeemCollateralForDsc() external {}
    function redeemCollateral() external {}
    function mintDsc() external {}
    function burnDsc() external {}
    function liquidate() external {}
    function getHealthFactor() external view {}
}
