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
      posX = 40 + (pageMatch) * spacing;
    }
    if (!myKO) {
      fill(10);
      noStroke();
      circle(posX, posY, 15);
      fill(204, 102, 0);
      circle(posX, (posY+60), 15);
      graph.drawArrow(posX, posY+30, myKO);
    } else {
      fill(204, 102, 0);
      noStroke();
      circle(posX, posY, 15);
      fill(10);
      circle(posX, (posY+60), 15);
      graph.drawArrow(posX, posY+30, myKO);
    }
  }
  void displayHeatMap(int match) {
    float endY = map(calculateKOs(match), 0, 8, 920, 200);
    int endX =40 + (width-80)/100 * (match - ((dataPage-1)*25));
    float startY = map(calculateKOs(match-1), 0, 8, 920, 200);
    int startX = 40 + (width-80)/100 * ((match-1) - ((dataPage-1)*25));
    fill(10);
    println(match);
    setGradient(startX, startY, endY, endX);
    
  }
  int calculateKOs(int m) {
    int KOAmount = 0;
    for (KOEvent event : events) {
      if (event.match == m) {
        KOAmount++;
      }
    }
    return KOAmount;
  }
  void setGradient (int startX, float startY, float endY, int endX) {
    for (float y = startY; y <= height-40; y++) {
      float step = map(y, height-40, 0, 0, 2);

      int gradient = lerpColor(color(0, 70, 255), color(255, 0, 0), step);

      stroke(gradient);
      strokeWeight(3);
      line(startX, y, endX, endY);
    }
  }
}
