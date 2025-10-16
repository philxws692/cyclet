use crc16::CCITT_FALSE;
use typst_wasm_protocol::wasm_export;

const CRC32_ISO_HDLC: crc::Algorithm<u32> = crc::Algorithm {
    width: 32,
    poly: 0x04c11db7,
    init: 0xffffffff,
    refin: true,
    refout: true,
    xorout: 0xffffffff,
    check: 0xcbf43926,
    residue: 0xdebb20e3
};

#[wasm_export(export_rename = "crc16-ccitt")]
fn crc16_ccitt(data: &[u8]) -> Result<Vec<u8>, String> {
    let mut crc = crc16::State::<CCITT_FALSE>::new();
    crc.update(data);
    Ok(crc.get().to_be_bytes().to_vec())
}

#[wasm_export(export_rename = "crc32-iso-hdlc")]
fn crc32_iso_hdlc(data: &[u8]) -> Result<Vec<u8>, String> {
    let crc = crc::Crc::<u32>::new(&CRC32_ISO_HDLC);
    let mut checksum = crc.digest();
    checksum.update(data);

    Ok(checksum.finalize().to_be_bytes().to_vec())
}