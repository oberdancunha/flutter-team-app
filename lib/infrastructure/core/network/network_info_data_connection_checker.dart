import 'package:data_connection_checker/data_connection_checker.dart';

import '../../../core/network/i_network_info.dart';

class NetworkInfoDataConnectionChecker implements INetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoDataConnectionChecker(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
