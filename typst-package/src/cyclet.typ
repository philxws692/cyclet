
#let p = plugin("cyclet.wasm")

#let crc16-ccitt = p.crc16-ccitt

#let bytes-to-hex(bytes, upper: false) = {
  let res = array(bytes)
      .map(byte => {
        let s = str(byte, base: 16)

        let padded = if s.len() == 1 {
          "0" + s
        } else {
          s
        }

        return if upper {
          std.upper(padded)
        } else {
          padded
        }
      })
      .join()

  return res
}