class Event {
  String title;
  String description;
  int numPeople;
  int duration;

  Event({
    this.title,
    this.description,
    this.numPeople,
    this.duration,
  });

  void setTitle(String t){
    title = t;
  }

  void setDescription(String d){
    description = d;
  }

  void setNumPeople(int n){
    numPeople = n;
  }

  void setDuration(int s){
    duration = s;
  }

}
