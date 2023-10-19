import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-t", "--target", 
                    choices=["titi", "toto", "tata"])

args = parser.parse_args()
print(args.target)