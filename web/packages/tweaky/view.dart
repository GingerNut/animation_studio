part of tweaky;

class View extends ViewFrame{

  static Styles styles;

  DivElement container = new DivElement();
  var _weight = 1.0;
  var _weightUsed = 1.0;        // allows view to be hidden and reshown remembering weight;
  List<ViewFrame> layoutNodes = new List();

  bool floating = false;
  bool overrideStyles = false;
  String _background = '';
  String _textColour = '';

  set background (String colour){
    _background = colour;
    container.style.background = colour;
  }

  set textColour(String colour){
    _textColour = colour;
    container.style.color = colour;
  }

  set transparent(bool transparent){
    if(transparent) container.style.opacity = '0.0';
    else container.style.opacity = '1.0';
  }

  set weight(var weight){
    _weight = weight;
    _weightUsed = weight;
  }

  get weight => _weightUsed;

  add(ViewFrame view){
    layoutNodes.add(view);
  }

  attachChildren(View parent){
    for(ViewFrame child in layoutNodes){
      child.attach(parent);
    }
  }


  attach(View parent){
    this.parent = parent;
    parent.container.children.add(container);

    if(_background == '')container.style.background = styles.backgroundColour;
    else container.style.background = _background;

    if(_textColour == '')container.style.color = styles.textColour;
    else container.style.color = _textColour;

    attachChildren(parent);

    onAttach(container);
  }

  onAttach(DivElement container){}

  measure(int height, int width){

    this.height = height;
    this.width = width;

    container.style.height = '$height' + 'px';
    container.style.width = '$width' + 'px';

    layoutNodes.forEach((child) => child.measure(height, width));

    onMeasure(height, width);
  }

  reMeasure(){
    measure(height, width);
  }

  onMeasure(int height, int width){}

  measureFloat(int height, int width){}

  setRandomColour(){
    Random random = new Random();

    var letters = '0123456789ABCDEF';
    var color = '#';
    for (int i = 0; i < 6; i++ ) {
      int rand = (random.nextDouble() * 16).toInt();
      color += letters[rand];
    }
    container.style.background = color;
  }

  hide(){
    container.style.visibility = 'hidden';
    if(!floating) _weightUsed = 0;

    if(parent != null) parent.reMeasure();
  }

  show(){
    container.style.visibility = 'visible';
    _weightUsed = _weight;

    if(parent != null) parent.reMeasure();
  }


}