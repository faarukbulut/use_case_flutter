import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class INetworkChangeManager{
  Future<NetworkResult> checkNetworkConnection();
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}

class NetworkChangeManager extends INetworkChangeManager{
  late final Connectivity _connectivity;
  StreamSubscription? _subscription;
  
  NetworkChangeManager(){
    _connectivity = Connectivity();
  }

  @override
  Future<NetworkResult> checkNetworkConnection() async{
    List<ConnectivityResult> connectivityResult = await _connectivity.checkConnectivity();
    return NetworkResult.checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallBack onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event){
      onChange.call(NetworkResult.checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

}

enum NetworkResult
{
  on,
  off;

  static NetworkResult checkConnectivityResult(List<ConnectivityResult> result){
    if(
      result.contains(ConnectivityResult.wifi) || 
      result.contains(ConnectivityResult.mobile) || 
      result.contains(ConnectivityResult.ethernet) || 
      result.contains(ConnectivityResult.vpn))
    {
      return NetworkResult.on;
    }

    return NetworkResult.off;
  }
}