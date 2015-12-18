-module(operator).
-compile(export_all).

numeric(_) ->
    A = 1 + 2,
    B = 2 - 3,
    C = 3 * 4,
    D = 10 div 5,
    E = 13 rem 6,
    F = 7 / 8,
    G = -10,
    [A, B, C, D, E, F, G].

boolean(_) ->
    A = 10 >  9,
    B = 10  < 9,
    C = 10 >= 9,
    D = 10 =< 9,
    E = 20 ==  20.0,  % ignoring date type
    F = 20 =:= 20.0,
    G = 20 /=  20.0,
    H = 20 =/= 20.0,
    I = true  and     true, % 'and' eval second value
    J = true  andalso true, % if first value is false, 'andalso' don't eval second value
    K = false or      true,
    L = false orelse  true,
    [A, B, C, D, E, F, G, H, I, J, K, L].
