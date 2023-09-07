#!/usr/bin/env sh

EMULATOR_ID=$(xdotool search --name "Apple \]\[js - An Apple 2 Emulator in JavaScript - Chromium")
echo "Preparing xdotool send script"
echo "Emulator ID is $EMULATOR_ID"

./convertScriptToXdotool.py $EMULATOR_ID $1 > sendToEmulator.sh
