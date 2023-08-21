import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text("Multi Pro"),
    );
  }
}
