#!/usr/bin/python

import argparse
import sys
from subprocess import call 
from subprocess import check_output

# THIS IS A TEMPLATE. DELETE THIS LINE AND ANY OTHER YOU WON'T USE.

########################################
# Configure here the script parameters #
########################################

parser = argparse.ArgumentParser(description='This script does some nice stuff.',epilog='script by Paulo Amaral (@paulo_dev/github.com/paulera)')
parser.add_argument('inputfile',                       help='Input file',       type=argparse.FileType('r'), default=sys.stdin)
parser.add_argument('-o', '--output', dest='myFile',   help='Output file',      type=argparse.FileType('w'), default=sys.stdout)
parser.add_argument('-f', '--flag',   dest='flag',     help='This is a flag',   action='store_true')
parser.add_argument('-s', '--string', dest='myStr',    help='A String value',   type=str);
parser.add_argument('-i', '--integer', dest='myInt',   help='An integer value', type=int);
args = parser.parse_args()
# Extra options for parameters:
# required=True
# default="the default value"


#########################################
# Write in runScript() the script logic #
#########################################

def runScript():

	print ("input = " + args.inputfile.name);
	if (args.myFile is not None): print ("output = " + args.myFile.name);
	if args.flag == True:
		print ("The flag is on")
	else:
		print ("The flag is off")

	if (args.myStr != None): print ("myString = " + args.myStr);
	if (args.myInt): print ("myInteger = " + str(args.myInt))

	print ('--------------------------------------------------')

	# run command and output to terminal
	call('ls -l', shell = True)

	print ('--------------------------------------------------')

	result = check_output('ls -l -a | grep i', shell=True);
	print ('The result is')
	print (result)

	print ('--------------------------------------------------')

	result2 = check_output(['ls','-1']).splitlines()

	print ('FOR')
	for i in range(len(result2)):
		print ('line ' + str(i) + ': ' + result2[i])

	print ('\nFOREACH')
	for line in result2:
		print ("line -> " + line)

	print ('--------------------------------------------------')

	print 'This is some {RED}red text{END}!'.format(**colors)
	print 'This {GREEN}text{END} is {GREEN}green{END} again!'.format(**colors)

# ---------------------------------------------------------------------------------
# SCRIPT BOOTSTRAP

colors = {
	'DBLACK':'\033[30m','DRED':'\033[31m','DGREEN':'\033[32m','DYELLOW':'\033[33m','DBLUE':'\033[34m','DMAGENTA':'\033[35m','DCYAN':'\033[36m','DWHITE':'\033[37m',
	'BLACK':'\033[90m','RED':'\033[91m','GREEN':'\033[92m','YELLOW':'\033[93m','BLUE':'\033[94m','MAGENTA':'\033[95m','CYAN':'\033[96m','WHITE':'\033[97m',
	'BGDBLACK':'\033[40m','BGDRED':'\033[41m','BGDGREEN':'\033[42m','BGDYELLOW':'\033[43m','BGDBLUE':'\033[44m','BGDMAGENTA':'\033[45m','BGDCYAN':'\033[46m','BGDWHITE':'\033[47m',
	'BGBLACK':'\033[100m','BGRED':'\033[101m','BGGREEN':'\033[102m','BGYELLOW':'\033[103m','BGBLUE':'\033[104m','BGMAGENTA':'\033[105m','BGCYAN':'\033[106m','BGWHITE':'\033[107m',
	'FGEND':'\033[39m','BGEND':'\033[49m','END':'\033[0m',
	'BRIGHT':'\033[1m','DIM':'\033[2m','NORMAL':'\033[22m',
}

runScript()
