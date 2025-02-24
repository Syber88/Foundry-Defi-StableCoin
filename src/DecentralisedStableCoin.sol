// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;

import {ERC20, ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DecentralisedStableCoin
 * @author 0xsyber88
 * Collateral: Exogenous (ETH & BTC)
 * Mining: Algorithmic
 * Relative Stability: Pegged to USD
 * This Contract is meant to be governed by DSCEngine. THis contract is just the ERC20 implementation of our stablecoin system
 */
contract DecentralisedStableCoin is ERC20Burnable, Ownable{

    error DecentralisedStableCoin__MustBeGreaterThanZero();
    error DecentralisedStableCoin__BurnAmountMustExceedBalance();

    constructor() ERC20("DecentralisedStableCoin", "DSC") Ownable(msg.sender) {}

    function burn(uint256 _amount) public override onlyOwner{
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DecentralisedStableCoin__MustBeGreaterThanZero();
        }
        if (balance < _amount) {
            revert DecentralisedStableCoin__BurnAmountMustExceedBalance();
        }
        super.burn(_amount);


    }

}
