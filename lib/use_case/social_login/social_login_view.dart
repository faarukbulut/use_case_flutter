import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/social_login/core/social_adapter.dart';
import 'package:use_case_flutter/use_case/social_login/widget/social_button_widget.dart';

class SocialLoginView extends StatefulWidget {
  const SocialLoginView({super.key});

  @override
  State<SocialLoginView> createState() => _SocialLoginViewState();
}

class _SocialLoginViewState extends State<SocialLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Social View')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButtonWidget(
              adapter: FacebookAdapter(),
              onCompleted: print,
            ),
            SocialButtonWidget(
              adapter: AppleAdapter(),
              onCompleted: print,
            ),
            SocialButtonWidget(
              adapter: GoogleAdapter(),
              onCompleted: print,
            ),
          ],
        ),
      ),
    );
  }
}