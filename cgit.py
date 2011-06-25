#!/usr/bin/python

import os
import subprocess
import sys

# Each action function accepts a single "args" argument which contains
# only the args following the action name.

def stat_all(args):
    """
    Check the status of all git repositories in the given directory.
    Limit output to the 'interesting' stuff.
    """
    top = (args[0]
           if len(args) > 0
           else os.getcwd())
    for repo_dir in find_repo_directories(top):
        sys.stdout.write("Checking %s..." % (repo_dir,))
        stdout, stderr = git(repo_dir, ["status"])
        if stdout and 'working directory clean' not in stdout:
            print
            print stdout
        else:
            sys.stdout.write("clean\n")
        if stderr:
            print >> sys.stderr, stderr

def find_repo_directories(top):
    """
    Find all directories directly under C{top} which have .git
    subdirectories and return their pathnames as a list.
    """
    dirs = []
    for dir in os.listdir(top):
        if os.path.isdir(os.path.join(dir, '.git')):
            dirs.append(dir)
    return dirs

def git(working_dir, command):
    """
    Execute the given C{command} as a subprocess and return a tuple
    with exit_code, stdout, stderr.  Uses C{working_dir} as the cwd
    for the subprocess.
    """
    if isinstance(command, basestring):
        command = "git " + command
    else:
        command = ["git"] + command
    proc = subprocess.Popen(command,
                            cwd = working_dir,
                            stdout = subprocess.PIPE,
                            stderr = subprocess.PIPE)
    return proc.communicate()   # (stdout, stderr)

actions = dict(status = stat_all)

actions_doc = "\n".join(["  %s: %s" % (key, fn.__doc__)
                         for key, fn in actions.iteritems()])

def find_action(name):
    """
    Find the action for which C{name} is an unambiguous prefix.
    """
    possibilities = dict()
    for key, val in actions.iteritems():
        if key.startswith(name):
            possibilities[key] = val
    if len(possibilities) == 0:
        fail("Action %r not found.  Available actions are:\n%s"
             % (name, actions_doc,))
    elif len(possibilities) > 1:
        fail("Action %r is ambiguous.  Possibile actions are:\n%s"
             % (name, "\n".join(["  %s: %s" % (key, fn.__doc__)
                                 for key, fn in possibilities.iteritems()])))
    else:
        return possibilities.values()[0]

def fail(message):
    print >> sys.stderr, message
    sys.exit(1)

if __name__ == '__main__':
    args = sys.argv[1:]
    if len(args) == 0:
        fail("You must supply an action.  Available actions are:\n%s"
             % (actions_doc,))
    action = find_action(args[0])
    action(args[1:])
