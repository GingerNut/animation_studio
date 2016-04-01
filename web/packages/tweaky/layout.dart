part of tweaky;


abstract class Layout extends View{

  double childTotalWeight = 0.0;
  int totalWidth;
  int totalHeight;



  attach(View parent){
    super.attach(parent);

    container.style.margin = '0';
    container.style.padding = '0';

    attachChildren(this);
  }


  attachToBody(Screen screen){
    document.body.children.clear();
    document.body.children.add(container);
    attachChildren(this);
  }


  measure(int height, int width){
    super.measure(height, width);

    totalHeight = height;
    totalWidth = width;

    childTotalWeight = 0.0;

    for(View child in layoutNodes){
      if(!child.floating)childTotalWeight += child.weight;
    }

    for(View child in layoutNodes){
      if(!child.floating)measureChild(child, height, width);
      else child.measureFloat(height, width);
    }
  }

  measureChild(View child, int height, int width);

}