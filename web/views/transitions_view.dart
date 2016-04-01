part of animation_studio;

class TransitionsView extends StageView{


  @override
  onSelectEnd(List<Skeleton> targets, List<Skeleton> landing) {
    print('transitions');
  }

  @override
  onSelectMove(List<Part> targets, int deltaX, int deltaY) {
    // TODO: implement onSelectMove
  }

  @override
  onSelectStart(List<Part> targets) {

  }
}