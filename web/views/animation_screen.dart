part of animation_studio;

class AnimationScreen extends Screen{

  TransitionsView transitionView = new TransitionsView();
  SummaryPanel summaryPanel = new SummaryPanel();
  AnimationPanel animationPanel = new AnimationPanel();

  AnimationScreen(){
    layout = new VerticalLayout()
    ..add(new HorizontalLayout()
      .. add(new VerticalLayout()
          ..add(transitionView)
          .. add(animationPanel)
          ..weight = 2)
      ..add(summaryPanel)
    );
  }
}