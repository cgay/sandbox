Module: dylan-user
Author: Carl Gay
Copyright: Copyright (c) 2011 Carl L Gay.  All rights reserved.
License:   See LICENSE.txt in this distribution for details.


define library io-benchmarks
  use common-dylan;
  use io;
  use regular-expressions;
  use simple-parser;
  use system;
  use testworks;
  use uncommon-dylan;
end library io-benchmarks;

define module io-benchmarks
  use common-dylan, exclude: { format-to-string };
  use file-system;
  use format;
  use locators;
  use regular-expressions;
  use standard-io;
  use streams;
  use testworks;
end module io-benchmarks;

