import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/splash_view_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with WidgetsBindingObserver {
  bool _isScreenOff = false;
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    // Wait for 2 seconds and then navigate
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(splashViewModelProvider.notifier).init(context);
    });
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
    //   if (mounted &&
    //       WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
    //     setState(() {
    //       _proximityValue = event.proximity;
    //       if (_proximityValue <= 4) {
    //         _turnOffScreen();
    //       } else {
    //         _turnOnScreen();
    //       }
    //     });
    //   }
    // }));
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // App is now visible and active
        // _streamSubscriptions
        //     .add(proximityEvents!.listen((ProximityEvent event) {
        //   if (mounted) {
        //     setState(() {
        //       _proximityValue = event.proximity;
        //       if (_proximityValue <= 4) {
        //         _turnOffScreen();
        //       } else {
        //         _turnOnScreen();
        //       }
        //     });
        //   }
        // }));
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        // App is paused or inactive
        for (var subscription in _streamSubscriptions) {
          subscription.cancel();
        }
        _turnOnScreen(); // Make sure the screen is turned on when the app is paused or inactive
        break;
      case AppLifecycleState.detached:
        dispose();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'The Job Finder',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text('version : 1.0.0')
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 4,
            child: const Text(
              'Developed by: The Job Finder team',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
