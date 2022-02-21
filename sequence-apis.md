Where do we have sequence functions/utilities/whatever lying around?

Marking the ones I find potentially interesting with + and the ones I think
should be dropped, or at least ignored by me, with -.

*  dylan library
   *  `<sequence>`
   *  `<vector>`
   *  `<deque>`
   *  `<simple-vector>`
   *  `<simple-object-vector>`
   *  `<stretchy-vector>`
   *  `<deque>`
   *  `<list>`
   *  `<pair>`
   *  `<empty-list>`
   *  `<range>`
   *  `<string>`
   *  `<byte-string>`
   *  `<unicode-string>`
   *  Collection Properties
      *  `empty?`
      *  `size`
      *  `size-setter`
      *  `rank`
      *  `row-major-index`
      *  `dimensions`
      *  `dimension`
      *  `key-test`
      *  `key-sequence`
   *  Selecting Elements
      *  `element`
      *  `element-setter`
      *  `aref`
      *  `aref-setter`
      *  `first`
      *  `first-setter`
      *  `second`
      *  `second-setter`
      *  `third`
      *  `third-setter`
      *  `last`
      *  `last-setter`
      *  `head`
      *  `head-setter`
      *  `tail`
      *  `tail-setter`
   *  Adding and Removing Elements
      *  `add`
      *  `add!`
      *  `add-new`
      *  `add-new!`
      *  `remove`
      *  `remove!`
      *  `push`
      *  `pop`
      *  `push-last`
      *  `pop-last`
   *  Reordering Elements
      *  `reverse`
      *  `reverse!`
      *  `sort`
      *  `sort!`
   *  Set Operations
      *  `intersection`
      *  `union`
      *  `remove-duplicates`
      *  `remove-duplicates!`
   *  Subsequence Operations
      *  `copy-sequence`
      *  `concatenate`
      *  `concatenate-as`
      *  `replace-subsequence!`
      *  `subsequence-position`
   *  Mapping and Reducing
      *  Simple Mapping
         *  `do`
         *  `map`
         *  `map-as`
         *  `map-into`
         *  `any?`
         *  `every?`
      *  Extensible Mapping Functions
         *  `reduce`
         *  `reduce1`
         *  `choose`
         *  `choose-by`
      *  Other Mapping Functions
         *  `member?`
         *  `find-key`
         *  `remove-key!`
         *  `replace-elements!`
         *  `fill!`
      *  The Iteration Protocol
         *  `forward-iteration-protocol`
         *  `backward-iteration-protocol`
      *  The Table Protocol
         *  `table-protocol`
         *  `merge-hash-codes`
         *  `object-hash`
*  common-dylan:common-extensions
   *  Concrete subclasses of DRM-specified classes
      *  `<stretchy-object-vector>`
      *  `<object-deque>`
   *  Other
      *  `<stretchy-sequence>`
      *  `<string-table>`    (not a sequence but of interest?)
      *  `remove-all-keys!`  (does it work on sequences?)
      *  `concatenate!`
      *  `difference`
      *  `position`
      *  `split`
      *  `join`
      *  `find-element`  (a complement to `find-key` that returns the value)
*  cl:cl-sequences
   *  `cl-position`
   *  `cl-position-if`
   *  `cl-find`
   *  `cl-find-if,`
   *  `cl-assoc`
   *  `cl-assoc-if`
   *  `cl-count`
   *  `cl-count-if`
   *  `cl-remove`
   *  `cl-remove-if`
   *  `cl-remove!`
   *  `cl-remove-if!`
   *  `cl-substitute`
   *  `cl-substitute-if`
   *  `cl-substitute!`
   *  `cl-substitute-if!`
   *  `cl-remove-duplicates`
   *  `cl-remove-duplicates!`
   *  `cl-search`
   *  `cl-mismatch`
   *  `cl-merge`
*  deuce:deuce-internals
   *  `position`
   *  `position-if`
   *  `count`
   *  `insert-at!`
   *  `remove-at!`
*  collection-extensions:self-organizing-list
   *  `<self-organizing-list>`
*  collection-extensions:subseq
   *  `<subsequence>`
   *  `<byte-vector-subsequence>`
   *  `subsequence`
*  collection-extensions:vector-search
   *  `find-first-key`
   *  `find-last-key`
*  collection-extensions:heap
   *  `<heap>`
   *  `heap-pop`
   *  `heap-push`
   *  `random-iteration-protocol`
