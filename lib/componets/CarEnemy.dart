import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componets/CarEnemy2.dart';
import 'package:game_base/componets/CarPlayer.dart';
import 'package:game_base/screens/game_over_screen.dart';

import '../main.dart';

const ComponentSize = 60.0;
const SPEED = 35.0;

class CarEnemy extends SpriteComponent {
  Size dimensions;
  Random random = new Random(10);
  CarPlayer carPlayer;

  bool stopCar = false;
  CarEnemy(this.dimensions,this.carPlayer) : super.fromSprite(32.0, 44.0, new Sprite('car-enemy.png'));

  @override
  void update(double t) {
    super.update(t);

    if(!stopCar)
      this.y  -= t * SPEED;

    if ( carPlayer != null ) {
        if (!carPlayer.gameOver) {
          bool remove = this.toRect().contains(carPlayer.toRect().bottomCenter) ||
              this.toRect().contains(carPlayer.toRect().bottomLeft) ||
              this.toRect().contains(carPlayer.toRect().bottomRight) || this.toRect().contains(carPlayer.toRect().topCenter);
          if (remove) {
            carPlayer.gameOver = true;
            stopCar = true;

            Navigator.pushReplacement(
              buildContextGame,
              MaterialPageRoute(builder: (context) => GameOverScreen(carPlayer: carPlayer,)),
            );
          }
        }
      }
  }

  @override
  bool destroy() {
    return false;
  }

  @override
  void resize(Size size) {
    var positionX = random.nextDouble();
    // print(positionX);

    this.x = 170;
    this.y = 900;
  }
}
