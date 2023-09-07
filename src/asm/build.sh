#!/bin/sh

# Check if at least the source code file is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 source_file [destination_dsk]"
    exit 1
fi

# Extract the base filename from the source code file
BASENAME=$(basename "$1" .s)

# Assemble the source code
ca65 "$1" -o "${BASENAME}.o" || {
    echo "Assembling failed."
    exit 1
}

# Link the object code
ld65  -C apple2Custom.cfg -o "${BASENAME}" "${BASENAME}.o"|| {
    echo "Linking failed."
    exit 1
}

# Determine the destination .dsk file
DEST_DSK=${2:-"./disks/atelier.dsk"}

alias acmd='docker run -v $(pwd)/../../../:/workdir ac'
# Pack the binary into the .dsk file
writeToDiskCommand="/usr/local/bin/ac -p ${DEST_DSK} ${BASENAME} BIN 0x0300 < ./src/asm/${BASENAME}/$1"
echo acmd "/bin/sh" "-c" "$writeToDiskCommand"

acmd "/bin/sh" "-c" "$writeToDiskCommand" || {
    echo "Packing failed."
    exit 1
}

echo "Build successful. ${BASENAME} has been packed into ${DEST_DSK}"

