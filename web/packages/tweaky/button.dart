part of tweaky;

class Button extends View{

  String mouseoverColour;
  String mousedownColour;

  String text ='';
  String hoverText;
  String graphic;

  Button({this.text, this.hoverText, this.graphic}) : super();

  attach(View parent) {
    super.attach(parent);

    if(!overrideStyles){
      mouseoverColour = View.styles.buttonHoverColour;
      mousedownColour = View.styles.buttonPressColour;
      container.style.background = View.styles.buttonBackgroundColour;
      container.style.color = View.styles.buttonTextColour;
      container.style.border = "${View.styles.borderSize}px solid " + View.styles.textColour;
      container.style.borderRadius = '${View.styles.buttonCornerRadius}px';
      container.style.margin = '${View.styles.buttonMargin}px';
      container.style.boxShadow = View.styles.boxShadow;

      container.style.transition = View.styles.transition;
    }

    container.onMouseOver.listen((e) {
      container.style.background = mouseoverColour;
      container.style.boxShadow = View.styles.hover;
    } );
    container.onMouseLeave.listen((e) {
      container.style.background = View.styles.buttonBackgroundColour;
      container.style.boxShadow = View.styles.boxShadow;
    });
    container.onMouseDown.listen((e){
      container.style.background = mousedownColour;
      container.style.boxShadow = '';
    } );

    container.onMouseUp.listen((e){
      container.style.background = View.styles.buttonBackgroundColour;
      container.style.boxShadow = View.styles.boxShadow;
    });
    container.text = text;
  }

  measure(int height, int width){

    height = height - View.styles.borderSize *2 - View.styles.buttonMargin*3;
    width = width - View.styles.borderSize *2 - View.styles.buttonMargin*3;

    super.measure(height, width);

    container.style.textAlign = 'center';
    container.style.fontSize = '${(height * 2 ~/3)}' + 'px';
    container.style.lineHeight = '${height}px';
  }

  void set action(var func){
    container.addEventListener('click', func, false);
  }
}