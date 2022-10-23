import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl implements NetworkChecker {
  const NetworkCheckerImpl(
    this.connectivity,
  );

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
