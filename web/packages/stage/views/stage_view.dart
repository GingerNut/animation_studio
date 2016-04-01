part of stage;

abstract class StageView extends View{

  List<Stage> stages = new List();
  List<Skeleton> selected = new List();

  Renderloop loop;
  bool mouseDown = false;
  int lastX = 0;
  int lastY = 0;

  draw(){
    stages.forEach( (stage) => stage.draw());
  }

  update(double deltaTime){
    stages.forEach( (stage) => stage.update(deltaTime));
    stages.forEach( (stage) => stage.draw());
  }

  attach(View parent){
    container.children.clear();
    super.attach(parent);
    loop = new Renderloop(this);

    parent.container.onMouseUp.listen(selectEnd);
    parent.container.onMouseMove.listen(selectMove);
    parent.container.onMouseDown.listen(selectStart);
  }

  redraw(){
    stages.forEach( (stage) => stage.forceDraw());
  }

  List<Part> pointedAt(int x, int y){
    List<Skeleton> pointedAt = new List();
    stages.forEach((stage) => stage.pointedAt(pointedAt,x,y));
    return pointedAt;
  }

  selectStart(MouseEvent event){

    int x = event.offset.x;
    int y = event.offset.y;

    selected = pointedAt(x, y);
    selected.forEach( (part) => part.onSelect());
    onSelectStart(selected);

    lastX = x;
    lastY = y;
    mouseDown = true;
  }

  onSelectStart(List<Part> targets);

  selectEnd(MouseEvent event){

    int x = event.offset.x;
    int y = event.offset.y;

    List<Skeleton> landingSpace = pointedAt(x,y);

    selected.forEach((part) => landingSpace.remove(part));

    onSelectEnd(selected, landingSpace);
    selected.clear();
    mouseDown = false;
  }

  onSelectEnd(List<Skeleton> targets, List<Skeleton> landing);

  selectMove(MouseEvent event){

    int x = event.offset.x;
    int y = event.offset.y;

    int deltaX = x - lastX;
    int deltaY = y - lastY;

    lastX = x;
    lastY = y;

    if(mouseDown){
      selected.forEach((part) {
        if(part.draggable) part.drag(deltaX, deltaY);
      });
      onSelectMove(selected, deltaX, deltaY);
     } else {
      List<Skeleton> newSelected = new List();
      stages.forEach((stage) => stage.pointedAt(newSelected,x,y));

      selected.forEach((part){
        if(!newSelected.contains(part)) part.onLeave();
      });

      newSelected.forEach((part){
        if(!selected.contains(part)) part.onHover();
      });
      selected = newSelected;
    }
  }

  onSelectMove(List<Part> targets, int deltaX, int deltaY);
}