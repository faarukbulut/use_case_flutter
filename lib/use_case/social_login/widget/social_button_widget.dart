import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/social_login/core/social_adapter.dart';

class SocialButtonWidget extends StatelessWidget {
  final ISocialAdapter adapter;
  final void Function(String token) onCompleted;

  const SocialButtonWidget({super.key, required this.adapter, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final response = await adapter.make.call();
        if(response.isEmpty) return;
        
        onCompleted.call(response);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: adapter.model.color
      ),
      icon: Icon(adapter.model.icon, color: Colors.white),
      label: Text(adapter.model.title, style: TextStyle(color: Colors.white)),
    );
  }
}