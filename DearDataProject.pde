void setup() {
  Table data = loadTable("Data.csv", "header");
  println(data.getRowCount());
  int rowCount = 0;
  for (TableRow row : data.rows()) {
    int match = row.getInt("match");
    int order = row.getInt("order");
    String attacker = row.getString("attacker");
    String defender = row.getString("defender");
    boolean myKO = row.getString("myKO").equals("TRUE");
    println(match,order,attacker,defender,myKO);
    rowCount++;
  }
  size(1080, 960);
}

void draw() {
  float bottom = height-40;
  float top = 40;
  float right = width-40;
  float left = 40;
  background(255);
  strokeWeight(6);
  line(left, top, left, bottom);
  line(left, bottom, right, bottom);
};
