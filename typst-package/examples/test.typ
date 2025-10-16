#import "@preview/cyclet:0.1.0": bytes-to-hex, crc16-ccitt

#let test-case-data = bytes(
    lorem(25)
)

#lorem(25)

#let test-crc16-ccitt() = {
    assert(bytes-to-hex(crc16-ccitt(test-case-data)) == "e304")
}
