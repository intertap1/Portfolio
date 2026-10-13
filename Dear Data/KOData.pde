class KOData {
  KOEvent[] events;
  KOData() {
    loadData();
  }
  void loadData() {
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
  KOEvent[] getEvents() {
    return events;
  }
}
