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

uint256 constant _tableId = uint256(bytes32(abi.encodePacked(bytes16(""), bytes16("InstalledModules"))));
uint256 constant InstalledModulesTableId = _tableId;

struct InstalledModulesData {
  address moduleAddress;
}

library InstalledModules {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES16;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](1);
    _fieldNames[0] = "moduleAddress";
    return ("InstalledModules", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get moduleAddress */
  function getModuleAddress(bytes16 moduleName, bytes32 argumentsHash) internal view returns (address moduleAddress) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((moduleName));
    _primaryKeys[1] = bytes32((argumentsHash));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set moduleAddress */
  function setModuleAddress(bytes16 moduleName, bytes32 argumentsHash, address moduleAddress) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((moduleName));
    _primaryKeys[1] = bytes32((argumentsHash));

    StoreSwitch.setField(_tableId, _primaryKeys, 0, abi.encodePacked((moduleAddress)));
  }

  /** Get the full data */
  function get(bytes16 moduleName, bytes32 argumentsHash) internal view returns (InstalledModulesData memory _table) {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((moduleName));
    _primaryKeys[1] = bytes32((argumentsHash));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes16 moduleName, bytes32 argumentsHash, address moduleAddress) internal {
    bytes memory _data = encode(moduleAddress);

    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((moduleName));
    _primaryKeys[1] = bytes32((argumentsHash));

    StoreSwitch.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes16 moduleName, bytes32 argumentsHash, InstalledModulesData memory _table) internal {
    set(moduleName, argumentsHash, _table.moduleAddress);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (InstalledModulesData memory _table) {
    _table.moduleAddress = (address(Bytes.slice20(_blob, 0)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(address moduleAddress) internal view returns (bytes memory) {
    return abi.encodePacked(moduleAddress);
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes16 moduleName, bytes32 argumentsHash) internal {
    bytes32[] memory _primaryKeys = new bytes32[](2);
    _primaryKeys[0] = bytes32((moduleName));
    _primaryKeys[1] = bytes32((argumentsHash));

    StoreSwitch.deleteRecord(_tableId, _primaryKeys);
  }
}
