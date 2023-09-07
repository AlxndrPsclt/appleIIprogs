#!/usr/bin/env python

def parse_file(file_name):
    with open(file_name, 'r') as f:
        lines = f.readlines()

    apple_basic_code = []
    apple_basic_code.append("GR")
    apple_basic_code.append("COLOR=1")

    for y, line in enumerate(lines):
        line = line.rstrip('\n')
        inside_line = False
        start_x = 0

        for x, char in enumerate(line):
            if char == '#' and not inside_line:
                inside_line = True
                start_x = x
            elif char == ' ' and inside_line:
                apple_basic_code.append(f"HLIN {start_x},{x - 1} AT {y}")
                inside_line = False

            # Catch lines that end with a '#' without a trailing space
            if inside_line and x == len(line) - 1:
                apple_basic_code.append(f"HLIN {start_x},{x} AT {y}")

            # Catch solitary points
            if char == '#' and (x == 0 or line[x - 1] == ' ') and (x == len(line) - 1 or line[x + 1] == ' '):
                apple_basic_code.append(f"PLOT {x},{y}")

    with open("apple_basic_output.txt", 'w') as f:
        for line in apple_basic_code:
            f.write(f"{line}\n")


if __name__ == "__main__":
    parse_file("mg.qrcode")

