#import "../../src/lib.typ": *

#let test-case-data = bytes("justasimpleteststringtotestallthosecrcs")

// Just value checks
#assert(bytes-to-hex(crc8-bluetooth(test-case-data)) == lower("08"))
#assert(bytes-to-hex(crc16-ccitt(test-case-data)) == "6576")
#assert(bytes-to-hex(crc32-iso-hdlc(test-case-data)) == lower("1E2D17EE"))

= CRC8-Bluetooth
0x#bytes-to-hex(crc8-bluetooth(test-case-data))

= CRC16-CCITT
0x#bytes-to-hex(crc16-ccitt(test-case-data))

= CRC32-ISO-HDLC
0x#bytes-to-hex(crc32-iso-hdlc(test-case-data))