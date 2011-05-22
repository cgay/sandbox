#!/usr/local/bin/python -S
import sys
from operator import itemgetter
from collections import defaultdict

def main():
    count = defaultdict(int)
    for line in sys.stdin:
        for word in line.split():
            count[word] += 1

    for e, v in sorted(count.items(), key=itemgetter(1), reverse=True):
        print e, " ", v

main()