*  collection-extensions:sde-vector
   *  `<sde-vector>`
*  collection-extensions:sequence-diff
   *  `sequence-diff`
   *  `<script-entry>`
   *  `<insert-entry>`
   *  `<delete-entry>`
   *  `element-count`
   *  `source-index`
   *  `dest-index`
*  collection-extensions:collection-utilities
   *  `singleton?`
   *  `key-exists?`
*  collection-extensions:sequence-utilities
   *  `push!`
   *  `pop!`
   *  `pair?`
   *  `null?`
   *  `list?`
   *  `xpair`
   *  `tabulate`
   *  `list*`
   *  `take`
   *  `drop`
   *  `last-pair`
   *  `reverse-append`
   *  `unfold`
   *  `unfold/tail`
   *  `foldl`
   *  `foldr`
   *  `pair-foldl`
   *  `pair-foldr`
   *  `reduce-l`
   *  `reduce-r`
   *  `heads`
   *  `tails`
   *  `concatenate-map`
   *  `pair-do`
   *  `choose-map`
   *  `partition`
   *  `assoc`
   *  `apair`
   *  `alist-copy`
   *  `alist-delete`
   *  `satisfies`
   *  `index`
   *  `find`
   *  `find-tail`
   *  `precedes?`
   *  `split-at`
*  collections:bit-vector
   *  `<bit>`
   *  `<bit-vector>`
   *  `word-size`
   *  `bit-vector-word`
   *  `bit-vector-and`
   *  `bit-vector-and!`
   *  `bit-vector-andc2`
   *  `bit-vector-andc2!`
   *  `bit-vector-or`
   *  `bit-vector-or!`
   *  `bit-vector-xor`
   *  `bit-vector-xor!`
   *  `bit-vector-not`
   *  `bit-vector-not!`
   *  `bit-count`
*  collections:bit-set
   *  `<bit-set>`
   *  `set-add`
   *  `set-add!`
   *  `set-remove`
   *  `set-remove!`
   *  `set-union`
   *  `set-union!`
   *  `set-intersection`
   *  `set-intersection!`
   *  `set-difference`
   *  `set-difference!`
   *  `set-complement`
   *  `set-complement!`
   *  `infinite?`
   *  `copy-bit-set!`
   *  `empty-bit-set!`
   *  `universal-bit-set!`
*  collections:collectors
   *  `collector-protocol`
   *  `collecting`
   *  `collect-into`
   *  `collect-first-into`
   *  `collect-last-into`
   *  `collect`
   *  `collect-first`
   *  `collect-last`
   *  `collected`
*  collections:plists
   *  `get-property`
   *  `put-property!`
   *  `do-put-property!`
   *  `keyword-sequence`
   *  `value-sequence`
   *  `remove-property!`
   *  `do-remove-property!`
   *  `remove-keywords`
   *  `with-keywords-removed`
*  collections:set
   *  `<set>`
   *  `<object-set>`
*  collections:table-extensions
   *  `<string-table>`
   *  `<hash-state>`
   *  `collection-hash`
   *  `sequence-hash`
   *  `collection-hash!`
   *  `sequence-hash!`
   *  `values-hash`
   *  `string-hash`
   *  `case-insensitive-string-hash`
   *  `case-insensitive-equal`
   *  `remove-all-keys!`
   *  `merge-hash-ids`
   *  `table`
   *  `<case-insensitive-string-table>`

Discussion

What we keep, or what we decide to "bless" as officially maintained, may depend
on our individual outlooks about programming with collections. Obviously the
`cl` library is modeled on Common Lisp's sequence facilities, but how much do
we actually want to use lists in Dylan programs? My take is that while they're
preferable for some applications, the first thing in my quiver is usually going
to be `<stretchy-vector>` because of its flexibility, random-access
performance, and ease of use. Sort of like Python sequences and Go slices.

I'm looking for the sweet spot with maximum utility and minimal overlap in
functionality.

It's not always best to look at a function purely by itself and determine what
parameters are necessary; the library should work together as a whole. For
example, do we use start/end keywords everywhere or lightweight slices? Or can
they both be used together in the same library to good effect?

Performance is key. How do we get the best performance, taking into account the
need to allow user-created collection classes and therefore mark some classes
as `open`. Separately, would it be beneficial to keep everything in one
`collections` library so that they can be compiled as a unit?
