-module(type).
-compile(export_all).

constInt(_)     -> 10.
constFloat(_)   -> 20.0.
constTuple(_)   -> {1, 2}.
constAtom(_)    -> atom.
constAtom1(_)   -> 'hello, world !'.
constChar(_)    -> $a.                    % but this is Int
constString(_)  -> "hello, world !".
constString1(_) -> [$h, $e, $l, $l, $o].  % String is Char List

% Tuple pattern matching
extractTuple(_) ->
    {X, Y} = {1, 2},
    X + Y.

% List pattern maching
head([X | _]) -> X.
tail([_ | XS]) -> XS.
headHead([X, Y | _]) -> [X, Y].
