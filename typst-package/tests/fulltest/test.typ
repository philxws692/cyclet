#import "../../src/lib.typ": *

#let test-case-data = bytes("justasimpleteststringtotestallthosecrcs")

= CRC8-Bluetooth
0x#bytes-to-hex(crc8-bluetooth(test-case-data))

= CRC16-CCITT
0x#bytes-to-hex(crc16-ccitt(test-case-data))

= CRC32-ISO-HDLC
0x#bytes-to-hex(crc32-iso-hdlc(test-case-data))