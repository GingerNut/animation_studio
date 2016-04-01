part of stage;

class Schedule extends Action{
  List<Tween> actions = new List();

  int currentTween = 0;

  animate(double deltaTime) {
    actions[currentTween].animate(deltaTime);

    if (actions[currentTween].ended) {
      currentTween += 1;
      if (currentTween > actions.length - 1) {
        currentTween = 0;
        if (!repeat) ended = true;
      }
    }
  }

  @override
  onAnimate(double deltaTime) {
    // TODO: implement onAnimate
  }

  @override
  onFinish() {
    // TODO: implement onFinish
  }
}
