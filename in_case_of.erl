-module (in_case_of).
-compile(export_all).

beach(Temperature) ->
  case Temperature of
    {celsius, N} when N >= 20, N =< 45 -> 'favorable';
    {kelvin, N} when N >= 293, N =< 318 -> 'scientifically favorable';
    {fahrenheit, N} when N >= 68, N =< 113 -> 'favorable in the US';
    _ ->
    'avoid beach'
  end.
