import 'dart:async';
import 'dart:io';


class ProximitySensorManager {
  final double _proximityValue = 0;
  bool _isScreenOff = false;
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  void dispose() {
    for (var subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  void _turnOffScreen() async {
    if (!_isScreenOff) {
      _isScreenOff = true;
      // if (Platform.isAndroid) {
      //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
      // }
    }
  }

  void _turnOnScreen() async {
    if (_isScreenOff) {
      _isScreenOff = false;
      // if (Platform.isAndroid) {
      //   await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
      // }
    }
  }

  // void startProximitySensor() {
  //   _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
  //     _proximityValue = event.proximity;
  //     if (_proximityValue <= 1) {
  //       _turnOffScreen();
  //     } else {
  //       _turnOnScreen();
  //     }
  //   }));
  // }
}
