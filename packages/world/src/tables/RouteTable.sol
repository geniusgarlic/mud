// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { SchemaType } from "@latticexyz/store/src/Types.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { RouteSchemaLib as SchemaLib } from "../schemas/RouteSchema.sol";

// -- User defined schema and tableId --
uint256 constant tableId = uint256(keccak256("mud.world.table.route"));

// -- Autogenerated library to interact with tables with this schema --
// TODO: autogenerate

library RouteTable {
  /** Register the table's schema */
  function registerSchema() internal {
    SchemaLib.registerSchema(tableId);
  }

  function registerSchema(IStore store) internal {
    SchemaLib.registerSchema(tableId, store);
  }

  /** Set the table's data */
  function set(uint256 routeId, string memory route) internal {
    SchemaLib.set(tableId, routeId, route);
  }

  /** Get the table's data */
  function get(uint256 key) internal view returns (string memory) {
    return SchemaLib.get(tableId, key);
  }

  function get(IStore store, uint256 key) internal view returns (string memory) {
    return SchemaLib.get(tableId, store, key);
  }

  function has(uint256 key) internal view returns (bool) {
    return SchemaLib.has(tableId, key);
  }
}
