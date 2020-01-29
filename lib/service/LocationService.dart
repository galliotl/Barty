import 'package:geolocator/geolocator.dart';

class LocationService {

  Position _lastknownLocation;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Future<bool> checkStatus() async {
    var status = await geolocator.checkGeolocationPermissionStatus();
    if(GeolocationStatus.granted == status) {  
      return await geolocator.isLocationServiceEnabled();
    }
    return false; 
  }

  Future<Position> getUserLocation() async {
    if(await checkStatus() && _lastknownLocation == null) {
      // permission is on and accepted
      _lastknownLocation = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    }
    return _lastknownLocation;
  } 
}
