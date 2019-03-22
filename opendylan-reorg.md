## Notes on reorganizing the opendylan repo

I want to simplify the Open Dylan implementation in a radical way so that it's
easier to hack on. First step: clean up and reorganize the repo a bit. Figure
out what we can get rid of. Here's my first pass attempt.

Some overall notes:

*   In general we need a lot more README.rst files. Each library should have
    one. Most high level directories should have one.

*   sources/lib/ is for any "general purpose" libraries. I think of it as the
    libraries that are not solely part of the Open Dylan implementation. I could
    imagine, for example, that we ultimately move libraries for parsing Dylan
    code and creating an AST out of dfmc/ and into sources/lib/ because they can
    be used by "user code" to create tools. Actually lib/source-records is
    already such an example.

    Not sure how much of the moving to lib/ I'll do because once we have a
    package manager I think many of these libraries should be in their own
    repositories.

*   Do a pass to combine module.dylan and library.dylan files unless there's an
    obvious reason not to combine specific ones.

Current layout, with comments on how to change each directory...

```none
opendylan
    CONTRIBUTING.rst       - delete, now that moved to Hacker Guide
    License.txt
    Makefile.in
    OVERVIEW.txt           - should be integrated with Hacker Guide. Wasn't totally obvious
                             how to do that. Might be clearer after some of this reorg is done.
    README.rst
    Setup.bmp              - [done] move or delete
    Setup.xcf              - [done] move or delete
    admin/builds           - [done] rename to build/windows
    configure.ac
    documentation          - library-reference is problematic. documentation should in general
                             live with the libraries themselves. probably that is solved
                             partly by a package manager and by building the library reference
                             docs differently.
    install                - [done] move to build/windows/{bin,lib} -- dbghelp.dll et al
    m4                     - [done] move to build/m4
    packages               - [done] move to build/packages
    sources
        Library-Packs      - can these be deleted? if not, add README.rst with summary
                             of email thread discussing them. windows (IDE) only.
                             move to build/windows along with admin/builds (above)?
        app                - [done] move some of these to examples
        benchmarks         - [done] move to sources/testing. flatten the structure.
        collections        - move to lib/collection-extensions
        common-dylan       - move to lib/common-dylan
        corba              - move to lib/corba. only used by debugger-nub
        databases          - move to lib/database
        deuce              - move to lib/deuce
        dfmc               - rename to compiler
        duim               - move to lib/duim
        dylan              - move to lib/dylan
        environment        - rename to ide
        examples
        gtk                - Lots of stuff in here! Don't know much about it.
        harp               - delete. brucem had a branch to do this...
        io                 - move to lib/io/{streams,format,etc}
        jamfiles           - move to ../build/?
        lib
        network            - move to lib/network
        ole                - move to lib/windows/ole
        project-manager    - investigate; not sure its scope.
        qa                 - [done] move to sources/testing as a first step. Some can be deleted/moved.
        registry
        runtime-manager
        system             - move to lib/system
        tools              - [done] move make-dylan-app to app/
                             [done (deleted)] move map-statistics to lib/windows/
                             [done] delete templates/
        win32              - move to lib/windows/win32
    tools                  - rename to devtools? combine with sources/tools?
```
