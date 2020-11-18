import 'dart:async';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:game_base/main.dart';
import 'package:game_base/screens/game_over_screen.dart';

import 'package:sensors/sensors.dart';


const ComponentSize = 32.0;

class CarPlayer extends SpriteComponent {
  double position = 0.0;

  double newPosition = 0.0;
  bool isLeft = false;
  bool isRight = false;
  bool gameOver = false;

  double fuelCar = 100.0;

  int score = 0;

  CarPlayer() : super.fromSprite(32.0, 44.0, new Sprite('car-player.png'));

  @override
  void update(double t) {
    super.update(t);

    if( isLeft ) {
      newPosition -= t * 50;
    } else if( isRight ) {
      newPosition += t * 50;
    }

    this.x = newPosition + ( ComponentSize / 2 );

    if( newPosition > 190 ){
      newPosition = 190;
    } else if( newPosition <= 50) {
      newPosition = 50;
    }

    if( fuelCar <= 0 ) {
      Navigator.pushReplacement(
        buildContextGame,
        MaterialPageRoute(builder: (context) => GameOverScreen(carPlayer: this,)),
      );
    }

    print("POSS: $newPosition");
  }

  @override
  bool destroy() {
    return false;
  }

  @override
  void resize(Size size) {
    this.x = size.width;
    this.y = size.height - 250;
  }
}
