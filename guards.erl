-module (guards).
-compile(export_all).

old_enough(X) when X >= 16, X =< 104 -> true;
old_enough(_) -> false.

wrong_age(X) when X < 16; X > 104 -> true;
wrong_age(_) -> false.
