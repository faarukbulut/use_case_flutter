import 'package:flutter/material.dart';
import 'package:use_case_flutter/core/init/main_build.dart';
import 'package:use_case_flutter/use_case/social_login/social_login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: MainBuild.build,
      home: SocialLoginView(),
    );
  }
}
