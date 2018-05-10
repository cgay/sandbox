## Notes on reorganizing the opendylan repo

I want to simplify the Open Dylan implementation in a radical way so that it's
easier to hack on. First step: clean up and reorganize the repo a bit. Figure
out what we can get rid of. Here's my first pass attempt.

*   Delete anything related to Windows. We shouldn't care about Windows until
    Dylan is in a good enough state that we can start thinking about trying to
    expand to other platforms, and until we have someone who wants to work on
    that. This means ditch the IDE, which means we can ditch the debugger-nub,
    which means we can ditch CORBA. Also OLE, win32, etc etc.

*   In general we need a lot more README files. Each library should have one.
    Most high level directories should have one.

*   Do a pass to combine module.dylan and library.dylan files unless there's an
    obvious reason not to combine specific ones.

Second step will be a package manager so we can get rid of submodules.

### Current directory layout

Current layout, with a few comments...

```none
opendylan
    CONTRIBUTING.rst
    License.txt
    Makefile.in
    OVERVIEW.txt
    README.rst
    Setup.bmp      X - move or delete
    Setup.xcf      X - move or delete
    admin          ? - anything in here necessary?  doesn't need to be top-level.
    autogen.sh
    configure.ac
    documentation
    install        X - contains Windows dlls
    m4             ? - what is this i don't even
    packages       * - move to sources/packages?  doesn't need to be top-level.
    sources        * - How are things outside this directory NOT sources?
        Library-Packs      - How are these useful?
        app                - Move some of these to examples/, delete the rest?
        benchmarks         - Flatten the structure.
        collections        - Combine lib/collection-extensions into this.
        common-dylan
        corba              - Only used for debugger-nub. Can will kill this? I need to
        databases
        deuce
        dfmc               - Rename to "compiler". Nobody knows what dfmc stands for.
        duim               -
        dylan
        environment        - Unsure if ditching this entire thing would be too radical.
                             I need to look at the console environment a little more, since
                             I never used it much, but I would personally be happy with a
                             batch dev style and good debugger integration.
        examples
        gtk                - Lots of stuff in here! Don't know much about it.
        harp               - Delete.
        io
        jamfiles           - Move to build-system library?
        lib                - Move contents to other locations, as appropriate.
        network
        ole                - Delete.
        project-manager    - Need to investigate this one; not sure its scope.
        qa                 - Move to sources/testing as a first step. Some can be deleted/moved.
        registry
        runtime-manager
        system
        tools
        win32              - Delete.

    tools          * - rename to devtools? combine with sources/tools?
```

### Proposed new directory layout (not exhaustive)

All general-purpose libraries live in their own github repositories. This
includes many libraries currently in sources/ and sources/lib.

Let's keep the top-level directory sparse and clean!

```none
opendylan
    README.md
    compiler              (was dfmc)
    dylan                 (was sources/dylan. call it dylanlib?)
    examples
    ext                   (submodules for all used general-purpose libraries)
    registry              (until we get rid of it)
    runtime               (was sources/runtime-manager)
    testing               (various cross-library test suites/apps)
    tools
```
