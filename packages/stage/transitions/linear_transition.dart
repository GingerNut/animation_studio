part of stage;


class LinearTransition extends Transition{

  @override
  double transit() => action.elapsed / action.period;

  @override
  double  transitFinish() => 1.0;
}