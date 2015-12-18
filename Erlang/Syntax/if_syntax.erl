-module(if_syntax).
-compile(export_all).

checkRange(X) ->
    if
        X   < 0 -> io:write('under');
        100 < X -> io:write('over');
        true    -> io:write('middle')
    end,
    io:nl().
