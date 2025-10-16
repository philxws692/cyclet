# cyclet
The blazingly fast cyclic redundancy check calculator package for Typst

# Usage
```typst
#import "@preview/cyclet:0.1.0": *

#let data = bytes("Hello, World")
#let crc = crc16-ccitt(data)

CRC16-CCITT Value for "Hello World": #bytes-to-hex(crc16, upper: true)

```