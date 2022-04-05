// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Challenge is ERC20Burnable, Ownable, Pausable {
 
  constructor() ERC20Burnable() ERC20("Challenge Extensions", "CH") {
    _mint(msg.sender, 1000);
  }

  function Pause() public onlyOwner {
    _pause();
  }

  function Unpause() public onlyOwner {
    _unpause();
  }

  function Burn(uint quantity) public {
    require(paused() != true, "Contract is paused");
    burn(quantity);
  }

}

