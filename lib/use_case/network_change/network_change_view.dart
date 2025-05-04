import 'package:flutter/material.dart';

class NetworkChangeView extends StatefulWidget {
  const NetworkChangeView({super.key});

  @override
  State<NetworkChangeView> createState() => _NetworkChangeViewState();
}

class _NetworkChangeViewState extends State<NetworkChangeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Placeholder(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.abc_rounded),
        label: 'Page 1'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.abc_rounded),
        label: 'Page 2'
      ),
    ]);
  }
}