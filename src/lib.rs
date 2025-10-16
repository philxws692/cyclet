use crc16::CCITT_FALSE;
use typst_wasm_protocol::wasm_export;

#[wasm_export(export_rename = "crc16-ccitt")]
fn crc16_ccitt(data: &[u8]) -> Result<Vec<u8>, String> {
    let mut crc = crc16::State::<CCITT_FALSE>::new();
    crc.update(data);
    Ok(crc.get().to_be_bytes().to_vec())
}