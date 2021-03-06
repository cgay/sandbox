#!/usr/bin/python

"""
Wrap the "opendylan" executable and display the warnings that it fails
to display.  (It displays them the first time a library is built, but
not for subsequent builds if the library is considered up-to-date.)
This script grovels over the log files.  It tries to do it immediately
after each library finishes compiling rather than waiting until the
very end.  It displays the warnings even if a given library doesn't
need to be rebuilt.
"""

import optparse
import os
import re
import subprocess


# TODO:
# * Modify Open Dylan to do all this crap in the first place.
# * Display full source path in warning.
# * Add --compiler option, to specify the compiler to use.
# * Add --serious option, to display only serious warnings.
# * Add --verbose option.
# * Add --dylan-library option to show dylan library warnings.
# * Recognize and pass through OD command-line options.
# * Process the compiler output incrementally, most likely by
#   passing the opened file descriptor around and using readline.


default_compiler = os.environ.get('DEFAULT_DYLAN_COMPILER', 'opendylan')

def main():
    parser = optparse.OptionParser(usage = "%prog [options] library ...")
    parser.add_option("--compiler",
                      help = "Name (or full path) of compiler to use [%default]",
                      metavar = 'COMP',
                      default = default_compiler)
    parser.add_option('--clean',
                      action = 'store_true',
                      help = "Remove old build products first [%default]",
                      default = False)

    options, libs = parser.parse_args()
    if len(libs) < 1:
        parser.error("You must specify one or my libraries to compile.")
    else:
        for lib in libs:
            build(lib, compiler = options.compiler, clean = options.clean)

def build(library, compiler = default_compiler, clean = False):
    # Remove LD_LIBRARY_PATH, which may be set so that the user's
    # project will find its used libraries correctly.  They will
    # conflict with the compiler's libraries if the user has built
    # "system" libraries (which normally they do, on Linux).
    env = os.environ.copy()
    if env.has_key('LD_LIBRARY_PATH'):
        del env['LD_LIBRARY_PATH']

    # Using a shell for this command so it will find 'opendylan' et al
    # on the user's PATH.
    cmd = "%s -build %s %s" % (compiler, '-clean' if clean else '', library)
    proc = subprocess.Popen(cmd,
                            shell = True,
                            stdout = subprocess.PIPE,
                            stderr = subprocess.PIPE,
                            env = env)

    # This will do for now.  Eventually I want to process the output
    # incrementally so the user gets incremental feedback.
    stdout, stderr = proc.communicate()

    if stderr:
        print stderr

    up2date = re.compile(r"^Library {library-description of (\w+).\d+} "
                         r"is up to date.")
    warnings = re.compile(r"^There were (\d+) warnings, (\d+) serious "
                          r"warnings and (\d+) errors.")
    updating = re.compile(r"^Updating definitions for [^:]+: (\w+) in .*")
    saving = re.compile(r"^Saving database for [^:]+: (\w+) in .*")

    # Scan for the above regular expressions and read the appropriate
    # library logs.  Logs are found based on the value of
    # OPEN_DYLAN_USER_ROOT.
    library = None
    for line in stdout.split('\n'):
        m = up2date.search(line)
        if m is not None:
            library = m.group(1)
            show_warnings(library)
            print "Library %s is up-to-date." % (library,)
            continue

        m = saving.search(line)
        if m is not None:
            library = m.group(1)
            show_warnings(library)
            print line
            continue

        m = updating.search(line)
        if m is not None:
            library = m.group(1)
            print "Building library %s..." % (library,)
            continue

        if warnings.search(line) is not None:
            print line

def show_warnings(library):
    """
    Display warnings found in the build log file for C{library}.
    """
    user_root = os.environ.get('OPEN_DYLAN_USER_ROOT')
    if user_root is None:
        print "Can't find logs; OPEN_DYLAN_USER_ROOT not set."
        return

    warning_regex = re.compile(r"(Warning|Serious warning) at ([^:]+):(\d+):")
    log = os.path.join(user_root, 'build', library, "%s.log" % (library,))

    with open(log) as fd:
        lines = fd.readlines()
        while lines:
            line = lines[0]
            match = warning_regex.search(line)
            if match is None:
                lines.pop(0)
            else:
                show_warning(match.group(2), match.group(3), lines)

def show_warning(source_file, line_number, lines):
    """
    Display a warning in a format understandable by emacs and other
    unix tools.  The first line in C{lines} is known to be a warning.
    The warning seems to be delimited by the next blank line, and then
    there MAY be a source listing, also terminated by a blank line.
    For example:

        Serious warning at table.dylan:873: 
          Invalid type for argument new-key in call to
          entry-key-setter
            (new-key :: <object>, v :: <entry-keys>, index :: <integer>) => (new-key :: <object>):
          <raw-pointer> supplied, <object> expected. 

        table.dylan:873:               -------------------------------------
        table.dylan:873:               entry-key(dst-keys, dst-index) := key;
        table.dylan:873:               -------------------------------------
    """
    warning = ""
    while lines:
        line = lines.pop(0)
        if not line.strip():
            break
        warning += line

    # Append the source listing, if any.
    prefix_regex = re.compile("%s:\d+:" % os.path.basename(source_file).replace('.', '\\.'))
    while lines and prefix_regex.search(lines[0]):
        line = lines.pop(0)
        # We don't want each of these lines to be considered a separate
        # warning, so the prefix and line number must be stripped.
        match = prefix_regex.search(line)
        line = line.replace(match.group(0), '   ').rstrip()
        warning = "%s\n%s" % (warning, line)

    print "%s:%s: %s" % (source_file, line_number, warning)

if __name__ == '__main__':
    main()
