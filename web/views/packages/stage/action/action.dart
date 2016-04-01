part of stage;

abstract class Action {
  Completer  _completer = new Completer();
  Stage stage;
  num elapsed;
  num period;
  bool ended = false;
  bool repeating = false;
  bool paused = false;
  Action next;

  animate(double deltaTime) {
    if(paused) return;

    elapsed += deltaTime;

    if (elapsed > period) {
      ended = true;
    } else
      onAnimate(deltaTime);
  }


  Future go() async {

    onGo();
    return _completer?.future;
  }

  onGo(){

  }


  start() {

    ended = false;
    elapsed = 0.0;
    onStart();
  }

  repeat() {
    ended = false;
    elapsed = 0.0;
    onRepeat();
  }

  finish() {
    onFinish();
    _completer.complete();
  }

  onAnimate(double deltaTime);

  onFinish();

  onStart();

  onRepeat();

  end() {
    repeating = false;
    ended = true;
  }
}
