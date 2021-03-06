cgay's sandbox
==============

A place for me to store various play projects and notes.  The notes
are below...

.. contents::

.. Documentation
   Usability
   Reading List
   Dylan Language
   Open Dylan
     What defines a 1.0 release?
       Windows
       Linux
     IDE
   Libraries
     testworks
     common-dylan
     collections
     regular-expressions
     system
     koala
     file-system
     locators
   String Hacking
   Project Ideas
   Conditions


Documentation
=============

* There's no link from inside the Library Reference back to the main
  documentation page or to opendylan.org.  Can we make the website
  header appear on the doc pages?

* Revamp the FAQ.  It's so random and negative.  Look at eiffel.com FAQ
  for examples.

  It can be recovered from
  https://github.com/cgay/dylan-wiki-data/blob/master/pages/main/FAQ/FAQ
  and everything relating to GD should be removed.  Just use a single
  page.

  Questions to add:

  Q: How do I change the way my object prints?
  A: use io; use print; use format; override print-message and print-object

* https://en.wikipedia.org/wiki/Dylan_(programming_language) needs a
  lot of love.


Usability
=========

* Single file libraries.  Implement DEP 6.  (I've since done an about
  face on DEP 6.  I think it would be best to define the library and
  modules in the normal way, but in the same source file.)

* Improved scripting support, including ``#!/usr/bin/dylan``.

* Package it up for various platforms.  apt, brew, whatever.


Reading List 
============

* Scala collections API (Bruce Mitchener recommendation)
* trunk/doc/opendylan design notes


Dylan Language
==============

* What's the reasoning behind not having format-string and
  format-arguments slots in <error>, but rather putting them in
  <simple-error>?  This is a wart on the language.  You probably
  don't want to risk the format arguments not having dynamic extent
  anyway, most of the time.  (See comment in element-range-error.)  I
  think it's an optimization to prevent having to do the formatting
  unless the error is actually signalled.

  Note that in many cases OD does embed collections into errors when
  it doesn't use element-range-error.  This should be fixed and the
  errors messages should at least include the collection type and
  size.

* Why is there no equivalent to Python's __repr__?  (See previous
  item.)

* How do you create Unicode string constants if they only contain
  characters that can be expressed in a <byte-string>?  e.g., in
  Python u"foo".  Does "\<666>" create a unicode string or a byte
  string?  Is this even useful?  How about #u"..."?

* For writing code with regular expressions in it, Python's r"..."
  syntax is very nice.  What about adding something similar to Dylan?
  e.g., #r"..." or #/.../

* Better multi-line string support.  Anything that requires a lot of
  escaping is a non-starter because it makes it extremely difficult to
  edit the string in a major way.  Python's """ is really good because
  it handles that case well, and I prefer it to what I just found in
  C++, Lua, Javascript, or Ruby.

* Why are set operations (union, intersection) defined on <sequence>
  instead of <collection> or <set>?

Open Dylan
==========

What defines a 1.0 release?
---------------------------

I think the main concentration should be on the Linux port.  It should
be easy for anyone with the right tools installed to build OD on both
Linux and Windows.

Windows
~~~~~~~

* I love using registry projects because they seem to be much less
  broken than non-registry projects and they allow for easily hacking
  on OD itself.  The major drawback for me is that they don't seem to
  support loose/development mode very well.  (Do some experiments to
  figure out exactly what DOES happen...I've been working around it
  for so long I can't quite remember.)

  I'd be happy with one Big Red Switch that set the default
  compilation mode for everything.

Linux
~~~~~

* All warnings should be displayed during compilation, even those of
  sub-projects.  I don't care if this is done in the compiler or if
  we provide a script that will display them.  (It would have to be
  a bit smart about which sub-projects were actually used, I guess.)
  This works in the IDE so I would imagine it's not a deep problem.

* It should be possible to get a Dylan-level backtrace.  I'm not
  talking about interactive debugging here, just the ability to
  display a readable backtrace when an error is signalled.  e.g.,
  Python's default behavior is to display a backtrace before it
  exits if there's an unhandled exception.

IDE
---

* Increase the initial size of windows to reflect today's minimum
  screen sizes.

* Move the Debug options to a top-level tab in the Project window.  I
  change these all the time when testing.

* Combine the Build dialog and Warnings tab into a single tab called
  Build.  They seem a natural fit and the larger screens these days
  can easily accomodate the change.  Note that the two lines of text
  in the current Build progress window can easily be combined into
  one: <library-name>: <action>

* Change win32-environment command-line parsing to use
  commmand-line-parser.

* Use config file instead of registry on Windows.  Housel says it
  would be nice if it were pluggable so that you could use either one.
  Just configs would be enough for me, but since registry is already
  used it probably makes sense to be Windowsy on Windows.  Config files
  could be used for testing on Windows.

  I imagine adding a --config command-line option would be enough to
  switch to the use of config files and ignore the registry.  This
  would especially be useful for testing.

  There would need to be a user config file (default
  ~/.opendylan/opendylan.coil) and an auto-generated config for
  settings that are changed via the IDE (e.g., ~/.opendylan/autogen.coil).
  The user file would override options in the autogen file.

  It would be nice to allow "--config none" to mean "don't load any
  config".

* Make it possible to sort the tree of definitions (alphabetically, by
  definition type, by textual order) by right-clicking on a file in
  the Project window.

* Improvements to the "select buffers" menu: 

    + Sort by most-recently-visited.  There should be a drop-down menu
      to choose sorting method.  The choice should be remembered.

    + Show/hide which buffers were loaded due to Edit Methods?  Or
      buffers which are under the project's directory (as determined
      by the shared file root)?  Or just an option to show those that
      are part of any open project?  Or add a filter widget...this
      might be the most general.

    + An option to display as <dir>/<file> rather than <file> <dir>.
      This can make it easier to find files if you know the directory.
      They just line up better.  Could play around with showing only
      the unique parts, or grouping them by directory...

