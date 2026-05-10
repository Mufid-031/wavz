import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

class ConnectivityService {
  ConnectivityService() : _connectivity = Connectivity();
  final Connectivity _connectivity;

  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;

  Future<List<ConnectivityResult>> checkConnectivity() => _connectivity.checkConnectivity();
}

@riverpod
ConnectivityService connectivityService(ConnectivityServiceRef ref) {
  return ConnectivityService();
}
