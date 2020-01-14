import 'dart:ffi';

class Bar {
  String name;
  String imagePath;
  String type;
  String address;
  String openingHours;
  Float rating;

  Bar({
    this.name,
    this.address,
    this.imagePath,
    this.openingHours,
    this.rating,
    this.type,
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
      ));
    }
    return bars;
  }
}
