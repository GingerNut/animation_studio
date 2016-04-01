part of stage;

class Tween extends Action {
  Transition transition;
  Set<Transition> transitions = new Set();
  Part part;
  num delta;
  double period;
  double _deltaX = 0.0;
  Transition transitionX;
  double _deltaY = 0.0;
  Transition transitionY;
  double _deltaSize = 0.0;
  Transition transitionSize;

  Tween(Part part, num time) {
    period = time;
    this.part = part;
    this.repeating = repeating;
  }

 onGo() async {

    if(transitionX == null) {
      if(transition == null) transition = Transition.getTransition(Transition.linear);
      transitionX = transition;

    }

    if(transitionY == null) {
      if(transition == null) transition = Transition.getTransition(Transition.linear);
      transitionY = transition;

    }

    if(transitionSize == null) {
      if(transition == null) transition = Transition.getTransition(Transition.linear);
      transitionSize = transition;

    }

    transitions.add(transitionX);
    transitions.add(transitionY);
    transitions.add(transitionSize);

    transitions.forEach((transition) => transition.action = this);

    part.stage?.juggler?.addAction(this);

  }

   set x (double move){
    _deltaX = move - part.x;
  }

  set y (double move){
    _deltaY = move - part.y;
  }

  set size (double move){
    _deltaSize = move - part.scale;
  }


  stop(){
    ended = true;
    repeating = false;
  }

  pause(){
    paused= true;
  }

  @override
  animate(double deltaTime) {
    super.animate(deltaTime);

    transitions.forEach((transition) => transition.update());

   part.x += _deltaX * transitionX.delta;
    part.y += _deltaY * transitionY.delta;
    part.scale += _deltaSize * transitionSize.delta;
   }


  @override
  finish() {
    super.finish();

    transitions.forEach((transition) => transition.finish());

    part.x += _deltaX * transitionX.delta;
    part.y += _deltaY * transitionY.delta;
    part.scale += _deltaSize * transitionSize.delta;

  }

  @override
  onAnimate(double deltaTime) {

  }

  @override
  onFinish() {

  }

  @override
  onRepeat() {

  }

  @override
  onStart() {

  }
}
