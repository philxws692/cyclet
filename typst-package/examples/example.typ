#import "@preview/cyclet:0.1.0"

#let dict = dictionary(cyclet)
#(_ = dict.remove("bytes-to-hex"))

#set page(width: auto, height: auto)

= Preamble
```typ
#import "@preview/cyclet:0.1.0": *
```

#table(
    columns: 3,
    [Func], [Source], [Result],
    ..dict
        .values()
        .map(x => {
            let src = "bytes-to-hex(" + repr(x) + "(bytes(\"test\")))"
            (
                raw(repr(x)),
                raw(src),
                raw(eval(src, scope: dictionary(cyclet))),
            )
        })
        .flatten()
)