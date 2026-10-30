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
    int pageMatch = match - ((dataPage-2)*25);
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
      fill(10);
    } else {
      fill(204, 102, 0);
      noStroke();
      circle(posX, posY, 15);
      fill(10);
      circle(posX, (posY+60), 15);
      graph.drawArrow(posX, posY+30, myKO);
    }  
    text(match,(40 + (pageMatch) * spacing),940);
  }
  void displayHeatMap(int match) {
    float endY = map(calculateKOs(match), 0, 8, 920, 200);
    int endX = 40 + (width-80)/100 * (match - ((dataPage-1)*25));
    float startY = map(calculateKOs(match-1), 0, 8, 920, 200);
    int startX = 40 + (width-80)/100 * ((match-1) - ((dataPage-1)*25));
    fill(10);
    setGradient(startX, startY, endY, endX, match);
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
  void setGradient (int startX, float startY, float endY, int endX,int match) {
    float parts = 100.0;
    int gradient;
    for (int i = 0; i <= parts; i++) {
      float part1 = i / (float) parts;
      float part2 = (i+1) / (float) parts;
      // lerp() - Calculates a number between two numbers at a specific increment.
      float posXOne = lerp(startX, endX, part1);
      float posYOne = lerp(startY, endY, part1);
      float posXTwo = lerp(startX, endX, part2);
      float posYTwo = lerp(startY, endY, part2);
      float amp = map(posYOne,40,1080,0.0,1.0);
      // Self Note: Blue - (0,82,255), Red - (255,0,0), Orange - (255,128,0)
      gradient = lerpColor(color(255,0,0),color(0,82,255),amp);
      stroke(gradient);
      
      
      line(posXOne,posYOne,posXTwo,posYTwo);
      // Gap of 18 on X, Gap of 75 on Y
      text(i,(40+(18*i)),940);
      if (i <= 8) {
        text(i, 20,(920 - (i*75)));
      }
    }
    
  }
}