* Show the filename in separator lines in composite buffers.

* Make M-. work for "m(t1, t2, t3, ...)"  Even better, if it's not too
  slow, right click on a name could put all known methods under a
  submenu of Edit Methods, plus All.

* Integrate Testworks into the IDE.  Needs design.  10 seconds thought
  ideas:

    + Add a test-library keyword to the LID file. 

    + Project -> Run Test Suite...  (use good default locations for tests) 

    + Store test results in standard locations. 

    + Display results in a new project window tab and have a button to
      "make them canonical".

    + Select arbirtrary tests and/or suites to re-run. 

    + I really, really want hierarchical suite and test names for this. 

    + Needs to support external resources, e.g., servers.  This can be
      done via a --config argument.

    + Integrate with the Test Specification to indicate in Deuce
      whether the visible methods have corresponding tests, and if so,
      what they are.

* Export Test Suite Skeleton can generate invalid module specs.  The one it generated
  for regular-expressions had a bad ')' in  ::

      constant <invalid-regex> :: <object>);

  which is defined as ::

      defne constant <invalid-regex> = <illegal-regex>;
      
* Implement fast, Eclipse-style "resource search".  This would use the
  compiler database, not be file search.  (Although file search could
  be integrated into it as well, as in Eclipse.)  It could offer to
  put all the found definitions into a composite buffer.

* Modernize the VCS integration.  As a first pass support Subversion
  and Git.  The way it's currently done looks a bit antiquated to me
  although I haven't fully internalized it yet.

  + There should be auto-detection of the VCS back-end based on
    existence of .git or .svn directories.

  + The Project Window should show the VC status of files and should
    provide a way to commit/update/etc the entire project or selected
    files.

  + The Editor Window should show the revision number and status of
    the current file, and should have options to commit/update/diff/etc.

  + Give some thought to how we might support VC operations for
    multiple open project (via the Main Window?)

  + Provide some way to collect up commit comments incrementally (from
    the editor, diff/merge facility, and of course from the commit UI).

  + Provide integration with diff/merge tools like Meld rather than
    reinventing the wheel.

Libraries
=========

testworks
---------

* Catch overflow errors when the profiling macro is called and re-run
  the test without profiling.  Report the error.

common-dylan
------------

* Has float-to-string but no string-to-float.
  Has number-to-string but no string-to-number.

* What's the reasoning behind the 'skip' parameter to some sequence functions,
  like 'position'?  It seems like it would be less efficient to use than
  'start' and 'end' parameters since the implementation would have to start
  from the beginning each time.  I don't like it being a mandatory keyword in
  the 'position' generic function.  (Other functions that have it:
  find-element, find-value, find-key.)  Note that find-key(..., skip: ...)
  is only used twice is all of Open Dylan.

  subsequence-position uses 'count', but it really means 'skip'.  Need to do
  an exhaustive review of all the sequence functions.

* find-key has a 'failure' keyword argument which it seems should be
  called 'default' or at least 'on-failure'.  Want::

    find-key(seq, fn, start: m, end: n, default: d)

* Review other collection functions that might use start/end parameters.

* Look at Factor as an example:
  http://docs.factorcode.org/content/article-sequences.html

* abeaumont points out that it can be more readable to use sequence
  functions that copy rather than start:/end:.  Agree, but it conses.
  Can have both by simply using slice() liberally.

