part of stage;

class Renderloop{

  StageView view;
  double timeBase = 0.0;

  Renderloop(this.view){
    start();
  }

  start(){

    this.view = view;

    window.requestAnimationFrame(loop);
  }


  loop(double time){

    double deltaTime = (time - timeBase)/1000;

      view.update(deltaTime);

      view.draw();

    timeBase = time;

    window.requestAnimationFrame(loop);
  }
}