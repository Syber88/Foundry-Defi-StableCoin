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
    function depositCollateralAndMintDsc() external {}
    function deposit() external {}
    function redeemCollateralForDsc() external {}
    function burnDsc() external {}
    function liquidate() external {}
    function getHealthFactor() external view {}
}