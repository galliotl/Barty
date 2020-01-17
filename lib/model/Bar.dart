import 'package:latlong/latlong.dart';

class Bar {
  String name;
  String imagePath;
  String type;
  String address;
  String openingHours;
  double rating;
  LatLng coordinates;

  Bar({
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
      bars.add(Bar(
        address: "random$i avenue , AT",
        name: "Bar$i",
        imagePath:
            "https://assets3.thrillist.com/v1/image/1743398/size/tmg-article_default_mobile.jpg",
        openingHours: "6am - ${i + 1}pm",
        type: "dance $i",
        rating: 4.5,
        coordinates: LatLng(51.5+(i/100), -0.09+(i/100))
      ));
    }
    return bars;
  }
}
