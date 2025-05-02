import 'package:flutter/material.dart';

class ClearTextAction extends Action<ClearTextIntent>{

  String text = '';

  @override
  void invoke(ClearTextIntent intent) {
    final _value = intent.text;
    if(_value != null && _value.isNotEmpty){
      text = _value;
    }
    else{
      text = '';
    }
    notifyActionListeners();
  }
}

class ClearTextIntent extends Intent{
  final String? text;

  const ClearTextIntent({this.text});
}