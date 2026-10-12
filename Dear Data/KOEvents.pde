int posX;

class KOEvent {
  int match;
  int order;
  String attacker;
  String defender;
  boolean myKO;

  KOEvent (int m, int o, String a, String d, boolean allyKO) {
    match = m;
    order = o;
    attacker = a;
    defender = d;
    myKO = allyKO;
  }
  void display() {
    int pageMatch = match - ((dataPage-1)*25);
    int monGap = order * 90;
    int spacing = (width - 80) / 25;
    int posY = ((0+80) + monGap);
    if (dataPage == 1) {
      posX = 40 + (pageMatch) * spacing;
    } else {
      posX = 80 + (pageMatch -1) * spacing;
    }
    if (!myKO) {
      fill(10);
    } else {
      fill(204, 102, 0);
    }
    noStroke();
    circle(posX, posY, 5);
    circle(posX, (posY+60), 5);
    drawArrow(posX, posY+30, myKO);
  }
}
