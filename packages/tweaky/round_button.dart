part of tweaky;

class RoundButton extends FloatingPanel{

  String mouseoverColour;
  String mousedownColour;
  String symbol = '+';

  RoundButton(var relX, var relY, var size) : super (relX, relY, size, size);

  attach(View parent){

    parent.container.children.add(container);
    floating = true;
    movable = false;
    container.text = symbol;
    container.style.zIndex = '50';
    container.style.position = 'absolute';

    container.style.textAlign = 'center';
    container.style.fontWeight = 'bold';

    if(!overrideStyles){
      mouseoverColour = View.styles.actionButtonHoverColour;
      mousedownColour = View.styles.actionButtonPressColour;
      container.style.background = View.styles.actionButtonColour;
      container.style.color = View.styles.actionButtonTextColour;
      container.style.boxShadow = View.styles.boxShadow;
    }

    container.onMouseOver.listen((e) => container.style.background = mouseoverColour);
    container.onMouseLeave.listen((e) => container.style.background = View.styles.actionButtonColour);
    container.onMouseDown.listen((e){
      container.style.background = mousedownColour;
      container.style.boxShadow = '';
    } );

    container.onMouseUp.listen((e){
      container.style.background = View.styles.actionButtonColour;
      container.style.boxShadow = View.styles.boxShadow;
    });


  }

  measureFloat(int height, int width){

    top = height *relY ~/100;
    left = width *relX ~/100;
    int radius = height * relHeight ~/ 100;


    container.style.fontSize = '${(radius * 2 ~/3)}' + 'px';
    container.style.lineHeight = '${radius}px';

    container.style.left = '${left}px';
    container.style.top = '${top}px';
    container.style.height = '${radius}px';
    container.style.width = '${radius}px';
    container.style.borderRadius = '${radius}px';
    container.style.lineHeight = '${radius}px';
  }

  void set action(var func){
    container.addEventListener('click', func, false);
  }



}