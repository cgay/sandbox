cgay's sandbox
==============

Just a bunch of notes.

Much of this has been moved to various Google Docs.


Libraries
=========

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





Chroma Lexer (syntax highlighting)
==================================

``go test -test.run 'TestLexers/Dylan'``
