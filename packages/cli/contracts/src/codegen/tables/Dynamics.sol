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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Dynamics")));
bytes32 constant DynamicsTableId = _tableId;

struct DynamicsData {
  bytes32[1] staticB32;
  int32[2] staticI32;
  uint128[3] staticU128;
  address[4] staticAddrs;
  bool[5] staticBools;
  uint64[] u64;
  string str;
  bytes b;
}

library Dynamics {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](8);
    _schema[0] = SchemaType.BYTES32_ARRAY;
    _schema[1] = SchemaType.INT32_ARRAY;
    _schema[2] = SchemaType.UINT128_ARRAY;
    _schema[3] = SchemaType.ADDRESS_ARRAY;
    _schema[4] = SchemaType.BOOL_ARRAY;
    _schema[5] = SchemaType.UINT64_ARRAY;
    _schema[6] = SchemaType.STRING;
    _schema[7] = SchemaType.BYTES;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](8);
    _fieldNames[0] = "staticB32";
    _fieldNames[1] = "staticI32";
    _fieldNames[2] = "staticU128";
    _fieldNames[3] = "staticAddrs";
    _fieldNames[4] = "staticBools";
    _fieldNames[5] = "u64";
    _fieldNames[6] = "str";
    _fieldNames[7] = "b";
    return ("Dynamics", _fieldNames);
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

  /** Get staticB32 */
  function getStaticB32(bytes32 key) internal view returns (bytes32[1] memory staticB32) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 0);
    return toStaticArray_bytes32_1(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get staticB32 (using the specified store) */
  function getStaticB32(IStore _store, bytes32 key) internal view returns (bytes32[1] memory staticB32) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 0);
    return toStaticArray_bytes32_1(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set staticB32 */
  function setStaticB32(bytes32 key, bytes32[1] memory staticB32) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 0, EncodeArray.encode(fromStaticArray_bytes32_1(staticB32)));
  }

  /** Set staticB32 (using the specified store) */
  function setStaticB32(IStore _store, bytes32 key, bytes32[1] memory staticB32) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 0, EncodeArray.encode(fromStaticArray_bytes32_1(staticB32)));
  }

  /** Push an element to staticB32 */
  function pushStaticB32(bytes32 key, bytes32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 0, abi.encodePacked((_element)));
  }

  /** Push an element to staticB32 (using the specified store) */
  function pushStaticB32(IStore _store, bytes32 key, bytes32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 0, abi.encodePacked((_element)));
  }

  /** Pop an element from staticB32 */
  function popStaticB32(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 0, 32);
  }

  /** Pop an element from staticB32 (using the specified store) */
  function popStaticB32(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 0, 32);
  }

  /** Update an element of staticB32 at `_index` */
  function updateStaticB32(bytes32 key, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 0, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of staticB32 (using the specified store) at `_index` */
  function updateStaticB32(IStore _store, bytes32 key, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 0, _index * 32, abi.encodePacked((_element)));
  }

  /** Get staticI32 */
  function getStaticI32(bytes32 key) internal view returns (int32[2] memory staticI32) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 1);
    return toStaticArray_int32_2(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_int32());
  }

  /** Get staticI32 (using the specified store) */
  function getStaticI32(IStore _store, bytes32 key) internal view returns (int32[2] memory staticI32) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 1);
    return toStaticArray_int32_2(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_int32());
  }

  /** Set staticI32 */
  function setStaticI32(bytes32 key, int32[2] memory staticI32) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 1, EncodeArray.encode(fromStaticArray_int32_2(staticI32)));
  }

  /** Set staticI32 (using the specified store) */
  function setStaticI32(IStore _store, bytes32 key, int32[2] memory staticI32) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 1, EncodeArray.encode(fromStaticArray_int32_2(staticI32)));
  }

  /** Push an element to staticI32 */
  function pushStaticI32(bytes32 key, int32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 1, abi.encodePacked((_element)));
  }

  /** Push an element to staticI32 (using the specified store) */
  function pushStaticI32(IStore _store, bytes32 key, int32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 1, abi.encodePacked((_element)));
  }

  /** Pop an element from staticI32 */
  function popStaticI32(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 1, 4);
  }

  /** Pop an element from staticI32 (using the specified store) */
  function popStaticI32(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 1, 4);
  }

  /** Update an element of staticI32 at `_index` */
  function updateStaticI32(bytes32 key, uint256 _index, int32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 1, _index * 4, abi.encodePacked((_element)));
  }

  /** Update an element of staticI32 (using the specified store) at `_index` */
  function updateStaticI32(IStore _store, bytes32 key, uint256 _index, int32 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 1, _index * 4, abi.encodePacked((_element)));
  }

  /** Get staticU128 */
  function getStaticU128(bytes32 key) internal view returns (uint128[3] memory staticU128) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 2);
    return toStaticArray_uint128_3(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint128());
  }

  /** Get staticU128 (using the specified store) */
  function getStaticU128(IStore _store, bytes32 key) internal view returns (uint128[3] memory staticU128) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 2);
    return toStaticArray_uint128_3(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint128());
  }

  /** Set staticU128 */
  function setStaticU128(bytes32 key, uint128[3] memory staticU128) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 2, EncodeArray.encode(fromStaticArray_uint128_3(staticU128)));
  }

  /** Set staticU128 (using the specified store) */
  function setStaticU128(IStore _store, bytes32 key, uint128[3] memory staticU128) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 2, EncodeArray.encode(fromStaticArray_uint128_3(staticU128)));
  }

  /** Push an element to staticU128 */
  function pushStaticU128(bytes32 key, uint128 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 2, abi.encodePacked((_element)));
  }

  /** Push an element to staticU128 (using the specified store) */
  function pushStaticU128(IStore _store, bytes32 key, uint128 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 2, abi.encodePacked((_element)));
  }

  /** Pop an element from staticU128 */
  function popStaticU128(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 2, 16);
  }

  /** Pop an element from staticU128 (using the specified store) */
  function popStaticU128(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 2, 16);
  }

  /** Update an element of staticU128 at `_index` */
  function updateStaticU128(bytes32 key, uint256 _index, uint128 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 2, _index * 16, abi.encodePacked((_element)));
  }

  /** Update an element of staticU128 (using the specified store) at `_index` */
  function updateStaticU128(IStore _store, bytes32 key, uint256 _index, uint128 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 2, _index * 16, abi.encodePacked((_element)));
  }

  /** Get staticAddrs */
  function getStaticAddrs(bytes32 key) internal view returns (address[4] memory staticAddrs) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 3);
    return toStaticArray_address_4(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Get staticAddrs (using the specified store) */
  function getStaticAddrs(IStore _store, bytes32 key) internal view returns (address[4] memory staticAddrs) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 3);
    return toStaticArray_address_4(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Set staticAddrs */
  function setStaticAddrs(bytes32 key, address[4] memory staticAddrs) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 3, EncodeArray.encode(fromStaticArray_address_4(staticAddrs)));
  }

  /** Set staticAddrs (using the specified store) */
  function setStaticAddrs(IStore _store, bytes32 key, address[4] memory staticAddrs) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 3, EncodeArray.encode(fromStaticArray_address_4(staticAddrs)));
  }

  /** Push an element to staticAddrs */
  function pushStaticAddrs(bytes32 key, address _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 3, abi.encodePacked((_element)));
  }

  /** Push an element to staticAddrs (using the specified store) */
  function pushStaticAddrs(IStore _store, bytes32 key, address _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 3, abi.encodePacked((_element)));
  }

  /** Pop an element from staticAddrs */
  function popStaticAddrs(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 3, 20);
  }

  /** Pop an element from staticAddrs (using the specified store) */
  function popStaticAddrs(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 3, 20);
  }

  /** Update an element of staticAddrs at `_index` */
  function updateStaticAddrs(bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 3, _index * 20, abi.encodePacked((_element)));
  }

  /** Update an element of staticAddrs (using the specified store) at `_index` */
  function updateStaticAddrs(IStore _store, bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 3, _index * 20, abi.encodePacked((_element)));
  }

  /** Get staticBools */
  function getStaticBools(bytes32 key) internal view returns (bool[5] memory staticBools) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 4);
    return toStaticArray_bool_5(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bool());
  }

  /** Get staticBools (using the specified store) */
  function getStaticBools(IStore _store, bytes32 key) internal view returns (bool[5] memory staticBools) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 4);
    return toStaticArray_bool_5(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bool());
  }

  /** Set staticBools */
  function setStaticBools(bytes32 key, bool[5] memory staticBools) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 4, EncodeArray.encode(fromStaticArray_bool_5(staticBools)));
  }

  /** Set staticBools (using the specified store) */
  function setStaticBools(IStore _store, bytes32 key, bool[5] memory staticBools) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 4, EncodeArray.encode(fromStaticArray_bool_5(staticBools)));
  }

  /** Push an element to staticBools */
  function pushStaticBools(bytes32 key, bool _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 4, abi.encodePacked((_element)));
  }

  /** Push an element to staticBools (using the specified store) */
  function pushStaticBools(IStore _store, bytes32 key, bool _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 4, abi.encodePacked((_element)));
  }

  /** Pop an element from staticBools */
  function popStaticBools(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 4, 1);
  }

  /** Pop an element from staticBools (using the specified store) */
  function popStaticBools(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 4, 1);
  }

  /** Update an element of staticBools at `_index` */
  function updateStaticBools(bytes32 key, uint256 _index, bool _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 4, _index * 1, abi.encodePacked((_element)));
  }

  /** Update an element of staticBools (using the specified store) at `_index` */
  function updateStaticBools(IStore _store, bytes32 key, uint256 _index, bool _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 4, _index * 1, abi.encodePacked((_element)));
  }

  /** Get u64 */
  function getU64(bytes32 key) internal view returns (uint64[] memory u64) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 5);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint64());
  }

  /** Get u64 (using the specified store) */
  function getU64(IStore _store, bytes32 key) internal view returns (uint64[] memory u64) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 5);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint64());
  }

  /** Set u64 */
  function setU64(bytes32 key, uint64[] memory u64) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 5, EncodeArray.encode((u64)));
  }

  /** Set u64 (using the specified store) */
  function setU64(IStore _store, bytes32 key, uint64[] memory u64) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 5, EncodeArray.encode((u64)));
  }

  /** Push an element to u64 */
  function pushU64(bytes32 key, uint64 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 5, abi.encodePacked((_element)));
  }

  /** Push an element to u64 (using the specified store) */
  function pushU64(IStore _store, bytes32 key, uint64 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 5, abi.encodePacked((_element)));
  }

  /** Pop an element from u64 */
  function popU64(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 5, 8);
  }

  /** Pop an element from u64 (using the specified store) */
  function popU64(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 5, 8);
  }

  /** Update an element of u64 at `_index` */
  function updateU64(bytes32 key, uint256 _index, uint64 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 5, _index * 8, abi.encodePacked((_element)));
  }

  /** Update an element of u64 (using the specified store) at `_index` */
  function updateU64(IStore _store, bytes32 key, uint256 _index, uint64 _element) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 5, _index * 8, abi.encodePacked((_element)));
  }

  /** Get str */
  function getStr(bytes32 key) internal view returns (string memory str) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 6);
    return (string(_blob));
  }

  /** Get str (using the specified store) */
  function getStr(IStore _store, bytes32 key) internal view returns (string memory str) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 6);
    return (string(_blob));
  }

  /** Set str */
  function setStr(bytes32 key, string memory str) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 6, bytes((str)));
  }

  /** Set str (using the specified store) */
  function setStr(IStore _store, bytes32 key, string memory str) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 6, bytes((str)));
  }

  /** Push a slice to str */
  function pushStr(bytes32 key, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 6, bytes((_slice)));
  }

  /** Push a slice to str (using the specified store) */
  function pushStr(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 6, bytes((_slice)));
  }

  /** Pop a slice from str */
  function popStr(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 6, 1);
  }

  /** Pop a slice from str (using the specified store) */
  function popStr(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 6, 1);
  }

  /** Update a slice of str at `_index` */
  function updateStr(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 6, _index * 1, bytes((_slice)));
  }

  /** Update a slice of str (using the specified store) at `_index` */
  function updateStr(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 6, _index * 1, bytes((_slice)));
  }

  /** Get b */
  function getB(bytes32 key) internal view returns (bytes memory b) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 7);
    return (bytes(_blob));
  }

  /** Get b (using the specified store) */
  function getB(IStore _store, bytes32 key) internal view returns (bytes memory b) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _primaryKeys, 7);
    return (bytes(_blob));
  }

  /** Set b */
  function setB(bytes32 key, bytes memory b) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _primaryKeys, 7, bytes((b)));
  }

  /** Set b (using the specified store) */
  function setB(IStore _store, bytes32 key, bytes memory b) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setField(_tableId, _primaryKeys, 7, bytes((b)));
  }

  /** Push a slice to b */
  function pushB(bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _primaryKeys, 7, bytes((_slice)));
  }

  /** Push a slice to b (using the specified store) */
  function pushB(IStore _store, bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.pushToField(_tableId, _primaryKeys, 7, bytes((_slice)));
  }

  /** Pop a slice from b */
  function popB(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _primaryKeys, 7, 1);
  }

  /** Pop a slice from b (using the specified store) */
  function popB(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.popFromField(_tableId, _primaryKeys, 7, 1);
  }

  /** Update a slice of b at `_index` */
  function updateB(bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _primaryKeys, 7, _index * 1, bytes((_slice)));
  }

  /** Update a slice of b (using the specified store) at `_index` */
  function updateB(IStore _store, bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.updateInField(_tableId, _primaryKeys, 7, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (DynamicsData memory _table) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (DynamicsData memory _table) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    bytes memory _blob = _store.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 key,
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools,
    uint64[] memory u64,
    string memory str,
    bytes memory b
  ) internal {
    bytes memory _data = encode(staticB32, staticI32, staticU128, staticAddrs, staticBools, u64, str, b);

    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 key,
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools,
    uint64[] memory u64,
    string memory str,
    bytes memory b
  ) internal {
    bytes memory _data = encode(staticB32, staticI32, staticU128, staticAddrs, staticBools, u64, str, b);

    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, DynamicsData memory _table) internal {
    set(
      key,
      _table.staticB32,
      _table.staticI32,
      _table.staticU128,
      _table.staticAddrs,
      _table.staticBools,
      _table.u64,
      _table.str,
      _table.b
    );
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, DynamicsData memory _table) internal {
    set(
      _store,
      key,
      _table.staticB32,
      _table.staticI32,
      _table.staticU128,
      _table.staticAddrs,
      _table.staticBools,
      _table.u64,
      _table.str,
      _table.b
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (DynamicsData memory _table) {
    // 0 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 0));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 0) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 32;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.staticB32 = toStaticArray_bytes32_1(SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.staticI32 = toStaticArray_int32_2(SliceLib.getSubslice(_blob, _start, _end).decodeArray_int32());

      _start = _end;
      _end += _encodedLengths.atIndex(2);
      _table.staticU128 = toStaticArray_uint128_3(SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint128());

      _start = _end;
      _end += _encodedLengths.atIndex(3);
      _table.staticAddrs = toStaticArray_address_4(SliceLib.getSubslice(_blob, _start, _end).decodeArray_address());

      _start = _end;
      _end += _encodedLengths.atIndex(4);
      _table.staticBools = toStaticArray_bool_5(SliceLib.getSubslice(_blob, _start, _end).decodeArray_bool());

      _start = _end;
      _end += _encodedLengths.atIndex(5);
      _table.u64 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint64());

      _start = _end;
      _end += _encodedLengths.atIndex(6);
      _table.str = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(7);
      _table.b = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    bytes32[1] memory staticB32,
    int32[2] memory staticI32,
    uint128[3] memory staticU128,
    address[4] memory staticAddrs,
    bool[5] memory staticBools,
    uint64[] memory u64,
    string memory str,
    bytes memory b
  ) internal view returns (bytes memory) {
    uint16[] memory _counters = new uint16[](8);
    _counters[0] = uint16(staticB32.length * 32);
    _counters[1] = uint16(staticI32.length * 4);
    _counters[2] = uint16(staticU128.length * 16);
    _counters[3] = uint16(staticAddrs.length * 20);
    _counters[4] = uint16(staticBools.length * 1);
    _counters[5] = uint16(u64.length * 8);
    _counters[6] = uint16(bytes(str).length);
    _counters[7] = uint16(bytes(b).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return
      abi.encodePacked(
        _encodedLengths.unwrap(),
        EncodeArray.encode(fromStaticArray_bytes32_1(staticB32)),
        EncodeArray.encode(fromStaticArray_int32_2(staticI32)),
        EncodeArray.encode(fromStaticArray_uint128_3(staticU128)),
        EncodeArray.encode(fromStaticArray_address_4(staticAddrs)),
        EncodeArray.encode(fromStaticArray_bool_5(staticBools)),
        EncodeArray.encode((u64)),
        bytes((str)),
        bytes((b))
      );
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory _primaryKeys) {
    _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    StoreSwitch.deleteRecord(_tableId, _primaryKeys);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((key));

    _store.deleteRecord(_tableId, _primaryKeys);
  }
}

function toStaticArray_bytes32_1(bytes32[] memory _value) pure returns (bytes32[1] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function toStaticArray_int32_2(int32[] memory _value) pure returns (int32[2] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function toStaticArray_uint128_3(uint128[] memory _value) pure returns (uint128[3] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function toStaticArray_address_4(address[] memory _value) pure returns (address[4] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function toStaticArray_bool_5(bool[] memory _value) pure returns (bool[5] memory _result) {
  // in memory static arrays are just dynamic arrays without the length byte
  assembly {
    _result := add(_value, 0x20)
  }
}

function fromStaticArray_bytes32_1(bytes32[1] memory _value) view returns (bytes32[] memory _result) {
  _result = new bytes32[](1);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 32);
}

function fromStaticArray_int32_2(int32[2] memory _value) view returns (int32[] memory _result) {
  _result = new int32[](2);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 64);
}

function fromStaticArray_uint128_3(uint128[3] memory _value) view returns (uint128[] memory _result) {
  _result = new uint128[](3);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 96);
}

function fromStaticArray_address_4(address[4] memory _value) view returns (address[] memory _result) {
  _result = new address[](4);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 128);
}

function fromStaticArray_bool_5(bool[5] memory _value) view returns (bool[] memory _result) {
  _result = new bool[](5);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 160);
}
