-module (hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].
% hhfuns:map(fun(X) -> X + 1 end, L).
% hhfuns:map(fun(X) -> X + 1 end, L).

incr(X) -> X + 1.
decr(X) -> X - 1.
% hhfuns:map(fun hhfuns:incr/1, [1, 2, 3]).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

% inject in Ruby
fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).
% [H|T] = [1, 7, 3, 5, 9, 0, 2, 3].
% hhfuns:fold(fun(A, B) when A > B -> A; (_, B) -> B end, H, T). % max
% hhfuns:fold(fun(A, B) when A < B -> A; (_, B) -> B end, H, T). % min
% hhfuns:fold(fun(A, B) -> A + B end, 0, lists:seq(1, 6)). % sum
