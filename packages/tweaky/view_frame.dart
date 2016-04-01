part of tweaky;

abstract class ViewFrame{

  View parent;
  int height;
  int width;

  attach(View parent);

  measure(int height, int width);

}