import 'package:barty/db/Repository.dart';
import 'package:barty/model/Bar.dart';
import 'package:barty/model/Event.dart';
import 'package:scoped_model/scoped_model.dart';

class DiscoverViewModel extends Model {
  
  Future<List<Bar>> _bars;
  Future<List<Bar>> get bars => _bars;
  set bars(Future<List<Bar>> value) {
    _bars = value;
    notifyListeners();
  }

  Future<List<Event>> _events;
  Future<List<Event>> get events => _events;
  set events(Future<List<Event>> value) {
    _events = value;
    notifyListeners();
  }

  final Repository repository = Repository();

  Future<bool> fetchBars() async {
    if(bars == null) bars = repository?.fetchBars();
    return _bars != null;
  }

  Future<bool> fetchEvents() async {
    if(events == null) events = repository?.fetchEvents();
    return _events != null;
  }

}