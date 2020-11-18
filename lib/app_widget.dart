import 'package:flutter/material.dart';
import 'package:game_base/screens/menu_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainMenu(),
    );
  }
}
