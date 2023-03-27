import { z } from "zod";
import { EthereumAddress, ObjectName, Selector } from "../commonSchemas.js";
import { DynamicResolutionType } from "../dynamicResolution.js";

const SystemName = ObjectName;
const ModuleName = ObjectName;
const SystemAccessList = z.array(SystemName.or(EthereumAddress)).default([]);

// The system config is a combination of a fileSelector config and access config
const SystemConfig = z.intersection(
  z.object({
    fileSelector: Selector,
    registerFunctionSelectors: z.boolean().default(true),
  }),
  z.discriminatedUnion("openAccess", [
    z.object({
      openAccess: z.literal(true),
    }),
    z.object({
      openAccess: z.literal(false),
      accessList: SystemAccessList,
    }),
  ])
);

const ValueWithType = z.object({
  value: z.union([z.string(), z.number(), z.instanceof(Uint8Array)]),
  type: z.string(),
});
const DynamicResolution = z.object({ type: z.nativeEnum(DynamicResolutionType), input: z.string() });

const ModuleConfig = z.object({
  name: ModuleName,
  root: z.boolean().default(false),
  args: z.array(z.union([ValueWithType, DynamicResolution])).default([]),
});

// The parsed world config is the result of parsing the user config
export const WorldConfig = z.object({
  namespace: Selector.default(""),
  worldContractName: z.string().optional(),
  overrideSystems: z.record(SystemName, SystemConfig).default({}),
  excludeSystems: z.array(SystemName).default([]),
  postDeployScript: z.string().default("PostDeploy"),
  deploymentInfoDirectory: z.string().default("."),
  worldgenDirectory: z.string().default("world"),
  worldImportPath: z.string().default("@latticexyz/world/src/"),
  modules: z.array(ModuleConfig).default([]),
});

export async function parseWorldConfig(config: unknown) {
  return WorldConfig.parse(config);
}

export type ParsedWorldConfig = z.output<typeof WorldConfig>;
