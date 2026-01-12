# 16-bit Addressing scheme

 0x1234:0x5678
segment:offset

Each segment contains 64kb of memory, where each byte can be accessed using the offset value

Segments overlap every 16 bytes, which allows multiple combinations of segment:offset to reach the same address

`real_address = segment * 16 + offset`

i.e. for the start of the operating system:

```
0x0000:0x7C00 = 0x7C00
0x0001:0x7BF0 = 0x7C00
0x0002:0x7BE0 = 0x7C00
...
0x07C0:0x0000 = 0x7C00
```

## Mem segmentation

* CS currently running code segment
* DS data segment
* SS stack segment
* ES, FS, GS extra (data) segments
