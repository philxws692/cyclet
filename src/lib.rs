use typst_wasm_protocol::wasm_export;

const CRC32_ISO_HDLC: crc::Algorithm<u32> = crc::Algorithm {
    width: 32,
    poly: 0x04c11db7,
    init: 0xffffffff,
    refin: true,
    refout: true,
    xorout: 0xffffffff,
    check: 0xcbf43926,
    residue: 0xdebb20e3,
};

const CRC16_CCITT_FALSE: crc::Algorithm<u16> = crc::Algorithm {
    width: 16,
    poly: 0x1021,
    init: 0xffff,
    refin: false,
    refout: false,
    xorout: 0x0000,
    check: 0xE5CC,
    residue: 0x1D0F,
};

#[wasm_export(export_rename = "crc16-ccitt")]
fn crc16_ccitt(data: &[u8]) -> Result<Vec<u8>, String> {
    let crc = crc::Crc::<u16>::new(&CRC16_CCITT_FALSE);
    let mut checksum = crc.digest();
    checksum.update(data);

    Ok(checksum.finalize().to_be_bytes().to_vec())
}

#[wasm_export(export_rename = "crc32-iso-hdlc")]
fn crc32_iso_hdlc(data: &[u8]) -> Result<Vec<u8>, String> {
    let crc = crc::Crc::<u32>::new(&CRC32_ISO_HDLC);
    let mut checksum = crc.digest();
    checksum.update(data);

    Ok(checksum.finalize().to_be_bytes().to_vec())
}
