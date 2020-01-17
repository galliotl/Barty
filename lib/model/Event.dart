class Event {
  String title;
  String imagePath;
  String date;
  String barName;

  Event({
    this.title,
    this.date,
    this.imagePath,
    this.barName,
  });

  static List<Event> generateRandomEvents(int numberOfEvents) {
    List<Event> events = [];
    for (var i = 0; i < numberOfEvents; i++) {
      events.add(Event(
        barName: "Bar$i",
        imagePath:
            "https://assets3.thrillist.com/v1/image/1743398/size/tmg-article_default_mobile.jpg",
        date: "2${i + 1}/07",
        title: "dance $i",
      ));
    }
    return events;
  }
}
