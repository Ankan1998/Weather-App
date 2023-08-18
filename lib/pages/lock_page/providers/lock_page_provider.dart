import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class LockPageProvider with ChangeNotifier {
  bool _isLocationPermissionGiven = false;

  // Private constructor to prevent external instantiation
  LockPageProvider._();

  static final LockPageProvider _instance = LockPageProvider._();

  factory LockPageProvider() {
    return _instance;
  }

  bool get isLocationPermissionGiven => _isLocationPermissionGiven;

  Future<void> getPermission() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isLocationPermitted = prefs.getBool('isLocation');
    if (isLocationPermitted != null) {
      _isLocationPermissionGiven = true;
    } else {
      await Geolocator.requestPermission();
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        await Geolocator.requestPermission();
      } else {
        prefs.setBool('isLocation', true);
        _isLocationPermissionGiven = true;
        notifyListeners();
        //Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      }
    }
    notifyListeners();
  }
}

// class LockPageProvider with ChangeNotifier {
//   bool isLocationPermissionGiven = false;
//   Future<void> getPermission() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final bool? isLocationPermitted = prefs.getBool('isLocation');
//     if (isLocationPermitted != null) {
//       isLocationPermissionGiven = true;
//     } else {
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever ||
//           permission == LocationPermission.unableToDetermine) {
//         await Geolocator.requestPermission();
//       } else {
//         prefs.setBool('isLocation', true);
//         isLocationPermissionGiven = true;
//         notifyListeners();
//         //Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
//       }
//     }
//     print('rre $isLocationPermissionGiven');
//     notifyListeners();
//   }
// }
