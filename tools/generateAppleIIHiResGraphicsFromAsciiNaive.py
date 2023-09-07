#!/usr/bin/env python

import argparse

def parse_file(input_file, output_file, xs, ys):
    with open(input_file, 'r') as f:
        lines = f.readlines()

    apple_basic_code = []
    apple_basic_code.append("HGR2")
    apple_basic_code.append("HCOLOR=3")

    num_rows = len(lines)
    num_columns = len(lines[0].rstrip('\n'))

    width_in_pixels = num_columns * xs
    height_in_pixels = num_rows * ys

    x_offset = (280 - width_in_pixels) // 2
    y_offset = (192 - height_in_pixels) // 2

    for y, line in enumerate(lines):
        line = line.rstrip('\n')
        inside_line = False
        start_x = 0

        for x, char in enumerate(line):
            if char == '#' and not inside_line:
                inside_line = True
                start_x = x
            elif char == ' ' and inside_line:
                for y_offset in range(ys):
                    apple_basic_code.append(f"HPLOT {start_x * xs + x_offset},{y * ys + y_offset + y_offset} TO {(x - 1) * xs + x_offset},{y * ys + y_offset + y_offset}")
                inside_line = False

            if inside_line and x == len(line) - 1:
                for y_offset in range(ys):
                    apple_basic_code.append(f"HPLOT {start_x * xs + x_offset},{y * ys + y_offset + y_offset} TO {x * xs + x_offset},{y * ys + y_offset + y_offset}")

            if char == '#' and (x == 0 or line[x - 1] == ' ') and (x == len(line) - 1 or line[x + 1] == ' '):
                for x_offset in range(xs):
                    for y_offset in range(ys):
                        apple_basic_code.append(f"HPLOT {x * xs + x_offset + x_offset},{y * ys + y_offset + y_offset} TO {x * xs + x_offset + x_offset},{y * ys + y_offset + y_offset}")

    with open(output_file, 'w') as f:
        for line in apple_basic_code:
            f.write(f"{line}\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert a pixel file to Apple Basic Code.")
    parser.add_argument('--input', default='mg.qrcode', help='Input file name')
    parser.add_argument('--output', default='mgQrcodeHiRes.a', help='Output file name')
    parser.add_argument('--xs', type=int, default=4, help='Width of each point in pixels')
    parser.add_argument('--ys', type=int, default=4, help='Height of each point in pixels')

    args = parser.parse_args()

    parse_file(args.input, args.output, args.xs, args.ys)

