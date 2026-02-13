// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// IMPORT OPENLY FROM NPM/REMIX CONVERTED TO GITHUB
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/access/Ownable.sol";

contract MiToken is ERC20, ERC20Burnable, ERC20Pausable, Ownable {

    // ERC20Burnable: allows holders to burn their tokens if they want.
    // ERC20Pausable: allows the owner to pause and resume token transfers, useful in emergencies.
    // Ownable: only the owner can pause or resume the token.

    constructor(uint256 initialSupply) ERC20("MiTokenSeguro", "MTS") {
        // Mint initial supply to the owner
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    // Pause the token transfers
    function pause() external onlyOwner {
        _pause();
    }

    // Resume the token transfers
    function unpause() external onlyOwner {
        _unpause();
    }

    // Mandatory override for the _beforeTokenTransfer hook
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20, ERC20Pausable) {
        super._beforeTokenTransfer(from, to, amount);
    }
}

