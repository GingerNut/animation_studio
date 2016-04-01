part of stage;


abstract class Transition{

  static const int linear = 1;
  static const int ballistic = 2;
  Action action;

  double lastTransition = 0.0;
  double delta = 0.0;

  update(){
    double thisTransit = transit();
    delta = thisTransit - lastTransition;
    lastTransition = thisTransit;
   }

   finish() {
    double thisTransit = transitFinish();
    delta = thisTransit - lastTransition;
  }

  double transit();

  double transitFinish();

  static Transition getTransition(int type){
    switch(type){
      case linear : return new LinearTransition();
      case ballistic : return new BallisticTransition();
   }
    return new LinearTransition();
  }


}