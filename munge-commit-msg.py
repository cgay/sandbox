#!/usr/bin/python

# Remove whitespace between the "job" line and subsequent text,
# and remove the "job" spec entirely for certain generic jobs.
# This is for use in the svn -> git conversion process.

import re
import sys

line_regex = re.compile(r"^(job|bug): +(\S.*)$", re.I)
job_regex = re.compile(r"[, ]+")
ignored_jobs = ['minor', 'website', 'gd', 'fundev', 'fd', 'koala']

first_line = sys.stdin.readline()
match = line_regex.search(first_line)

if match is None:
    sys.stdout.write(first_line)
else:
    jobs = [job for job in job_regex.split(match.group(2).strip())
            if job not in ignored_jobs]
    if len(jobs) > 0:
        sys.stdout.write("Bug %s: " % ', '.join(jobs))

    # Delete initial blank lines
    while True:
        line = sys.stdin.readline()
        if len(line) == 0 or len(line.strip()) > 0:
            sys.stdout.write(line)
            break

sys.stdout.write(sys.stdin.read())

