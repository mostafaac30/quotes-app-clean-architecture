import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class InternetInfoImp implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  InternetInfoImp({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
