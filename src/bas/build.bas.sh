#!/bin/sh

alias acmd='docker run -v $(pwd):/workdir ac'

# Function to print usage information
usage() {
    echo "Usage: $0 <source_file_path> [disk_name]"
    exit 1
}

# Check for at least one argument
if [ "$#" -lt 1 ]; then
    usage
fi

# Define source file and disk name
SOURCE_FILE=$1
if [ "$#" -eq 2 ]; then
    DISK_NAME=$2
else
    DISK_NAME=$(basename "$SOURCE_FILE" | sed 's/\(.*\)\..*/\1/')
fi
DISK_NAME_WITH_PATH="disks/${DISK_NAME}.dsk"
PROG_NAME=$(basename "$SOURCE_FILE" .bas)

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file does not exist: $SOURCE_FILE"
    exit 1
fi

# Check if disk file exists
if [ -f "$DISK_NAME_WITH_PATH" ]; then
    echo "Disk already exists: $DISK_NAME_WITH_PATH"
    read -p "Do you want to [c]reate new, [a]dd to existing, or [q]uit? " ACTION

    case "$ACTION" in
        [Cc]*)
            echo "Deleting existing disk: $DISK_NAME_WITH_PATH"
            rm -f "$DISK_NAME_WITH_PATH"
            ;;
        [Aa]*)
            echo "Appending to existing disk: $DISK_NAME_WITH_PATH"
            ;;
        [Qq]*)
            echo "Aborting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Aborting."
            exit 1
            ;;
    esac
fi

# Create new disk if it doesn't exist
if [ ! -f "$DISK_NAME_WITH_PATH" ]; then
    echo "Creating new disk: $DISK_NAME_WITH_PATH"
    echo acmd ac -dos140 "$DISK_NAME_WITH_PATH"
    acmd ac -dos140 "$DISK_NAME_WITH_PATH"
fi

# Add source file to disk
echo "Adding source file to disk..."
echo acmd ac -bas "$DISK_NAME_WITH_PATH" "$PROG_NAME"
cat "$SOURCE_FILE"
#writeToDiskCommand="cat $SOURCE_FILE | /usr/local/bin/ac -bas $DISK_NAME_WITH_PATH $PROG_NAME"
#writeToDiskCommand="/bin/sh -c '$writeToDiskCommand'"
#echo acmd $writeToDiskCommand
#acmd $writeToDiskCommand

writeToDiskCommand="cat $SOURCE_FILE | /usr/local/bin/ac -bas $DISK_NAME_WITH_PATH $PROG_NAME"
echo acmd "/bin/sh" "-c" "$writeToDiskCommand"
acmd "/bin/sh" "-c" "$writeToDiskCommand"


# Print disk info
echo "Disk Info:"
acmd ac -i "$DISK_NAME_WITH_PATH"
acmd ac -l "$DISK_NAME_WITH_PATH"

