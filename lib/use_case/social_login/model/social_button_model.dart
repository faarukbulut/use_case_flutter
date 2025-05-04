import 'package:flutter/material.dart';

class SocialAdapterModel {
  final String title;
  final Color color;
  final IconData icon;

  SocialAdapterModel({required this.title, required this.color, required this.icon});

  factory SocialAdapterModel.facebook() => SocialAdapterModel(title: 'Facebook', color: Color(0xFF3B5998), icon: Icons.facebook);
  factory SocialAdapterModel.apple() => SocialAdapterModel(title: 'Apple', color: Colors.black, icon: Icons.apple);
  factory SocialAdapterModel.google() => SocialAdapterModel(title: 'Google', color: Color(0xFFDD4B39), icon: Icons.g_mobiledata);
}