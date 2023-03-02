export const hexToArray = (hex: string): Uint8Array => {
  if (!/^(0x)?([\da-f]{2})*$/i.test(hex)) {
    console.error("Invalid hex string", hex);
    throw new Error("Invalid hex string");
  }
  const bytes = hex.match(/[\da-f]{2}/gi);
  if (!bytes) return new Uint8Array([]);
  return new Uint8Array(bytes.map((byte) => parseInt(byte, 16)));
};
