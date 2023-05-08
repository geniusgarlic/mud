// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("UsedKeysIndex")));
bytes32 constant UsedKeysIndexTableId = _tableId;

library UsedKeysIndex {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BOOL;
    _schema[1] = SchemaType.UINT32;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "has";
    _fieldNames[1] = "index";
    return ("UsedKeysIndex", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get has */
  function getHas(bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 0);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get has (using the specified store) */
  function getHas(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 0);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set has */
  function setHas(bytes32 sourceTable, bytes32 keysHash, bool has) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    StoreSwitch.setField(_tableId, _primaryKeys, 0, abi.encodePacked((has)));
  }

  /** Set has (using the specified store) */
  function setHas(IStore _store, bytes32 sourceTable, bytes32 keysHash, bool has) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    _store.setField(_tableId, _primaryKeys, 0, abi.encodePacked((has)));
  }

  /** Get index */
  function getIndex(bytes32 sourceTable, bytes32 keysHash) internal view returns (uint32 index) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 1);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get index (using the specified store) */
  function getIndex(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal view returns (uint32 index) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 1);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set index */
  function setIndex(bytes32 sourceTable, bytes32 keysHash, uint32 index) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    StoreSwitch.setField(_tableId, _primaryKeys, 1, abi.encodePacked((index)));
  }

  /** Set index (using the specified store) */
  function setIndex(IStore _store, bytes32 sourceTable, bytes32 keysHash, uint32 index) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    _store.setField(_tableId, _primaryKeys, 1, abi.encodePacked((index)));
  }

  /** Get the full data */
  function get(bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has, uint32 index) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal view returns (bool has, uint32 index) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    bytes memory _blob = _store.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 sourceTable, bytes32 keysHash, bool has, uint32 index) internal {
    bytes memory _data = encode(has, index);

    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    StoreSwitch.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 sourceTable, bytes32 keysHash, bool has, uint32 index) internal {
    bytes memory _data = encode(has, index);

    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    _store.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (bool has, uint32 index) {
    has = (_toBool(uint8(Bytes.slice1(_blob, 0))));

    index = (uint32(Bytes.slice4(_blob, 1)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(bool has, uint32 index) internal view returns (bytes memory) {
    return abi.encodePacked(has, index);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKey(bytes32 sourceTable, bytes32 keysHash) internal pure returns (bytes32[] memory _primaryKeys) {
    _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 sourceTable, bytes32 keysHash) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    StoreSwitch.deleteRecord(_tableId, _primaryKeys);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 sourceTable, bytes32 keysHash) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((sourceTable));
    _primaryKeys[1] = bytes32((keysHash));

    _store.deleteRecord(_tableId, _primaryKeys);
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
