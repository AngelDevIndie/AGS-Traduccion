

After #1330 we may store compiled scripts separate from the room files (*.crm), but then I realized that there will still be rooms with these scripts inside remaining in the ags3 game project. If we, for instance, begin to package scripts separately in the future, there will be redundant script data left inside these rooms.

So here comes the tool that deals with that, but I decided to make it more universal just in case.
(The blocks are searched all the same, so there's no difference)

crmpak - imports, exports or deletes chosen blocks from the compiled room file (*.crm).

Usage: crmpak [OPTIONS] [<in-room.crm> <COMMAND> [<CMD_OPTIONS>]]

Options:

    --tell-blockids - print a list of the known block ids;

Commands:

    -d <blockid> - delete: remove a block from the compiled room;
    -e <blockid> <file> - export: write a block into this file;
    -i <blockid> <file> - import/inject: add/replace a block with this file contents;
    -l - list: print id of all blocks found in the room;
    -x <blockid> <file> - extract: remove a block and save it in this file (export + delete);

Command Options:

    -w <out-room.crm> - for all commands but '-e': write the resulting room into a new file; otherwise will modify the input file;

Block IDs may be given both as numbers or their string aliases.

Examples:

crmpak room1.crm -x 7 room1.o
crmpak room1.crm -x CompScript3 room1.o

These two commands are equivalent, they extract a compiled script from the room1.crm, save it into room1.o, and then rewrite the room without it.

crmpak room1.crm -d CompScript3

Deletes the script from the room. NOTE: it's interesting that the engine won't complain of its abscence.

crmpak room1.crm -i CompScript3 newscript.o -w newroom.crm

Writes a new room as newroom.crm; it will have all content from room1.crm, but the script will be added/replaced from newscript.o.

**FUENTE:** https://github.com/adventuregamestudio/ags/pull/1378#issue-957418368
