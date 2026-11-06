int rowCount;
int totalPages = 5;
int dataPage = 1;
KOEvent[] events;
KOGraph graph;
KOData data;

void setup() {
  size(1900, 960);
  data = new KOData();
  events = data.getEvents();
  graph = new KOGraph();
}

void draw() {
  frameRate(1);
  graph.drawData(events,dataPage);
};



void mousePressed() {
  graph.getMatchOrder(mouseX,mouseY,dataPage);
}

void keyPressed() {
  if (keyCode == RIGHT && dataPage < totalPages) {
    dataPage++;
  }

  if (keyCode == LEFT && dataPage > 1) {
    dataPage--;
  }
}
