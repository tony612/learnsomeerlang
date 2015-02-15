-module (hotload).
-compile(export_all).

server(State) ->
  receive
    update ->
      NewState = ?MODULE:upgrade(State),
      ?MODULE:server(NewState);
    _SomeMessage ->
      server(State)
  end.

upgrade(OldState) -> OldState.
