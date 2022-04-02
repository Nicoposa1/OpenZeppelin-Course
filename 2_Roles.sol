// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract ContractWithRoles is AccessControl {
  bytes32 public constant ROLE_ADMIN = keccak256("ROLE_ADMIN");
  bytes32 public constant ROLE_USER = keccak256("ROLE_USER");

  constructor() {
    _grantRole(ROLE_ADMIN, msg.sender);
  }

  function onlyAdmin() view public {
    require(hasRole(ROLE_ADMIN, msg.sender), "Only admin can call this function");
  }

  function onlyUser() view public {
    require(hasRole(ROLE_USER, msg.sender), "Only user can call this function");
  }

  function addRole(bytes32 role, address account) view public {
    require(hasRole(ROLE_ADMIN, msg.sender), "Only admin can call this function");
  }

}
