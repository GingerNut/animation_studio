part of colour;

class RgbColor{

  int _r;
  int _g;
  int _b;

  String _string;
  bool valid = false;

  RgbColor(r, g, b){
    this.r = r;
    this.g = g;
    this.b = b;
  }

  RgbColor.fromString(String string){

    string = string.substring(1,string.length);

    String rString = string.substring(0,2);

    r = int.parse("0x" + rString);

    String gString = string.substring(2,4);

    g = int.parse("0x" + gString);

    String bString = string.substring(4,6);

    b = int.parse("0x" + bString);
 }

  get r => _r;
  get g => _g;
  get b => _b;

  set r(int value){
    _r = bound(value);
   }

  set g(int value){
    _g = bound(value);
  }

  set b(int value){
    _b = bound(value);
  }

  int bound(int value){
    if (value < 0) value = 0;
    if(value > 255) value = 255;
    return value;
  }


  get string{
    if(_string != null && valid) return _string;

    getString(int number){
      String string = number.toRadixString(16);
      while(string.length < 2){
        string = '0' + string;
      }
      return string;
    }

    _string = '#' + getString(r) + getString(g) + getString(b);

    valid = true;

    return _string;
  }

  String toString() => "r: $r, g: $g, b: $b";

  String toCssString() => 'rgb(${r.toInt()}, ${g.toInt()}, ${b.toInt()})';

}