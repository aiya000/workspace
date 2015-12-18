-module(localvar).
-compile(export_all).

succ(N) ->
    M = N + 1,  % N and M are local variables
    M.
