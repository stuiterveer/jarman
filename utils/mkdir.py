#!/bin/python3
import os
import sys

if len(sys.argv) < 2:
    print(f"Usage: {sys.argv[0]} <path>")
    exit(1)

path = sys.argv[1]

os.makedirs(path, exist_ok=True)