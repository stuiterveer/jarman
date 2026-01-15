#!/bin/python3
import os
import sys

if len(sys.argv) < 2:
    exit(1)

print(sys.stdin.read().split(sys.argv[1])[int(sys.argv[2]) - 1])
