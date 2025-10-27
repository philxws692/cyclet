#import "@preview/cyclet:0.1.0": bytes-to-hex, crc8-bluetooth, crc16-ccitt, crc32-iso-hdlc

#let test-case-data = bytes("justasimpleteststringtotestallthosecrcs")

#let test-crc-8-bluetooth() = {
    assert(bytes-to-hex(crc8-bluetooth(test-case-data)) == lower("08"))
}

#let test-crc16-ccitt() = {
    assert(bytes-to-hex(crc16-ccitt(test-case-data)) == "6576")
}

#let test-crc32-iso-hdlc() = {
    assert(bytes-to-hex(crc32-iso-hdlc(test-case-data)) == lower("1E2D17EE"))
}

