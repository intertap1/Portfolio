int rowCount;
KOEvent[] events;

void setup() {
  size(1900, 960);
  background(255);
}

void draw() {
  frameRate(1);
  float bottom = height-40;
  float top = 40;
  float right = width-40;
  float left = 40;
  strokeWeight(6);
  line(left, top, left, bottom);
  line(left, bottom, right, bottom);
  setupTable();
  for (int i = 0; i < events.length; i++) {
    events[i].display();
  }
};

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
    int monGap = order * 90;
    int posX = (((width-80)/100) * match) + 40;
    int posY = ((0+80) + monGap);
    if (!myKO) {
      fill(10);
    } else {
      fill(204, 102, 0);
    }
    noStroke();
    circle(posX, posY, 5);
    circle(posX, (posY+60),5);
    drawArrow(posX, posY+30, myKO);
  }
  
}

String displayBattleInfo(int match, int order) {
    String text = "No KO found!";
    for (int i = 0; i < events.length; i++) {
      if (events[i].match == match && events[i].order == order) {
        text = "Match: " + events[i].match + "   Order: " + events[i].order + "   Attacking Pokemon: " + events[i].attacker + "   Defending Pokemon:" + events[i].defender + "   Ally KO: " + events[i].myKO;
      }
    }
    return text;
  }


void setupTable() {
  Table data = loadTable("Data.csv", "header");
  events = new KOEvent[data.getRowCount()];
  rowCount = 0;
  for (TableRow row : data.rows()) {
    int match = row.getInt("match");
    int order = row.getInt("order");
    String attacker = row.getString("attacker");
    String defender = row.getString("defender");
    boolean myKO = row.getString("myKO").equals("TRUE");

    events[rowCount] = new KOEvent (
      match,
      order,
      attacker,
      defender,
      myKO
      );
    rowCount++;
  }
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

void mousePressed() {
  for (int i = 0; i <= rowCount; i++) {
    for (int j = 0; j <= 8; j++) {
      if (dist(mouseX, mouseY, ((i*10)+40), (80+(80*j))) <= 10) {
        println("Match", i, "KO Order", j);
        println(mouseX,mouseY);
        fill(255);
        rect(40,925,960,25);
        fill(0);
        String battleInfo = displayBattleInfo(events[i].match, events[j-1].order);
        textSize(15);
        text(battleInfo,40,940);
      }
    }
  }
}
