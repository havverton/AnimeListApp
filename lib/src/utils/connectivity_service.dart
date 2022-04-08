import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

enum ConnectionType {
  bluetooth,
  ethernet,
  mobile,
  wifi,
  none,
}

@injectable
abstract class ConnectivityService {
  Future<ConnectionType> getConnectionType();
  Stream<ConnectionType> get stream;

  @factoryMethod
  factory ConnectivityService.fromConnectivity(Connectivity connectivity) =
      _ConnectivityService;
}

class _ConnectivityService implements ConnectivityService {
  final Connectivity _connectivity;

  const _ConnectivityService(this._connectivity);

  @override
  Future<ConnectionType> getConnectionType() {
    return _connectivity.checkConnectivity().then(_from);
  }

  @override
  Stream<ConnectionType> get stream {
    return _connectivity.onConnectivityChanged.map(_from);
  }

  ConnectionType _from(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return ConnectionType.wifi;
      case ConnectivityResult.mobile:
        return ConnectionType.mobile;
      case ConnectivityResult.none:
        return ConnectionType.none;
    }
  }
}
