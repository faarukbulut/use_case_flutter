import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/network_change/network_change_manager.dart';

class NetworkFailWidget extends StatefulWidget {
  const NetworkFailWidget({super.key});

  @override
  State<NetworkFailWidget> createState() => _NetworkFailWidgetState();
}

class _NetworkFailWidgetState extends State<NetworkFailWidget> with StateMixin{
  late final INetworkChangeManager _networkChange;
  NetworkResult? networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    fetchFirstResult();
    waitForScreen((){
      _networkChange.handleNetworkChange((result){
        _updateView(result);
      });
    });
  }

  Future<void> fetchFirstResult() async{
    waitForScreen(() async{
      final result = await _networkChange.checkNetworkConnection();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result){
    setState(() {
      networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      crossFadeState: networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Center(
          child: Text(
            'İnternet bağlantısı bulunamadı. Lütfen bağlantınızı kontrol ediniz.', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        )
      ),
      secondChild: const SizedBox(),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T>{
  void waitForScreen(VoidCallback onComplete){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      onComplete.call();
    });
  }
}