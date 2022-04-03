// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Storage is AccessControl {
  bytes32 public constant ROLE_ADMIN = keccak256("ROLE_ADMIN");
  bytes32 public constant ROLE_WRITER = keccak256("ROLE_WRITER");

  uint256 number;

  constructor() {
    _grantRole(ROLE_ADMIN, msg.sender);
  }

  function store(uint256 num) public {
    require(hasRole(ROLE_WRITER, msg.sender), "Only writer can call this function");
    number = num;
  }

  function retrieve() public view returns(uint256) {
    return number;
  }

  modifier onlyAdmin {
    require(hasRole(ROLE_ADMIN, msg.sender), "Only admin can call this function");
    _;
  }

  function addRole(address account) public onlyAdmin() {
    _grantRole(ROLE_WRITER, account);
  }

  function removeRole(address account) public onlyAdmin() {
    _revokeRole(ROLE_WRITER, account);
  }

}
