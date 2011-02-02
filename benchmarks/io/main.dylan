Module: io-benchmarks
Author: Carl Gay
Copyright: Copyright (c) 2011 Carl L Gay.  All rights reserved.
License:   See LICENSE.txt in this distribution for details.


define constant $whitespace :: <regex> = compile-regex("[ \t\n\r]");

define method count-words-in-file-1
    (filename) => ()
  let word-counts :: <string-table> = make(<string-table>);
  with-open-file (stream = filename)
    block ()
      while (#t)
        let words = split(read-line(stream), $whitespace);
        for (word in words)
          word-counts[word] := element(word-counts, word, default: 0) + 1;
        end;
      end
    exception (ex :: <end-of-stream-error>)
      // done
    end;
  end;

/*
  for(count keyed-by word in word-counts)
    format(*standard-output*, "%d %s\n", count, word);
  end for;
*/
end method count-words-in-file-1;

define test test-count-words-in-file-1 ()
  // TODO: Change name to non-string and see horrible error.  Fix it.
  benchmark(
    "count-words-in-file",
    count-words-in-file-1("c:/cgay/dylan/git-repo/sandbox/benchmarks/test-data-small.txt"));
end;

define method count-words-in-file-2
    (filename) => ()
  let word-counts :: <string-table> = make(<string-table>);
  let buffer = make(<string>, size: 16384, fill: ' ');
  with-open-file (stream = filename)
    block ()
      while (#t)
        read-into!(stream, 16384, buffer);
        let words = split(buffer, $whitespace);
        for (word in words)
          word-counts[word] := element(word-counts, word, default: 0) + 1;
        end;
      end
    exception (ex :: <end-of-stream-error>)
      // done
    end;
  end;

/*
  for(count keyed-by word in word-counts)
    format(*standard-output*, "%d %s\n", count, word);
  end for;
*/
end method count-words-in-file-2;

define test test-count-words-in-file-2 ()
  // TODO: Change name to non-string and see horrible error.  Fix it.
  benchmark(
    "count-words-in-file",
    count-words-in-file-2("c:/cgay/dylan/git-repo/sandbox/benchmarks/test-data-small.txt"));
end;

define suite io-benchmarks ()
  test test-count-words-in-file-1;
  test test-count-words-in-file-2;
end;

define method main () => ()
  let filename = locator-name(as(<file-locator>, application-name()));
  if (split(filename, ".")[0] = "io-benchmarks")
    run-test-application(io-benchmarks);
  end;
  // temp bug work-around
  force-output(*standard-output*);
end;

main();


