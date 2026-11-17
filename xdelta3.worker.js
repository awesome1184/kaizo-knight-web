/* Adapted from kotcrab/xdelta-wasm (Apache-2.0).
 * Runs the xdelta3 decoder in a worker and transfers output chunks to the page.
 */
import createXdelta3Module from "./xdelta3.js";

const BUFFER_SIZE = 4 * 1024 * 1024;
const CACHE_SIZE = 32;
const reader = new FileReaderSync();
let wasm = null;
let state = { sourceFile: null, patchFile: null, errorMessage: null };

function readFileIntoMemory(file, pointer, offset, length) {
  const end = Math.min(file.size, offset + length);
  if (offset >= file.size || end <= offset) return 0;
  const part = reader.readAsArrayBuffer(file.slice(offset, end));
  wasm.HEAP8.set(new Uint8Array(part), pointer);
  return end - offset;
}

function emitOutput(pointer, length) {
  const copy = new Uint8Array(wasm.HEAP8.buffer, pointer, Number(length)).slice();
  postMessage({ type: "chunk", bytes: copy.buffer }, [copy.buffer]);
}

function reportError(pointer) {
  state.errorMessage = wasm.UTF8ToString(pointer);
}

self.onmessage = async (event) => {
  const message = event.data || {};
  if (message.command !== "start") return;

  state.sourceFile = message.sourceFile;
  state.patchFile = message.patchFile;
  state.errorMessage = null;

  try {
    wasm = await createXdelta3Module();
    wasm.readSource = (pointer, offset, length) =>
      readFileIntoMemory(state.sourceFile, pointer, Number(offset), Number(length));
    wasm.readPatch = (pointer, offset, length) =>
      readFileIntoMemory(state.patchFile, pointer, Number(offset), Number(length));
    wasm.outputFile = emitOutput;
    wasm.reportError = reportError;

    const result = wasm.callMain([
      String(BUFFER_SIZE),
      String(CACHE_SIZE),
      message.disableChecksum ? "true" : "false"
    ]);

    postMessage({
      type: "done",
      ok: result === 0,
      errorMessage: state.errorMessage || (result === 0 ? "" : "xdelta returned " + result)
    });
  } catch (error) {
    postMessage({
      type: "done",
      ok: false,
      errorMessage: state.errorMessage || (error && error.message ? error.message : String(error))
    });
  } finally {
    wasm = null;
    state = { sourceFile: null, patchFile: null, errorMessage: null };
  }
};
