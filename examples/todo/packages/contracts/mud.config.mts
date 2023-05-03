import { mudConfig } from "@latticexyz/config";

export default mudConfig({
  tables: {
    TodoItem: {
      schema: {
        completed: "bool",
        body: "string",
      },
    },
    Owned: {
      schema: {
        owner: "bytes32",
      },
    }
  },
});
