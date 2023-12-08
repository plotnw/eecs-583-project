#!/bin/python3

import subprocess
import sys
from pathlib import Path

OPT=["-Os", "-fno-vectorize", "-fno-slp-vectorize", "-fno-unroll-loops"]

LLPATH="../../build/release/bin/"

CC=LLPATH +"clang"
LLOPT=LLPATH+"opt"
OBJDUMP="objdump -M intel "

def build(filename : str):
    path = Path(filename).stem
    path = path + ".ll"
    subprocess.run([CC, filename] + OPT + ["-emit-llvm", "-S", "-o", path])
    
def rolag(filename : str):
    path = Path(filename).stem
    patho = path + ".rolled.ll"
    pathlog = path + ".rolled.log"
    output = subprocess.run([LLOPT, "-loop-rolling", "-simplifycfg", "-loop-simplify", "-loop-flatten", "-licm", filename, "-o", patho], capture_output=True)
    print(output.stdout.decode('ascii'))
    with open(pathlog, 'wb') as f:
        f.write(output.stderr)

def rocfg(filename : str):
    path = Path(filename).stem
    patho = path + ".rollcfg.ll"
    pathlog = path + ".rollcfg.log"
    output = subprocess.run([LLOPT, "-loop-rolling-cfg", "-simplifycfg", "-loop-simplify", "-loop-flatten", "-licm", filename, "-o", patho], capture_output=True)
    print(output.stdout.decode('ascii'))
    print(output.stderr.decode('ascii'))
    with open(pathlog, 'wb') as f:
        f.write(output.stderr)

def pdf(filename: str, f: str):
    path = Path(filename).stem
    patho = "cfg-graphs/" + path + "." + f + ".dot"
    output = subprocess.run([LLOPT, "-dot-cfg", filename], capture_output=True)
    dotpathdot = "cfg-graphs/" + path + "." + f + ".dot"
    dotpathpdf = "cfg-graphs/" + path + "." + f + ".pdf"
    output = subprocess.run(["mv ." + f + ".dot " + dotpathdot], shell=True)
    output = subprocess.run(["dot", "-Tpdf", dotpathdot, "-o", dotpathpdf])
    output = subprocess.run(["rm " + dotpathdot], shell=True)
    output = subprocess.run(["rm .*.dot"], shell=True)



if (sys.argv[1] == "build"):
    build(sys.argv[2])
elif (sys.argv[1] == "rolag"):
    rolag(sys.argv[2])
elif (sys.argv[1] == "rocfg"):
    rocfg(sys.argv[2])
elif (sys.argv[1] == "dot"):
    pdf(sys.argv[2], sys.argv[3])
'''
build-roll FILECC:
    #!/usr/bin/env bash
    FILE="{{FILECC}}"
    FILENAME=${$FILE%.*}
    {{LLOPT}} -loop-rolling-cfg -simplifycfg -loop-simplify -loop-flatten -licm $FILENAME.ll -o $FILENAME.rolled.ll -S 2>$FILENAME.rolled.log


#${CC} tsvc.original.c ${OPT} -emit-llvm -S -o tsvc.original.ll
#${CC} tsvc.unrolled.c ${OPT} -emit-llvm -S -o tsvc.unrolled.ll

#${LLOPT} -loop-reroll tsvc.unrolled.ll -o tsvc.reroll.ll -S 2>tsvc.reroll.txt
#${LLOPT} -loop-rolling -simplifycfg -loop-simplify -loop-flatten -licm tsvc.unrolled.ll -o tsvc.rolled.ll -S 2>tsvc.rolled.txt

#${CC} -x ir tsvc.original.ll ${OPT} -c -o tsvc.oracle.o
#${CC} -x ir tsvc.unrolled.ll ${OPT} -c -o tsvc.baseline.o
#${CC} -x ir tsvc.reroll.ll ${OPT} -c -o tsvc.reroll.o
#${CC} -x ir tsvc.rolled.ll ${OPT} -c -o tsvc.rolled.o

#${OBJDUMP} -d tsvc.oracle.o > tsvc.oracle.dump
#${OBJDUMP} -d tsvc.baseline.o > tsvc.baseline.dump
#${OBJDUMP} -d tsvc.reroll.o > tsvc.reroll.dump
#${OBJDUMP} -d tsvc.rolled.o > tsvc.rolled.dump

#:>tsvc.csv
#python3 extract.py oracle tsvc.oracle.dump >> tsvc.csv
#python3 extract.py baseline tsvc.baseline.dump >> tsvc.csv
#python3 extract.py reroll tsvc.reroll.dump >> tsvc.csv
#python3 extract.py rolled tsvc.rolled.dump >> tsvc.csv

#${CC} tsvc.oracle.o common.c dummy.c ${OPT} -o tsvc.oracle -lm 
#${CC} tsvc.baseline.o common.c dummy.c ${OPT} -o tsvc.baseline -lm 
#${CC} tsvc.reroll.o common.c dummy.c ${OPT} -o tsvc.reroll -lm
#${CC} tsvc.rolled.o common.c dummy.c  ${OPT} -o tsvc.rolled -lm
'''
