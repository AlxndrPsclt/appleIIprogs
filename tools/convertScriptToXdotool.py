#!/usr/bin/env python

import sys

def text_to_xdotool(window_id, file_name):
    print(f'#!/usr/bin/env sh')
    print(f'sleep 5')
    lineCount=0

    print(f'xdotool key --window {window_id} Return')
    print(f'sleep 0.1')
    for c in str("NEW"):
        print(f'xdotool key --window {window_id} {c}')
        print(f'sleep 0.1')
    print(f'xdotool key --window {window_id} Return')
    print(f'sleep 0.1')
    print(f'xdotool key --window {window_id} Return')
    print(f'sleep 0.1')

    with open(file_name, 'r') as file:
        for line in file:
            lineCount+=10
            for c in str(lineCount):
                print(f'xdotool key --window {window_id} {c}')
                print(f'sleep 0.1')
            print(f'xdotool key --window {window_id} space')
            print(f'sleep 0.1')
            for char in line:
                if char == '\n':
                    print(f'xdotool key --window {window_id} Return')
                elif char == ' ':
                    print(f'xdotool key --window {window_id} space')
                elif char == '(':
                    print(f'xdotool key --window {window_id} parenleft')
                elif char == ')':
                    print(f'xdotool key --window {window_id} parenright')
                elif char == '#':
                    print(f'xdotool key --window {window_id} numbersign')
                elif char == '$':
                    print(f'xdotool key --window {window_id} dollar')
                elif char == '_':
                    print(f'xdotool key --window {window_id} underscore')
                elif char == '"':
                    print(f'xdotool key --window {window_id} quotedbl')
                elif char == '=':
                    print(f'xdotool key --window {window_id} equal')
                elif char == '>':
                    print(f'xdotool key --window {window_id} greater')
                elif char == '<':
                    print(f'xdotool key --window {window_id} less')
                elif char == '+':
                    print(f'xdotool key --window {window_id} plus')
                elif char == '-':
                    print(f'xdotool key --window {window_id} minus')
                elif char == '*':
                    print(f'xdotool key --window {window_id} asterisk')
                elif char == '/':
                    print(f'xdotool key --window {window_id} slash')
                elif char == ',':
                    print(f'xdotool key --window {window_id} comma')
                elif char == ':':
                    print(f'xdotool key --window {window_id} colon')
                elif char == '.':
                    print(f'xdotool key --window {window_id} period')
                elif char == '!':
                    print(f'xdotool key --window {window_id} exclam')
                elif char == '?':
                    print(f'xdotool key --window {window_id} question')
                elif char == ';':
                    print(f'xdotool key --window {window_id} semicolon')
                elif char.isalnum():
                    print(f'xdotool key --window {window_id} {char}')
                    print(f'echo {char}')
                else:
                    print(f"# Skipping unsupported character: {char}")
                print(f'sleep 0.005')

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python script.py <window_id> <file_name>")
    else:
        text_to_xdotool(sys.argv[1], sys.argv[2])

