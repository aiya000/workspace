-module(hello).
-export([id/1]) .
% export or compile
% -export([id/1]) .
% -compile(export_all).

id(X) -> X.
