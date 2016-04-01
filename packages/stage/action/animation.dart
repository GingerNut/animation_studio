part of stage;

class Animation extends Action{

  List<Action> actions = new List();
  Part part;

  Animation(this.part);

   add(Action action){
    actions.add(action);
  }

  onGo(){
    actions.forEach((action) =>action.start());
    part.stage.valid = false;
  }



  @override
  onAnimate(double deltaTime) {
   actions.forEach((action) => action.animate(deltaTime));
  }

  @override
  onFinish() {
    // TODO: implement onFinish
  }

  @override
  onRepeat() {
    // TODO: implement onRepeat
  }

  @override
  onStart() {
    // TODO: implement onStart
  }
}