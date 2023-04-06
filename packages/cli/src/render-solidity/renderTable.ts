import {
  renderArguments,
  renderCommonData,
  renderList,
  renderedSolidityHeader,
  renderImports,
  renderTableId,
  renderWithStore,
} from "./common.js";
import { renderEncodeField, renderFieldMethods } from "./field.js";
import { renderRecordMethods } from "./record.js";
import { renderTypeHelpers } from "./renderTypeHelpers.js";
import { RenderTableDynamicField, RenderTableOptions } from "./types.js";

export function renderTable(options: RenderTableOptions) {
  const {
    imports,
    libraryName,
    structName,
    staticResourceData,
    fields,
    staticFields,
    dynamicFields,
    withRecordMethods,
    storeArgument,
    primaryKeys,
  } = options;

  const { _typedTableId, _typedKeyArgs, _primaryKeysDefinition } = renderCommonData(options);

  return `${renderedSolidityHeader}

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

${
  imports.length > 0
    ? `
      // Import user types
      ${renderImports(imports)}
    `
    : ""
}

${staticResourceData ? renderTableId(staticResourceData).tableIdDefinition : ""}

${
  !structName
    ? ""
    : `
      struct ${structName} {
        ${renderList(fields, ({ name, typeId }) => `${typeId} ${name};`)}
      }
`
}

library ${libraryName} {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](${fields.length});
    ${renderList(fields, ({ enumName }, index) => `_schema[${index}] = SchemaType.${enumName};`)}

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](${primaryKeys.length});
    ${renderList(primaryKeys, ({ enumName }, index) => `_schema[${index}] = SchemaType.${enumName};`)}

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](${fields.length});
    ${renderList(fields, (field, index) => `_fieldNames[${index}] = "${field.name}";`)}
    return ("${libraryName}", _fieldNames);
  }

  ${renderWithStore(
    storeArgument,
    (_typedStore, _store, _commentSuffix) => `
    /** Register the table's schema${_commentSuffix} */
    function registerSchema(${renderArguments([_typedStore, _typedTableId])}) internal {
      ${_store}.registerSchema(_tableId, getSchema(), getKeySchema());
    }
  `
  )}
  ${renderWithStore(
    storeArgument,
    (_typedStore, _store, _commentSuffix) => `
    /** Set the table's metadata${_commentSuffix} */
    function setMetadata(${renderArguments([_typedStore, _typedTableId])}) internal {
      (string memory _tableName, string[] memory _fieldNames) = getMetadata();
      ${_store}.setMetadata(_tableId, _tableName, _fieldNames);
    }
  `
  )}

  ${renderFieldMethods(options)}

  ${withRecordMethods ? renderRecordMethods(options) : ""}

  /** Tightly pack full data using this table's schema */
  function encode(${renderArguments(
    options.fields.map(({ name, typeWithLocation }) => `${typeWithLocation} ${name}`)
  )}) internal view returns (bytes memory) {
    ${renderEncodedLengths(dynamicFields)}
    return abi.encodePacked(${renderArguments([
      renderArguments(staticFields.map(({ name }) => name)),
      // TODO try gas optimization (preallocate for all, encodePacked statics, and direct encode dynamics)
      // (see https://github.com/latticexyz/mud/issues/444)
      ...(dynamicFields.length === 0
        ? []
        : ["_encodedLengths.unwrap()", renderArguments(dynamicFields.map((field) => renderEncodeField(field)))]),
    ])});
  }

  ${renderWithStore(
    storeArgument,
    (_typedStore, _store, _commentSuffix) => `
    /* Delete all data for given keys${_commentSuffix} */
    function deleteRecord(${renderArguments([_typedStore, _typedTableId, _typedKeyArgs])}) internal {
      ${_primaryKeysDefinition}
      ${_store}.deleteRecord(_tableId, _primaryKeys);
    }
  `
  )}
}

${renderTypeHelpers(options)}

`;
}

function renderEncodedLengths(dynamicFields: RenderTableDynamicField[]) {
  if (dynamicFields.length > 0) {
    return `
    uint16[] memory _counters = new uint16[](${dynamicFields.length});
    ${renderList(dynamicFields, ({ name, arrayElement }, index) => {
      if (arrayElement) {
        return `_counters[${index}] = uint16(${name}.length * ${arrayElement.staticByteLength});`;
      } else {
        return `_counters[${index}] = uint16(bytes(${name}).length);`;
      }
    })}
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);
    `;
  } else {
    return "";
  }
}
