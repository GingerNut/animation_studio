part of stage;

class ColourAction extends Action{

  Colour colour;
  Colour target;

  double baseRDelta;
  double baseGDelta;
  double baseBDelta;

  double darkRDelta;
  double darkGDelta;
  double darkBDelta;

  ColourAction(this.colour, int targetColour){
    period = 2.0;
    target = new Colour(targetColour);

    baseRDelta = (target.base.r - colour.base.r)/period;
    baseGDelta = (target.base.g - colour.base.g)/period;
    baseBDelta = (target.base.b - colour.base.b)/period;

    darkRDelta = (target.dark.r - colour.dark.r)/period;
    darkGDelta = (target.dark.g - colour.dark.g)/period;
    darkBDelta = (target.dark.b - colour.dark.b)/period;
  }

   onAnimate(double deltaTime){
     colour.base.r += (baseRDelta * deltaTime).toInt();
     colour.base.g += (baseGDelta * deltaTime).toInt();
     colour.base.b += (baseBDelta * deltaTime).toInt();

     colour.dark.r += (darkRDelta * deltaTime).toInt();
     colour.dark.g += (darkGDelta * deltaTime).toInt();
     colour.dark.b += (darkBDelta * deltaTime).toInt();

     colour.base.valid = false;
     colour.dark.valid = false;
     stage?.valid = false;
   }

  onFinish(){
    colour.colour = target.colour;
    stage?.valid = false;
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