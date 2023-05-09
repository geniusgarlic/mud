import { TupleDatabaseClient, TupleRootTransactionApi } from "tuple-database";
import { FieldData, FullSchemaConfig, StoreConfig } from "@latticexyz/store";

type Config = StoreConfig;

// TODO: add mappings for remaining Solidity types
// TODO: move to schema-type
type AbiTypeToPrimitiveTypeLookup = {
  bytes32: `0x${string}`;
  uint256: bigint;
} & {
  [_ in FieldData<string>]: unknown;
};

type FieldTypeToPrimitiveType<T extends FieldData<string>> = AbiTypeToPrimitiveTypeLookup[T];

type SchemaToPrimitives<T extends FullSchemaConfig> = { [key in keyof T]: FieldTypeToPrimitiveType<T[key]> };

export type Tables<C extends Config> = {
  [key in keyof C["tables"]]: {
    keyTuple: SchemaToPrimitives<C["tables"][key]["primaryKeys"]>;
    value: SchemaToPrimitives<C["tables"][key]["schema"]>;
  };
};

export type Key<C extends Config, Table extends keyof Tables<C>> = Tables<C>[Table]["keyTuple"];
export type Value<C extends Config, Table extends keyof Tables<C>> = Tables<C>[Table]["value"];

export type DatabaseClient<C extends Config> = {
  [table in keyof C["tables"]]: {
    set: (key: Key<C, table>, value: Partial<Value<C, table>>) => TupleRootTransactionApi;
    get: (key: Key<C, table>) => Value<C, table>;
    remove: (key: Key<C, table>) => TupleRootTransactionApi;
  };
} & {
  _tupleDatabaseClient: TupleDatabaseClient;
};
