part of stage;


class BallisticTransition extends Transition{

  @override
  double transit() {
    return sin(action.elapsed/action.period * PI);
  }

  @override
  double transitFinish() => 0.0;
}