// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { IStore } from "store/IStore.sol";
import { StoreSwitch } from "store/StoreSwitch.sol";
import { StoreCore } from "store/StoreCore.sol";
import { SchemaType } from "store/Types.sol";
import { Bytes } from "store/Bytes.sol";
import { Schema, SchemaLib } from "store/Schema.sol";
import { PackedCounter, PackedCounterLib } from "store/PackedCounter.sol";
import { SliceLib } from "store/Slice.sol";

// -- User defined schema and tableId --
struct BoolSchema {
  bool value;
}

// -- Autogenerated library to interact with tables with this schema --
// TODO: autogenerate

library BoolSchemaLib {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema schema) {
    schema = SchemaLib.encode(SchemaType.Bool);
  }

  /** Register the table's schema */
  function registerSchema(bytes32 tableId) internal {
    StoreSwitch.registerSchema(tableId, getSchema());
  }

  function registerSchema(bytes32 tableId, IStore store) internal {
    store.registerSchema(tableId, getSchema());
  }

  function registerSchemaInternal(bytes32 tableId) internal {
    StoreCore.registerSchema(tableId, getSchema());
  }

  /** Set the table's data */
  function set(
    bytes32 tableId,
    bytes32 key,
    bool value
  ) internal {
    bytes32[] memory keyTuple = new bytes32[](1);
    keyTuple[0] = key;
    StoreSwitch.setField(tableId, keyTuple, 0, abi.encodePacked(value));
  }

  /** Get the table's data */
  function get(bytes32 tableId, bytes32 key) internal view returns (bool) {
    bytes32[] memory keyTuple = new bytes32[](1);
    keyTuple[0] = key;
    bytes memory blob = StoreSwitch.getRecord(tableId, keyTuple);
    return SliceLib.fromBytes(blob).toBool();
  }

  function get(
    bytes32 tableId,
    IStore store,
    bytes32 key
  ) internal view returns (bool) {
    bytes32[] memory keyTuple = new bytes32[](1);
    keyTuple[0] = key;
    bytes memory blob = store.getRecord(tableId, keyTuple);
    return SliceLib.fromBytes(blob).toBool();
  }
}
