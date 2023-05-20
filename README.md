# KIMtalk

[Another Old VCR Jam!](https://oldvcr.blogspot.com/2023/05/the-kim-1-that-sounds-like-stephen.html)

Copyright (C) 2023 Cameron Kaiser.  
All rights reserved.  
BSD license.

## What it is

KIMtalk is a demonstration of a 9600 baud serial transmission routine for the MOS KIM-1 (later Commodore KIM-1), the first system to use the venerable MOS 6502 CPU, with one kilobyte of RAM (actually 1152) running at a clockspeed of 1MHz. While the KIM-1 has serial support routines for communicating with a teletype, it does not reliably do so at higher baud rates.

This demonstration can send strings to a classic DECtalk or DECtalk Express, DEC's two standalone hardware speech synthesizers, at a full (and for the Express, the only) supported rate of 9600bps -- something the regular KIM-1 can't do. With this demonstration, your KIM-1 can talk through the DECtalk.

[Hear for yourself](https://oldvcr.blogspot.com/2023/05/the-kim-1-that-sounds-like-stephen.html); we uploaded three video clips.

## How to build

You will need a real KIM-1 with some sort of TTY interface such as Bob Applegate/CorshamTech's KIM I/O card. It will fit into the base 1K of RAM. To hear speech, you'll need a real DECtalk or DECtalk Express, or something that emulates such a device over the serial connection at 9600 baud.

1. Install [KIMup](https://github.com/classilla/kimup) to send files to your KIM-1 over your serial interface.
2. Install [`xa65`](http://www.floodgap.com/retrotech/xa65/), a 6502 cross-assembler. Many Unix distros offer it as a package.
3. (Optional) Ensure `minicom` is on your system as a test.
4. To see the sequences in `minicom`, do `make test`. Otherwise, `make` or `make run` will assemble and upload it to your KIM with KIMup, and automatically start the program.
5. Very carefully, switch the serial connection to your DECtalk device (or leave it connected, if you did `make test`) and start pressing keys on the keypad. Strings will either appear or be spoken.

## How to use

You can change the strings in `words.xa`. If you need to relocate it in memory for more space, you'll need to change `talker.xa` to point to the new location.

If you want to use the 9600bps string sender, you just call it with the zero-page pointer pointing to a string ending with the high bit set. After it reaches that character, it will send a comma and a line feed to force the DECtalk to speak. If you are using the routine as a general byte sender, you'll probably want to remove that code and alter the calling convention to send some sort of length (such as in A, X or Y). The string sender just fits into the 102 bytes of free RAM at `$1780`; you may need to change the starting address (and therefore `talker.xa`) to make it a longer routine or you will stomp on the KIM's system vectors.

In `misc/` are a couple example bitbang routines that may be more applicable to general programs. They are KIM-specific, but easy to modify. [See the blog post for what these do.](https://oldvcr.blogspot.com/2023/05/the-kim-1-that-sounds-like-stephen.html)

## Bug fixes only

Code refactors are not accepted (fork the project). New features are not accepted (fork the project). Bug fixes will be accepted as long as they don't include code refactors or new features (seriously, fork the project, this is a toy).

## License

BSD 2-clause.
