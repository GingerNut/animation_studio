library animation_studio;

import 'package:stage/stage.dart';
import 'package:tweaky/tweaky.dart';

part 'views/animation_screen.dart';
part 'views/animation_panel.dart';
part 'views/transitions_view.dart';
part 'views/summary_panel.dart';


void main() {
   new AnimationScreen().set(new Styles());
}
