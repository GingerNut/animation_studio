part of tweaky;


class VerticalLayout extends Layout{

  @override
  measureChild(View child, int height, int width){

    int childHeight = (height * child.weight) ~/ childTotalWeight ;
    childHeight = min(totalHeight, childHeight);
    totalHeight -= childHeight;
    child.measure(childHeight, width);

  }
}

