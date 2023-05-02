import { from } from "rxjs";
import { decodeEventLog, decodeFunctionData, toBytes } from "viem";
import { useObservableValue } from "@latticexyz/react";
import { TableId } from "@latticexyz/utils";
import { TransactionInfo, useStore } from "../useStore";
import { keyTupleToEntityID } from "@latticexyz/network/dev";

const serialize = (obj: any) =>
  JSON.stringify(obj, (key, value) => {
    if (typeof value === "bigint" || value instanceof BigInt) {
      return value.toString();
    }
    return value;
  });

type Props = TransactionInfo;

export function TransactionSummary({ hash, transaction, transactionReceipt }: Props) {
  const tx = useObservableValue(from(transaction));
  const txReceipt = useObservableValue(from(transactionReceipt));
  const worldAbi = useStore((state) => state.worldAbi);

  const functionData = worldAbi && tx?.input ? decodeFunctionData({ abi: worldAbi, data: tx.input }) : null;
  const events = worldAbi && txReceipt?.logs?.map((log) => decodeEventLog({ abi: worldAbi, ...log }));

  console.log("got tx", tx, txReceipt, events, functionData);
  return (
    <div className="p-2 border border-white/10 rounded font-mono">
      <div className="text-xs text-white/40">tx {hash}</div>
      <div className="text-blue-300">
        {functionData?.functionName}({functionData?.args?.map((value) => serialize(value))})
      </div>
      {events?.length ? (
        <div className="flex p-1 gap-2">
          <div className="flex-none text-lg font-bold text-blue-300">⤷</div>
          <div className="flex-1">
            <table className="w-full table-fixed">
              <thead className="bg-slate-800 text-amber-200/80 text-left">
                <tr>
                  <th className="font-semibold uppercase text-xs w-3/12">table</th>
                  <th className="font-semibold uppercase text-xs w-[1em]"></th>
                  <th className="font-semibold uppercase text-xs w-3/12">key</th>
                  <th className="font-semibold uppercase text-xs">value</th>
                </tr>
              </thead>
              <tbody className="font-mono text-xs">
                {events?.map(({ eventName, args }, i) => {
                  const table = TableId.fromBytes32(toBytes(args.table));
                  return (
                    <tr key={i}>
                      <td className="whitespace-nowrap overflow-hidden text-ellipsis">
                        {table.namespace}:{table.name}
                      </td>
                      <td className="whitespace-nowrap">
                        {eventName === "StoreSetRecord" ? <span className="text-green-500 font-bold">=</span> : null}
                        {eventName === "StoreSetField" ? <span className="text-green-500 font-bold">+</span> : null}
                        {eventName === "StoreDeleteRecord" ? <span className="text-red-500 font-bold">-</span> : null}
                      </td>
                      <td className="whitespace-nowrap overflow-hidden text-ellipsis">
                        {keyTupleToEntityID(args.key)}
                      </td>
                      <td className="whitespace-nowrap overflow-hidden text-ellipsis">{args.data}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </div>
      ) : null}
    </div>
  );
}
