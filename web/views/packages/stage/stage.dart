library stage;

import 'package:tweaky/tweaky.dart';
import 'package:colour/colour.dart';
import 'dart:html';
import 'dart:math';
import 'dart:async';

part 'part.dart';
part 'actor.dart';
part 'attachment.dart';
part 'bone.dart';
part 'skeleton.dart';
part 'package:stage/action/action.dart';
part 'package:stage/action/tween.dart';
part 'particle.dart';
part 'particle_gun.dart';
part 'animations/colour_action.dart';
part 'views/stage_view.dart';
part 'views/renderloop.dart';
part 'juggler.dart';
part 'action/animation.dart';
part 'transitions/transition.dart';
part 'transitions/linear_transition.dart';
part 'transitions/ballistic_transition.dart';


class Stage extends ViewFrame {
  Juggler juggler;
  var view;
  CanvasElement canvas;
  CanvasRenderingContext2D context;
  bool _valid = false;
  List<Actor> actors = new List();

  get valid => _valid;

  set valid(bool valid) {
    _valid = valid;
  }

  int z;



  Stage(this.view, [int z = 0]) {
    this.z = z;
    view.add(this);
    view.stages.add(this);
    juggler = new Juggler();
  }

  attach(View parent) {
    canvas = new CanvasElement();
    context = canvas.context2D;
    canvas.style.position = 'absolute';
    canvas.style.zIndex = z.toString();
    view.container.children.add(canvas);
  }

  measure(int height, int width) {
    canvas.width = width;
    canvas.height = height;
  }

  clear() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  add(Actor newActor) {
    if (actors.contains(newActor)) return;

    if (newActor.stage != null) {
      newActor.stage.valid = false;
      newActor.stage.actors.remove(newActor);
    }

    if (actors.length == 0)
      actors.add(newActor);
    else {
      int position = 0;
      bool added = false;

      for (int i = 0; i < actors.length; i++) {
        if (newActor.order < actors[i].order) {
          position = i;
          added = true;
          break;
        }
        ;
      }

      if (added)
        actors.insert(position, newActor);
      else
        actors.add(newActor);
    }

    newActor.stage = this;

    if (newActor is Skeleton) {
      newActor.parts.forEach((part) => add(part));
    }
    valid = false;
  }

  remove(Actor actor) {
    actors.remove(actor);
    actor.stage = null;
  }

  removeAll() {
    while (actors.length > 0) {
      actors.remove(actors.last);
    }
  }

  update(double deltaTime){
    juggler.update(deltaTime);
    actors.forEach((blob) => blob.update(deltaTime));
  }

  forceDraw(){
    valid = false;
    draw();
  }

  draw() {
    if (!valid) {
      clear();

      actors.forEach((part) {if(part is Part)part.draw();} );
    }
    valid = true;
  }

  List<Part> pointedAt(List<Part> targets, int x, int y){
      actors.forEach((actor){
        if(actor is Skeleton && actor.contains(x,y)) targets.add(actor);
      });
    return targets;
  }
}
