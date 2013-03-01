Module: foo

// Moved here from the coil library in case I ever decide to add this
// to the collections library.

/// Synopsis: A table that keeps track of the order in which elements
///           are added.  Replaced keys retain their original ordering.
///           Iteration uses insertion order.
///
define open class <ordered-table> (<table>)
  slot key-sequence :: <list> = #();
  slot last-pair :: <list> = #();
end;

define method forward-iteration-protocol
    (c :: <ordered-table>)
 => (initial-state :: <integer>, limit :: <integer>,
     next-state :: <function>, finished-state? :: <function>,
     current-key :: <function>,
     current-element :: <function>, current-element-setter :: <function>,
     copy-state :: <function>)
  values(0,                  // initial state
         c.size,             // limit
         // next state
         method (t :: <ordered-table>, index :: <integer>) => (state :: <integer>)
           index + 1
         end,
         // finished-state?
         method (t :: <ordered-table>, state :: <integer>, limit :: <integer>)
             => (finished? :: <boolean>)
           state = limit
         end,
         // current-key
         method (t :: <ordered-table>, state :: <integer>) => (key :: <object>)
           t.key-sequence[state]
         end,
         // current-element
         method (t :: <ordered-table>, state :: <integer>) => (key :: <object>)
           t[t.key-sequence[state]]
         end,
         // current-element-setter
         method (value :: <object>, t :: <ordered-table>, state :: <integer>)
             => (value :: <object>)
           t[t.key-sequence[state]] := value
         end,
         // copy-state
         method (t :: <ordered-table>, state :: <integer>) => (state :: <integer>)
           state
         end)
end method forward-iteration-protocol;

define method element-setter
    (new-value :: <object>, table :: <ordered-table>, key :: <object>)
 => (new-value :: <object>)
  if (~key-exists?(table, key))
    if (empty?(table.key-sequence))
      table.key-sequence := list(key);
      table.last-pair := table.key-sequence;
    else
      let new-last-pair = list(key);
      table.last-pair.tail := new-last-pair;
      table.last-pair := new-last-pair;
    end;
  end;
  next-method();
  new-value
end method element-setter;

// Update the key-sequence when keys are removed.
//
define method remove-key!
    (table :: <ordered-table>, key :: <object>) => (present? :: <boolean>)
  let keys-equal? :: <function> = table.key-test;
  let prev = #f;
  iterate loop (keys = table.key-sequence, prev = #f)
    if (~keys.empty?)
      let curr = keys.head;
      let rest = keys.tail;
      if (keys-equal?(curr, key))
        if (prev)
          prev.tail := rest;
          if (rest.empty?)      // Deleted last element.
            table.last-pair := prev;
          end;
        else                    // Deleting 1st element.
          table.key-sequence := rest;
          if (rest.empty?)      // Deleted last element.
            table.last-pair := #();
          end;
        end;
      else
        loop(rest, keys);
      end;
    end if;
  end;
  next-method()
end method remove-key!;

define class <ordered-string-table> (<ordered-table>)
end;

// This must be consistent with table-protocol.
define method key-test
    (t :: <ordered-string-table>) => (test :: <function>)
  \=
end;

// The first value returned must be consistent with key-test.
define method table-protocol
    (table :: <ordered-string-table>)
 => (test :: <function>, hash :: <function>);
  values(\=, string-hash)
end method table-protocol;
