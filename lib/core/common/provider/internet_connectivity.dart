// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum ConnectivityStatus { notDetermined, isConnected, isDisconnected }

// final connectivityStatusProvider =
//     StateNotifierProvider<ConnectivityStatusNotifier, ConnectivityStatus>(
//   (ref) => ConnectivityStatusNotifier(),
// );

// class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
//   late ConnectivityStatus lastResult;
//   late ConnectivityStatus newState;

//   ConnectivityStatusNotifier() : super(ConnectivityStatus.notDetermined) {
//     lastResult = state;

//     // Check the initial connectivity status
//     Connectivity().checkConnectivity().then((ConnectivityResult result) {
//           _updateState(result);
//         } as FutureOr Function(List<ConnectivityResult> value));

//     // Listen to connectivity changes
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//           _updateState(result);
//         } as void Function(List<ConnectivityResult> event)?);
//   }

//   void _updateState(ConnectivityResult result) {
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi) {
//       newState = ConnectivityStatus.isConnected;
//     } else {
//       newState = ConnectivityStatus.isDisconnected;
//     }
//     if (newState != lastResult) {
//       state = newState;
//       lastResult = newState;
//     }
//   }
// }
