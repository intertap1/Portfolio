ArrayList<Match> matches = new ArrayList<Match>();

class KOEvent {
  String attacker;
  String defender;
  boolean myKO;

  KOEvent(String attacker, String defender, boolean myKO) {
    this.attacker = attacker;
    this.defender = defender;
    this.myKO = myKO;
  }
}

class Match {
  int matchNumber;
  ArrayList<KOEvent> events;

  Match(int MatchNumber) {
    this.matchNumber = matchNumber;
    events = new ArrayList<KOEvent>();
  }
  void addKO(String attacker, String defender, boolean myKO) {
    events.add(new KOEvent(attacker, defender, myKO));
  }
}


void setup() {
  Match match1 = new Match(1);
  match1.addKO("Ting-Lu","Incineroar",true);
  matches.add(match1);
  size(2800, 1000);
  
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


