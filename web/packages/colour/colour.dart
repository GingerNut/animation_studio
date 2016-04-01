library colour;

part 'definitions.dart';
part 'rgb_color.dart';

class Colour {
  static const BEIGE = 0;
  static const GREEN = 1;
  static const RED = 2;
  static const BLUE = 3;
  static const ORANGE = 4;
  static const PURPLE = 5;
  static const BROWN = 6;
  static const GREY = 7;
  static const BLACK = 8;

  int _colour;
  String _colourName;
  int r;
  int g;
  int b;

  RgbColor base;
  RgbColor dark;
  RgbColor highlight;

  Colour(this._colour){
    colour = _colour;
  }

  Colour.rgb(this.r, this.g, this.b);

  set baseColour(String string){
    base = new RgbColor.fromString(string);
  }

  set darkColour(String string){
    dark = new RgbColor.fromString(string);
  }

  set colourName(String string){
    _colourName = string;
  }

  get baseColour{
    return base.string;
  }

  get darkColour{
    return dark.string;
  }

  get colourName{
    return _colourName;
  }

  set colour(int newColour){
    _colour = newColour;

    switch (newColour)
    {
      case BEIGE:
        baseColour = '#FFFFC2';
        darkColour = '#CD853F';
        colourName = 'Beige';
        break;

      case GREEN:
        baseColour = '#008000';
        darkColour = '#245117';
        colourName = 'Green';
        break;

      case RED:
        baseColour = '#ff0000';
        darkColour = '#9f000f';
        colourName = 'Red';
        break;

      case BLUE:
        baseColour = '#0000ff';
        darkColour = '#0000a0';
        colourName = 'Blue';
        break;

      case BROWN:
        baseColour = '#a52a2a';
        darkColour = '#800000';
        colourName = 'Brown';
        break;

      case ORANGE:
        baseColour = '#ffa500';
        darkColour = '#cd7f32';
        colourName = 'Orange';
        break;

      case PURPLE:
        baseColour = '#800080';
        darkColour = '#7d0552';
        colourName = 'Purple';
        break;

      case GREY:
        baseColour = '#c0c0c0';
        darkColour = '#808080';
        colourName = 'Grey';
        break;

      case BLACK:
        baseColour = '#000000';
        darkColour = '#000000';
        colourName = 'Black';
        break;
    }
  }

  get colour => _colour;

}