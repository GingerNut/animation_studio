part of animation_studio;

class AnimationScreen extends Screen{

  TransitionsView transitionView = new TransitionsView();
  SummaryPanel summaryPanel = new SummaryPanel();
  AnimiationPanel animationPanel = new AnimationPanel();

  AnimationScreen(){

    layout = new HorizontalLayout()
      ..add(transitionView)
      ..add(summaryPanel)
      .. add(animationPanel);

  }


}