/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import type { BaseContract, Signer, utils } from "ethers";
import type { EventFragment } from "@ethersproject/abi";
import type { Listener, Provider } from "@ethersproject/providers";
import type {
  TypedEventFilter,
  TypedEvent,
  TypedListener,
  OnEvent,
} from "./common";

export interface StoreCoreInterface extends utils.Interface {
  functions: {};

  events: {
    "StoreDeleteRecord(bytes32,bytes32[])": EventFragment;
    "StoreEphemeralRecord(bytes32,bytes32[],bytes)": EventFragment;
    "StoreSetField(bytes32,bytes32[],uint8,bytes)": EventFragment;
    "StoreSetRecord(bytes32,bytes32[],bytes)": EventFragment;
  };

  getEvent(nameOrSignatureOrTopic: "StoreDeleteRecord"): EventFragment;
  getEvent(nameOrSignatureOrTopic: "StoreEphemeralRecord"): EventFragment;
  getEvent(nameOrSignatureOrTopic: "StoreSetField"): EventFragment;
  getEvent(nameOrSignatureOrTopic: "StoreSetRecord"): EventFragment;
}

export interface StoreDeleteRecordEventObject {
  tableId: string;
  key: string[];
}
export type StoreDeleteRecordEvent = TypedEvent<
  [string, string[]],
  StoreDeleteRecordEventObject
>;

export type StoreDeleteRecordEventFilter =
  TypedEventFilter<StoreDeleteRecordEvent>;

export interface StoreEphemeralRecordEventObject {
  table: string;
  key: string[];
  data: string;
}
export type StoreEphemeralRecordEvent = TypedEvent<
  [string, string[], string],
  StoreEphemeralRecordEventObject
>;

export type StoreEphemeralRecordEventFilter =
  TypedEventFilter<StoreEphemeralRecordEvent>;

export interface StoreSetFieldEventObject {
  tableId: string;
  key: string[];
  schemaIndex: number;
  data: string;
}
export type StoreSetFieldEvent = TypedEvent<
  [string, string[], number, string],
  StoreSetFieldEventObject
>;

export type StoreSetFieldEventFilter = TypedEventFilter<StoreSetFieldEvent>;

export interface StoreSetRecordEventObject {
  tableId: string;
  key: string[];
  data: string;
}
export type StoreSetRecordEvent = TypedEvent<
  [string, string[], string],
  StoreSetRecordEventObject
>;

export type StoreSetRecordEventFilter = TypedEventFilter<StoreSetRecordEvent>;

export interface StoreCore extends BaseContract {
  connect(signerOrProvider: Signer | Provider | string): this;
  attach(addressOrName: string): this;
  deployed(): Promise<this>;

  interface: StoreCoreInterface;

  queryFilter<TEvent extends TypedEvent>(
    event: TypedEventFilter<TEvent>,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TEvent>>;

  listeners<TEvent extends TypedEvent>(
    eventFilter?: TypedEventFilter<TEvent>
  ): Array<TypedListener<TEvent>>;
  listeners(eventName?: string): Array<Listener>;
  removeAllListeners<TEvent extends TypedEvent>(
    eventFilter: TypedEventFilter<TEvent>
  ): this;
  removeAllListeners(eventName?: string): this;
  off: OnEvent<this>;
  on: OnEvent<this>;
  once: OnEvent<this>;
  removeListener: OnEvent<this>;

  functions: {};

  callStatic: {};

  filters: {
    "StoreDeleteRecord(bytes32,bytes32[])"(
      tableId?: null,
      key?: null
    ): StoreDeleteRecordEventFilter;
    StoreDeleteRecord(tableId?: null, key?: null): StoreDeleteRecordEventFilter;

    "StoreEphemeralRecord(bytes32,bytes32[],bytes)"(
      table?: null,
      key?: null,
      data?: null
    ): StoreEphemeralRecordEventFilter;
    StoreEphemeralRecord(
      table?: null,
      key?: null,
      data?: null
    ): StoreEphemeralRecordEventFilter;

    "StoreSetField(bytes32,bytes32[],uint8,bytes)"(
      tableId?: null,
      key?: null,
      schemaIndex?: null,
      data?: null
    ): StoreSetFieldEventFilter;
    StoreSetField(
      tableId?: null,
      key?: null,
      schemaIndex?: null,
      data?: null
    ): StoreSetFieldEventFilter;

    "StoreSetRecord(bytes32,bytes32[],bytes)"(
      tableId?: null,
      key?: null,
      data?: null
    ): StoreSetRecordEventFilter;
    StoreSetRecord(
      tableId?: null,
      key?: null,
      data?: null
    ): StoreSetRecordEventFilter;
  };

  estimateGas: {};

  populateTransaction: {};
}
