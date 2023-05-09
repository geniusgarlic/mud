/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type {
  IEphemeralRecordSystem,
  IEphemeralRecordSystemInterface,
} from "../IEphemeralRecordSystem";

const _abi = [
  {
    inputs: [
      {
        internalType: "bytes16",
        name: "namespace",
        type: "bytes16",
      },
      {
        internalType: "bytes16",
        name: "name",
        type: "bytes16",
      },
      {
        internalType: "bytes32[]",
        name: "key",
        type: "bytes32[]",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    name: "emitEphemeralRecord",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
] as const;

export class IEphemeralRecordSystem__factory {
  static readonly abi = _abi;
  static createInterface(): IEphemeralRecordSystemInterface {
    return new utils.Interface(_abi) as IEphemeralRecordSystemInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): IEphemeralRecordSystem {
    return new Contract(
      address,
      _abi,
      signerOrProvider
    ) as IEphemeralRecordSystem;
  }
}
