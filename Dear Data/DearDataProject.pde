int rowCount;
int totalPages = 4;
int dataPage = 1;
KOEvent[] events;

void setup() {
  size(1900, 960);
  background(255);
  setupTable();
  setupData();
}

void draw() {
  frameRate(60);
};


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
  // Convert the mouse position into the grid coordinates
  int match = round((mouseX - 40) / 10.0);
  int order = round((mouseY - 80) / 80.0);

  if (mouseX < 40 || mouseY < 80) {
    return;
  }

  if (order < 0 || order > 8) {
    return;
  }

  String battleInfo = displayBattleInfo(match, order);
  println(mouseX, mouseY);
  fill(255);
  rect(40, 925, 960, 25);
  fill(0);
  textSize(15);
  text(battleInfo, 40, 940);
}

void keyPressed() {
  int oldPage = dataPage;
  if (keyCode == RIGHT && dataPage < totalPages) {
    dataPage++;
  }

  if (keyCode == LEFT && dataPage > 1) {
    dataPage--;
  }
  if (dataPage != oldPage) {
    setupData();
  }
}

void setupData() {
  background(255);
  
  switch (dataPage) {
  case 1:
    for (int m = 1; m <= 25; m++) {
      int count = 0;

      for (KOEvent event : events) {
        if (event.match == m) {
          count++;
          event.display();
        }
      }

      println("Match " + m + ": " + count + " events");
    }
    break;
  case 2:
    for (int m = 26; m <= 50; m++) {
      int count = 0;

      for (KOEvent event : events) {
        if (event.match == m) {
          count++;
          event.display();
        }
      }

      println("Match " + m + ": " + count + " events");
    }
    break;
  case 3:
    for (int m = 51; m <= 75; m++) {
      int count = 0;

      for (KOEvent event : events) {
        if (event.match == m) {
          count++;
          event.display();
        }
      }

      println("Match " + m + ": " + count + " events");
    }
    break;
  case 4:
    for (int m = 76; m <= 100; m++) {
      int count = 0;

      for (KOEvent event : events) {
        if (event.match == m) {
          count++;
          event.display();
        }
      }

      println("Match " + m + ": " + count + " events");
    }
    break;
  }
  setupGraph();
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
