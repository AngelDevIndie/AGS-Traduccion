crmpak - imports, exports or deletes chosen blocks from the compiled room file (*.crm).

Usage: `crmpak <in-room.crm> <COMMAND> [<OPTIONS>]`
Commands:
* `-d <blockid>` -  delete: remove a block from the compiled room;
* `-e <blockid> <file>` - export: write a block into this file;
* `-i <blockid> <file>` - import/inject: add/replace a block with this file contents;
* `-x <blockid> <file>` - extract: remove a block and save it in this file (export + delete);

Options:
* `-w <out-room.crm>` - for all commands but '-e': write the resulting room into a new file; otherwise will modify the input file;
