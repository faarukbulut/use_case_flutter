import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/network_change/network_fail_widget.dart';

class MainBuild {
  MainBuild._();

  static Widget build(BuildContext context, Widget? child){
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox(),
        ),
        const NetworkFailWidget(),
      ],
    );
  }
}
