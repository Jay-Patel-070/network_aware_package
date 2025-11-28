import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  NetworkService._();
  static final NetworkService instance = NetworkService._();

  final _controller = StreamController<bool>.broadcast();

  Stream<bool> get stream => _controller.stream;

  Future<bool> checkStatus() async {
    var results = await Connectivity().checkConnectivity();
    return results != ConnectivityResult.none;
  }

  void initialize() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      // result list can be empty when offline
      bool isOnline =
          results.isNotEmpty && results.first != ConnectivityResult.none;
      _controller.add(isOnline);
    });
  }
}
