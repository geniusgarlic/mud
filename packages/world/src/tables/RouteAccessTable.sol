// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { IStore } from "store/IStore.sol";
import { SchemaType } from "store/Types.sol";
import { Schema } from "store/Schema.sol";
import { RouteAccessSchemaLib as SchemaLib } from "../schemas/RouteAccess.sol";

// -- User defined schema and tableId --
bytes32 constant tableId = keccak256("mud.world.table.routeAccess");

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

  function registerSchemaInternal() internal {
    SchemaLib.registerSchemaInternal(tableId);
  }

  /** Set the table's data */
  function set(
    bytes32 routeId,
    address caller,
    bool access
  ) internal {
    SchemaLib.set(tableId, routeId, caller, access);
  }

  /** Get the table's data */
  function get(bytes32 routeId, address caller) internal view returns (bool) {
    return SchemaLib.get(tableId, routeId, caller);
  }

  function get(
    IStore store,
    bytes32 routeId,
    address caller
  ) internal view returns (bool) {
    return SchemaLib.get(tableId, store, routeId, caller);
  }
}
