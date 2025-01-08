import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../config/router/app_route.dart';

class ProximityScreen extends StatefulWidget {
  const ProximityScreen({super.key});

  @override
  State<ProximityScreen> createState() => _ProximityScreenState();
}

class _ProximityScreenState extends State<ProximityScreen>
    with WidgetsBindingObserver {
  final double _proximityValue = 0;
  bool _isScreenOff = false;
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
    //   setState(() {
    //     _proximityValue = event.proximity;
    //     if (_proximityValue <= 1) {
    //       _turnOffScreen();
    //       Navigator.popAndPushNamed(context, AppRoute.loginRoute);
    //     } else {
    //       _turnOnScreen();
    //       Navigator.popAndPushNamed(context, AppRoute.loginRoute);
    //     }
    //   });
    // }));
  }

  @override
  void dispose() {
    for (var subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    WidgetsBinding.instance.removeObserver(this);
    _turnOnScreen();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // App is now visible and active
        Navigator.popAndPushNamed(context, AppRoute.proximityRoute);

        _turnOnScreen();
        break;
      case AppLifecycleState.inactive:
        // App is inactive
        dispose();
        break;
      case AppLifecycleState.paused:
        // App is paused
        _turnOnScreen(); // Make sure the screen is turned on when the app is paused
        dispose();
        break;
      case AppLifecycleState.detached:
        dispose();
        break;
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
