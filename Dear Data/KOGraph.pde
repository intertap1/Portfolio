class KOGraph {
  int MatchesPerPage = 24;
  String battleInfo = "";
  void drawData(KOEvent[] events, int page) {
    background(255);
    setupGraph();
    switch (page) {
    case 1:
      for (int m = 1; m<=100; m++) {
        for (KOEvent event : events) {
          if (event.match == m) {
            event.displayHeatMap(m);
          }
        }
      }
      break;
    case 2:
      for (int m = 1; m <= 25; m++) {
        for (KOEvent event : events) {
          if (event.match == m) {
            event.display();
          }
        }
      }
      break;
    case 3:
      for (int m = 26; m <= 50; m++) {

        for (KOEvent event : events) {
          if (event.match == m) {
            event.display();
          }
        }
      }
      break;
    case 4:
      for (int m = 51; m <= 75; m++) {
        for (KOEvent event : events) {
          if (event.match == m) {
            event.display();
          }
        }
      }
      break;
    case 5:
      for (int m = 76; m <= 100; m++) {
        for (KOEvent event : events) {
          if (event.match == m) {
            event.display();
          }
        }
      }
      break;
    }
    displayBattleInfo(battleInfo);
  }
  void setupGraph() {
    float bottom = height-40;
    float top = 40;
    float right = width-40;
    float left = 40;
    stroke(0);
    strokeWeight(6);
    line(left, top, left, bottom);
    line(left, bottom, right, bottom);
  }
  void drawArrow(int posX, int posY, boolean AllyKO) {
    if (AllyKO) {
      triangle((posX-5), (posY), posX, (posY+10), (posX+5), posY);
      beginShape();
      vertex((posX-2.5), posY);
      vertex((posX-2.5), (posY-10));
      vertex((posX+2.5), (posY-10));
      vertex((posX+2.5), posY);
      endShape();
    } else {
      triangle((posX-5), (posY), posX, (posY-12.5), (posX+5), posY);
      beginShape();
      vertex((posX-2.5), posY);
      vertex((posX-2.5), (posY+10));
      vertex((posX+2.5), (posY+10));
      vertex((posX+2.5), posY);
      endShape();
    }
  }
  void displayBattleInfo(String battleInfo) {
    fill(255);
    fill(0);
    noStroke();
    textSize(15);
    text(battleInfo, 40, 940);
  }
  void getBattleInfo(int match, int order) {
    println("Match sent over: " + match + " Order sent over " + order);
    String text = "No KO found!";
    for (int i = 0; i < events.length; i++) {

      if (events[i].match == match && events[i].order == order) {
        text = "Match: " + events[i].match + "   Order: " + events[i].order + "   Attacking Pokemon: " + events[i].attacker + "   Defending Pokemon:" + events[i].defender + "   Ally KO: " + events[i].myKO;
        battleInfo = text;
      }
    }
  }
  void getMatchOrder(int mouseX, int mouseY, int currentPage) {
    if (currentPage == 1) {
      for (int x = 0; x <= 25; x++) {
        for (int y = 0; y <= 8; y++) {
          int circleXPos = floor((40 + (x - ((dataPage-1)*25)) * (width - 80) / 25));
          int circleYPos = floor(((80) + (y * 90)));
          if (dist(circleXPos, circleYPos, floor(mouseX), floor(mouseY)) <= 17) {
            int match = x;
            int order = y;
            graph.getBattleInfo(match, order);
          }
        }
      }
    } else if (currentPage <= 4) {
      for (int x = ((dataPage-1)*25); x <= (25*dataPage); x++) {
        for (int y = 0; y <= 8; y++) {
          int circleXPos = floor((100 + (x - ((dataPage-1)*25)) * (width - 80) / 25));
          int circleYPos = floor(((80) + (y * 90)));
          if (dist(circleXPos, circleYPos, floor(mouseX), floor(mouseY)) <= 15) {
            int match = x+1;
            int order = y;
            graph.getBattleInfo(match, order);
          }
        }
      }
    }
  }
}
