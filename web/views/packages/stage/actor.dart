part of stage;

abstract class Actor {

  int order = 0;
  Stage stage;

  List<Action> actions = new List();
  List<Action> newActions = new List();
  List<Action> endedActions = new List();

  addAction(Action action) {
    action.start();
    newActions.add(action);
    stage?.valid = false;
  }

  update(double deltaTime) {
    actions.addAll(newActions);
    newActions.clear();

    endedActions.clear();

    if (actions.length > 0) stage?.valid = false;

    actions.forEach((action) {
      if (!action.ended) {
        action.animate(deltaTime);
      } else
        endedActions.add(action);
    });

    endedActions.forEach((endedAction) {
      actions.remove(endedAction);
      endedAction.finish();

      if (endedAction.repeating) {
        endedAction.repeat();
        newActions.add(endedAction);
        stage?.valid = false;
      }
    });
  }


}
