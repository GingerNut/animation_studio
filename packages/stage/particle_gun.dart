part of stage;

class ParticleGun extends Part {


  int size =3;

    ParticleGun(num x, num y){
      this.x = x;
      this.y = y;
    }

  onDraw() {


    stage.context.fillStyle   = '#ff0000';
     stage.context.fillRect  (x, y, x + size, y + size);

  }

  onAnimate(double deltaTime) {

  }

  onFinish() {

  }

  onStart() {

  }

  onRepeat() {

  }

}
