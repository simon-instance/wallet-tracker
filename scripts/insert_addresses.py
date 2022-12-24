#!/usr/bin/python3

import sys, os.path, platform

from subprocess import call

if not os.path.isfile(sys.argv[1]):
    print("File does not exist, make sure the path to the file is correct.")
    exit()

if not sys.argv[1].endswith(".csv"):
    print("Wrong file type given.")
    exit()

print("sqlcmd -E -S localhost -v file=\"" + sys.argv[1] + "\" -i import.sql")