-module (recursion).
-compile(export_all).

fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).

fac_tail(N) -> fac_tail(N, 1).
fac_tail(0, Acc) -> Acc;
fac_tail(N, Acc) when N > 0 -> fac_tail(N - 1, N * Acc).

reserve([]) -> [];
reserve([H|T]) -> reserve(T) ++ [H].

reserve_tail(L) -> reserve_tail(L, []).
reserve_tail([], Acc) -> Acc;
reserve_tail([H|T], Acc) -> reserve_tail(T, [H|Acc]).

zip([], _) -> [];
zip(_, []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y}|zip(Xs, Ys)].

zip_tail(L1, L2) -> zip_tail(L1, L2, []).
zip_tail([], _, Acc) -> Acc;
zip_tail(_, [], Acc) -> Acc;
zip_tail([X|Xs], [Y|Ys], Acc) -> zip_tail(Xs, Ys, Acc++[{X, Y}]).
