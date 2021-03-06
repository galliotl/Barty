import 'package:barty/model/Bar.dart';
import 'package:barty/model/BeverageCategory.dart';
import 'package:barty/model/Event.dart';
import 'package:barty/model/User.dart';

class Repository {
  
  Future<List<Bar>> fetchBars() async {
    var future = Future.delayed(Duration(seconds: 1), () {
      return Bar.generateRandomBars(3);
    });
    return await future;
  }

  Future<List<Event>> fetchEvents() async {
    var future = Future.delayed(Duration(seconds: 1), () {
      return Event.generateRandomEvents(3);
    });
    return await future;
  }

  Future<List<BeverageCategory>> fetchBeverageCategories() async {
    var future = Future.delayed(Duration(seconds: 1), () {
      return BeverageCategory.generateRandomBeverageCategories(9);
    });
    return await future;
  }

  Future<BarPageDetail> fetchBarDetail(String barId) async {
    var future = Future.delayed(Duration(seconds: 1), () {
      return BarPageDetail.generateRandomBarDetail();
    });
    return await future;
  }

  Future<bool> validateUserWithBar(String uid, String bid) async {
    var future = Future.delayed(Duration(seconds: 1), () {
      return true;
    });
    return await future;
  }

}
