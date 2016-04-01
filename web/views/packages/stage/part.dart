part of stage;

abstract class Part extends Actor {

  Point home;
  Point location;
  bool draggable = false;

  double _x = 0.0;
  double _y = 0.0;
  double _scale = 1.0;

  get x => _x;
  get y => _y;

  set x(num x) {
    _x = x;
    stage?.valid = false;
  }

  set y(num y) {
    _y = y;
    stage?.valid = false;
  }

  set scale(double newScale){
    _scale = newScale;
    onScaleChanged(newScale);
  }

  get scale => _scale;


  setHome(num x, num y) {
    home = new Point(x, y);
  }


  Future animateMove (double newX, double newY, double period)async{
    Tween tween = new Tween(this, period)
      .. x = newX
      ..y = newY
      ..size = 1.2
      ..transitionSize = Transition.getTransition(Transition.ballistic)
    ;

    return tween.go();;
  }

  draw() {
    if (stage == null) return;

    onDraw();
  }

  selected(){}

  dragTo(List<Part> targets){}

  onScaleChanged(double scale){}

  onDraw();

  onHover(){}

  onLeave(){}

  onSelect(){}

  onDragTo(){}

  drag(int deltaX, int deltaY) {
    x += deltaX;
    y += deltaY;

    onDrag(deltaX, deltaY);
  }

  onDrag(int deltaX, int deltaY) {}

}
