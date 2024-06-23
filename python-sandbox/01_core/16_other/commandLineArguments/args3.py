#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import sys, getopt


def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv, "hi:o:", ["ifile=", "ofile="])
        print()
    except getopt.GetoptError:
        print('test.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('test.py -i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    print('Input file is "', inputfile)
    print('Output file is "', outputfile)


if __name__ == "__main__":
    main(sys.argv[1:])

# args3.py -h
# usage: test.py -i <inputfile> -o <outputfile>
# $ test.py -i BMP -o
# usage: test.py -i <inputfile> -o <outputfile>
# $ test.py -i inputfile -o outputfile
# Input file is " inputfile
# Output file is " outputfile
