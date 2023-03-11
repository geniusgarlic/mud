// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { IWorldCore } from "./IWorldCore.sol";

interface IModule {
  /**
   * A module expects to be called via the World contract, and therefore installs itself on its `msg.sender`.
   */
  function install(bytes16 namespace) external;
}
