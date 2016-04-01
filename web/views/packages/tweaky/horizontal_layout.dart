part of tweaky;



class HorizontalLayout extends Layout{

  attach(View parent){
    super.attach(parent);

    container.style.display = 'inline-block';

    for(View child in layoutNodes){
      child.container.style.display = 'inline-block';
    }

  }

  measureChild(View child, int height, int width){

    int childWidth = (width * child.weight) ~/ childTotalWeight;
    childWidth = min(totalWidth, childWidth);
    totalWidth -= childWidth;
    child.measure(height, childWidth);
  }



}