* Have both slice(seq, m, n) and subseq(seq, m, n) ?  The former has
  sloppy semantics and the latter has strict?

* Review split() signature.  I think this would be better::

    split(seq, sep, parts: n, start: s, end: e)


collections
-----------

* Move <set> into the collections library.  It's Currently defined in
  functional-extensions, so that's where you find it with a 'grep' and
  that's not a library you want to use directly since it's not
  portable.

  housel suggests that we could combine collection-extensions into
  collections, since collections is standard/"common dylan" while
  collection-extensions started as a GD-only library.

* Write a DEP to introduce slices to the language.  They really need
  to be supported by the language itself or they're not terribly
  useful.  Thoughts so far:

  + Slices inherit their (im)mutability from the target sequence.

  + ``slice(sequence, start, end)`` where end may be #f.  Both start
    and end may be negative to index from the end.

  + ``reverse(slice)`` can sometimes just swap the start and end
    indices.

  + For mutable slices need to look at all collection mutation
    functions and see what the semantics should be.

* Add start/end parameters to sequence functions?  Doing this could
  create a more consistent strings API.  (Alternatively slice() could
  be used, but it requires allocating memory.)

* Change ``subsequence-position``:

  + Rename to ``find-subsequence``. This function stands out in that
    it doesn't use a verb-noun naming scheme where a much better (in
    my opinion) name exists: ``find-subsequence``.

  + Fix inconsistency between ``find-key(..., skip: 2)`` and
    ``subsequence-position(..., count: 2)``.  Use "skip".

* add/add! don't specify where an element is added and it differs
  between lists and stretchy vectors, and it's completely non-obvious
  what deque will do.  (It adds to the front.)  It would be preferable
  to have separate functions for adding to the beginning or end of a
  sequence.  Perhaps push/push! and push-last/push-last!, inspired by
  <deque>.

  I just found (what I think is) a bug in user-registry-path due to
  this behavior.  How often does one *not care* where an element will
  be added?


regular-expressions
-------------------

* Mainly is just missing features now.  First step is probably to
  implement the verbose: and multi-line: parameters to compile-regex.


system
------

* Add a #"author-id" file property.  Besides being generally useful,
  currently if there's an error resolving the author name we're left
  with nothing at all.  Use this in Koala's directory listing.  Also,
  document the new attribute and consider removing the file-properties
  function.

* Better temp file support

* Export both OS-specific and generic modules.  The OS-specific
  modules would use the OS-specific names.  e.g., getpid vs
  current-process-id.  Then for calls that only exist on a certain
  platform it will be natural to use the OS-specific name instead of
  inventing a new one.  Also if you know your code only works on Linux
  it's more natural to call getpid anyway.

* run-application

  + When the exe file doesn't exist, the error is "create process
    failed: The system cannot find the file specified."  It should say
    what the file was.

  + I would like a simpler API than this.  The irregular number of
    return values is strange, and often one wants something as simple
    as::

      let (exit-code, stdout, stderr) = run-program("whoami");

    As for a complete API, I like the way subprocess.Popen works.

