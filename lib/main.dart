import 'package:flutter/material.dart';
import 'package:use_case_flutter/core/init/main_build.dart';
import 'package:use_case_flutter/example/network_change_example.dart';
import 'package:use_case_flutter/use_case/network_change/network_fail_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: MainBuild.build,
      home: NetworkChangeView(),
    );
  }
}
