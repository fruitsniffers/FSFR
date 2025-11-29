// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title FSFR — Fruit Sniffers Token
/// @notice Fixed-supply, immutable ERC20 with no owner or admin.
/// @dev Total supply minted once at deployer address.
contract FSFR is ERC20 {
    constructor() ERC20("Fruit Sniffers", "FSFR") {
        _mint(msg.sender, 100_000_000 * 10 ** decimals());
    }
}
