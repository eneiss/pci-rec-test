from art import tprint
from sys import argv

tprint(argv[1] if len(argv) > 1 else "No input :(")
