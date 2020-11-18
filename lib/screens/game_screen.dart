import 'package:flutter/material.dart';
import 'package:game_base/core/base_game.dart';
import 'package:game_base/main.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    buildContextGame = context;
    return GameBase(dimensions).widget;
  }
}