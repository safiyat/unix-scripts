import sys

input_file = sys.argv[1]
if len(sys.argv) > 2:
    output_file = sys.argv[2]
else:
    output_file = None

uniq_lines = []
with open(input_file, 'rU') as fp:
    for line in fp:
        if line not in uniq_lines:
            uniq_lines.append(line)

if output_file:
    with open(output_file, 'w') as fp:
        fp.write(''.join(uniq_lines))
else:
    print ''.join(uniq_lines)
