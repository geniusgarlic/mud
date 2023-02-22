// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { SchemaType } from "@latticexyz/store/src/Types.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { RouteAccessSchemaLib as SchemaLib } from "../schemas/RouteAccessSchema.sol";

// -- User defined schema and tableId --
uint256 constant tableId = uint256(keccak256("mud.world.table.routeAccess"));

// -- Autogenerated library to interact with tables with this schema --
// TODO: autogenerate

library RouteAccessTable {
  /** Register the table's schema */
  function registerSchema() internal {
    SchemaLib.registerSchema(tableId);
  }

  function registerSchema(IStore store) internal {
    SchemaLib.registerSchema(tableId, store);
  }

  /** Set the table's data */
  function set(
    uint256 routeId,
    address caller,
    bool access
  ) internal {
    SchemaLib.set(tableId, routeId, caller, access);
  }

  /** Get the table's data */
  function get(uint256 routeId, address caller) internal view returns (bool) {
    return SchemaLib.get(tableId, routeId, caller);
  }

  function get(
    IStore store,
    uint256 routeId,
    address caller
  ) internal view returns (bool) {
    return SchemaLib.get(tableId, store, routeId, caller);
  }

  function deleteRecord(uint256 routeId, address caller) internal {
    SchemaLib.deleteRecord(tableId, routeId, caller);
  }
}
