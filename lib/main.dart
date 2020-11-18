import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/app_widget.dart';
import 'package:game_base/core/base_game.dart';


var game;

BuildContext buildContextGame;
var dimensions;

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.images
      .loadAll(['car-enemy2.png', 'car-enemy.png', 'car-player.png', 'fuel.png', 'road.png', 'bg.png']);

  bool music = false;
  Flame.audio.load('music1.mp3');
//
  if( !music ) {
    Flame.bgm.stop();
    Flame.bgm.play('music1.mp3', volume: 0.2);
    music = true;
  }
  dimensions = await Flame.util.initialDimensions();
  game = GameBase(dimensions);
  return runApp(AppWidget());
}


