import 'package:barty/db/Repository.dart';
import 'package:barty/model/Bar.dart';
import 'package:barty/service/LocationService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scoped_model/scoped_model.dart';

class BarsViewModel extends Model {
  
  final Repository repository = Repository();
  final LocationService locationService = LocationService();
  
  Future<Position> _userLocation;
  Future<Position> get userLocation => _userLocation;
  set userLocation(Future<Position> location) {
    _userLocation = location;
    notifyListeners();
  }

  Future<List<Bar>> _bars;
  Future<List<Bar>> get bars => _bars;
  set bars(Future<List<Bar>> value) {
    _bars = value;
    notifyListeners();
  }

  Future<bool> fetchUserLocation() async {
    if (userLocation == null) {
      userLocation = locationService.getUserLocation();
    }
    return _userLocation != null;
  }

  Future<bool> fetchBars() async {
    if (bars == null) bars = repository?.fetchBars();
    return _bars != null;
  }
}
