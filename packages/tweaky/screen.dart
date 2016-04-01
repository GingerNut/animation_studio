part of tweaky;

class Screen {

  Layout layout;

  set(Styles styles) {
    View.styles = styles;

    document.body.style.fontFamily = View.styles.font;
    document.body.style.padding = '0';
    document.body.style.margin = '0';
    document.body.style.background = styles.backgroundColour;
    document.body.style.overflow = 'hidden';
    document.body.style.userSelect = 'none'; // prevents text selection
    document.body.onContextMenu.listen((MouseEvent e) => e.preventDefault()); // disable right click???

    layout.attachToBody(this);
    setSize(null);
    window.onResize.listen(setSize);

    onReady();
  }

  onReady(){}

  setSize(Event e){
    layout.measure(window.innerHeight, window.innerWidth);
  }


}
