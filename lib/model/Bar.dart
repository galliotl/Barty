import 'package:barty/model/Beverage.dart';
import 'package:barty/model/Event.dart';
import 'package:latlong/latlong.dart';

class Bar {
  String bid;
  String name;
  String imagePath;
  String type;
  String address;
  String openingHours;
  double rating;
  LatLng coordinates;

  Bar({
    this.bid,
    this.name,
    this.address,
    this.imagePath,
    this.openingHours,
    this.rating,
    this.type,
    this.coordinates,
  });

  static List<Bar> generateRandomBars(int numberOfBars) {
    List<Bar> bars = [];
    for (var i = 0; i < numberOfBars; i++) {
      bars.add(
        Bar(
          bid: "uuid-237298",
          address: "random$i avenue , AT",
          name: "Bar$i",
          imagePath:
              "https://assets3.thrillist.com/v1/image/1743398/size/tmg-article_default_mobile.jpg",
          openingHours: "6am - ${i + 1}pm",
          type: "dance $i",
          rating: 4.5,
          coordinates: LatLng(51.5 + (i / 100), -0.09 + (i / 100)),
        ),
      );
    }
    return bars;
  }
}

class BarPageDetail {
  Bar bar;
  List<Event> events;
  List<Beverage> servedBeverages;

  BarPageDetail({this.bar, this.events, this.servedBeverages});

  static generateRandomBarDetail() {
    List<Bar> bars = Bar.generateRandomBars(1);
    List<Event> events = Event.generateRandomEvents(3);
    List<Beverage> servedBeverages = Beverage.generateRandomBeverage(3);

    return BarPageDetail(
      bar: bars[0],
      events: events,
      servedBeverages: servedBeverages,
    );
  }
}
