-module(fibonacci).
-compile(export_all).

fibonacci(0) -> 1;
fibonacci(1) -> 1;
fibonacci(N) when N > 100 -> ok;
fibonacci(N) when N < 0   -> ng;
fibonacci(N) -> fibonacci(N - 1) + fibonacci(N - 2).