* Better error messages in io/*-file-accessor.dylan::

    dylan-compiler -build code/coil.lid
    ...
    Opened project coil (/Users/cgay/dylan/src/coil/code/coil.hdp)

    Internal error: read: Is a directory
    Exiting with return code -1


koala
-----

* Should probably be using <internet-address>es instead of <string>s, at least
  for the <listener> class.

* Interesting discussion about URL query values:
  http://lists.w3.org/Archives/Public/ietf-http-wg/2004JulSep/0009.html

* Look at the Allegro web app package more.  (name?)  It has some nice ideas
  about sessions and apps.


file-system
-----------

* create-directory(parent, name) seriously?  Just pass a single pathname and
  figure out the parent directory, yes?


locators
--------

* Rewrite the whole damned thing?  Man, I hate this library.  It seems
  way overly complex to me.  Need to come up with a reasonable
  alternate design, I guess.  I would probably get rid of directory
  locators completely, since you generally don't know whether a
  locator names a directory or file until you ask the file-system.  It
  has to be sufficiently easy to use with strings wherever possible,
  rather than (for example) having to create useless locator objects
  just to merge them.  I think you basically need::

    <locator>
      <url>
      <file>
      

* Renamings:

    + <http-server> => <http-server-url>
    + <ftp-server> => <ftp-server-url>
    + <file-server> => <file-server-url>


String Hacking
==============

* Various string conversion functions in common-dylan.

* Specific functions I've wanted::

    . slice(sequence, bpos, epos)
    . slice!(...)
    . slice!-setter(...)

* Implement multi-line strings (""") in the compiler if it's not too
  hairy.  Probably should write a DEP first, or in parallel.  See
  conversation on Hackers list with subject "Better string constants".


Project Ideas
=============

* Get lisp-to-dylan (LTD) added to quicklisp.

* It might be fun to try something like this for Dylan:
  http://dev-tricks.net/pipe-infix-syntax-for-python
  I imagine syntax like::

    pipe(fib() => until(f1) => where(f2) => transform(f3) => sum)

  Instead of iterators we would use closures in Dylan, so fib()
  returns a "generator": a closure taking no args and returning the
  next value each time it is called.  Each name following the =>, such
  as "until", would be a function that expects a generator function as
  its first argument and returns the next value according to its own
  rules.

  I have my doubts about the general applicability of this, but it
  might be a neat hack and possibly a blog post.  dlowe brought it to
  my attention.

* english2cron: parse english and generate cron time specs.  Could be
  a Python hack to actually have anyone give a shit, and would make a
  fun blog post. :)

* Convert lisppaste to Dylan with LTD.  This would be a good synthesis
  project, like wiki is.

* Convert COIL to Dylan.  XML is just such a horrible configuration syntax.

  This is underway in https://github.com/cgay/coil .  Parser is basically
  working.  Needs tests and printer.

* Create a general-purpose "with" macro, analogous to Python's "with"
  statement or C#'s "using" statement.  This could use a
  <resource-protocol[-mixin]> class and support acquire and release
  generic functions.  I counted around 300 "with"-style macros in
  fundev and libraries, but of course only some of them would fit this
  model.  The main ones that jump out at me are: network streams,
  files, database connections, locks, http-server.  Housel mentioned
  <closable-object> as one possibility, but it only supports close
  currently, and the name isn't quite right.

* Implement enums a la Java:
  http://download.oracle.com/javase/1.5.0/docs/guide/language/enums.html
  It looks as though each element is an instance of the enum's class
  name.  In Dylan there's no need to create a subclass for each
  element when methods are provided, since we can use == method
  dispatch on the enum constant.  The elements can be stored in class
  slots.

* Fix shootout code and update the web site. 

* Benchmarks -- IO performance seems to be really bad.  See the
  count-words benchmark.  Even some very basic benchmarks could
  be useful at this stage...

    + Array access speed for different array types.
    + Gabriel benchmarks
    + Allocation/deallocation

* DUIM on Linux


Conditions
==========

* Consider switching wholesale to current (Java?) terminology:
  condition -> exception, error -> bug

* Rename <serious-condition> to <exception>.  Should <error> really be
  a subclass of <serious-condition>?  Fix system libraries'
  subclassing of <error> where inappropriate.  cpage's comments
  clarified things:

* Fix condition hierarchy around <invalid-index-error> and friends
  (see comment in collection.dylan) and export a useful set of
  conditions.  <key-error>?




-----------------------------------

Proposal to rename <serious-condition> 

Proposal:  Change the language by renaming <serious-condition> to <exception>. 

Reasoning: 

For reference, here are some DRM definitions: 

<serious-condition>: The class of conditions that cannot be safely ignored. 
<error>: The class of conditions that represent something invalid about the program. 

(1) <serious-condition> is the normal class to inherit from for classes that represent exceptional conditions and that are not errors.  (Note the use of the word "exceptional" here, which seems natural in English.)  The name "<serious-condition>" is too wishy-washy and long-winded to be the default condition class to subclass or catch.  Chris Page also points out that it begs the question "How serious?"  Should we also have a <really-serious-condition>? 

(2) "Exception" is common terminology for this type of condition in other languages so this makes Dylan slightly more accessible to programmers coming from those communities. 

Implementation:

This is a fairly straight-forward change.  The steps would be:

(1) Rename <serious-condition> to <exception>.
(2) Update all uses of <serious-condition> to use <exception> instead.
(3) Update the DRM with an erratum noting the change.
(4) Profit.

I would prefer NOT to provide backward compatibility because the user base is tiny to non-existent.  Having backward compatibility leaves the door open to new code using the old class name.  That's just my preference though; I don't mind going the other route.  Perhaps there are bootstrap or other issues that I haven't thought of here though.

Comments?


Proposal to make <serious-condition> and <error> disjoint 
Proposal: Make <error> be a subclass of <condition> instead of being a subclass of <serious-condition>.

Reasoning:

In many programs there are cases for which it is legitimate to use the "diaper pattern" (i.e., catch many or all exceptions).  For example in an application's top-level loop it may be preferable to catch <serious-condition> and offer the choice to continue rather than to exit the application.  Sometimes library code doesn't export a particular exception class so the client is left with no choice but to cast a wider net.



.
