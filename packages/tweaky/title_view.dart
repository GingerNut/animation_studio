part of tweaky;

class TitleView extends View{

  String text ='';
  String graphic;

  TitleView({this.text ,this.graphic}) : super();

  attach(View parent) {
    super.attach(parent);

    container.text = text;
   }

  setText(String string){
    container.text = string;
  }



  measure(int height, int width){

    super.measure(height, width);

    container.style.textAlign = 'center';
    container.style.fontSize = '${(height * 2 ~/3)}' + 'px';
    container.style.lineHeight = '${height}px';
  }


}