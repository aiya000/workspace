-module(takeuchi).
-export([takeuchi/3]).

takeuchi(X, Y, Z) when X =< Y -> Z;
takeuchi(X, Y, Z)
    -> A = takeuchi(X - 1, Y, Z),
       B = takeuchi(Y - 1, Z, X),
       C = takeuchi(Z - 1, X, Y),
       takeuchi(A, B, C).
