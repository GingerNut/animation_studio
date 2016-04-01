part of tweaky;

class FloatingPanel extends View{

  View _contents;
  bool mouseDown = false;
  bool movable = true;

  var relX;
  var relY;
  var relWidth;
  var relHeight;

  int top;
  int left;
  int floatHeight;
  int floatWidth;
  int mouseLastX;
  int mouseLastY;

  FloatingPanel(var posX, var posY, var width, var height): super(){
    this.relX = posX;
    this.relY = posY;
    this.relWidth = width;
    this.relHeight = height;
  }

  set contents(View view){
    _contents = view;
  }

  setContents(View view){
    this._contents = view;
  }

  attach(View parent){
    super.attach(parent);

    floating = true;

    container.style.zIndex = '100';
    container.style.position = 'absolute';
    container.style.boxShadow = View.styles.boxShadow;
    container.style.border = "${View.styles.borderSize}px solid " + View.styles.textColour;
    container.style.borderRadius = '${View.styles.floatPanelCornerRadius}px';


    _contents.attach(this);

    container.onMouseDown.listen((e){
      mouseDown = true;
      mouseLastX = e.client.x;
      mouseLastY = e.client.y;
    }
    );

    container.onMouseUp.listen((e){
      mouseDown = false;
    });

    container.onMouseLeave.listen((e){
      mouseDown = false;
    });

    container.onMouseMove.listen((e){
      if(mouseDown && movable){

        int dX = e.client.x - mouseLastX;
        int dY = e.client.y - mouseLastY;

        mouseLastX = e.client.x;
        mouseLastY = e.client.y;

        left += dX;
        top += dY;

        relX = left/window.innerWidth * 100 + relWidth/2;
        relY = top/window.innerHeight * 100 + relHeight/2;

        measureFloat(window.innerHeight, window.innerWidth);

      }
    });

    onAttach(container);
  }

  onAttach(Element element){}

  measureFloat(int height, int width){

    floatHeight = height * relHeight ~/100;
    floatWidth = width * relWidth ~/100;
    top = ((relY* height/100) - floatHeight/2).toInt();
    left = ((relX* width/100) - floatWidth/2).toInt();

    container.style.left = '${left}px';
    container.style.top = '${top}px';
    container.style.height = '${floatHeight}px';
    container.style.width = '${floatWidth}px';

    _contents.measure(floatHeight, floatWidth);

  }
}