// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MultiToken is ERC1155 {

  uint256 public constant Fungible = 0;
  uint256 public constant NonFungible = 1;
  uint256 public constant AnotherFungible = 2;

  constructor() public ERC1155("Here a uri") {
    _mint(msg.sender, Fungible, 1000, "");
    _mint(msg.sender, NonFungible, 1, "");
    _mint(msg.sender, AnotherFungible, 500, "");
  }
}
