part of tweaky;

class TextView extends View{

  String text;

  attach(View parent) {
    super.attach(parent);

    container.text = text;
  }

  measure(int height, int width){
    super.measure(height, width);
    if(!overrideStyles)container.style.color = View.styles.textColour;
    container.style.textAlign = 'center';
    container.style.verticalAlign = 'center';
    container.style.fontSize = '${(height ~/4)}' + 'px';

  }

}