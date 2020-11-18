import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/components/component.dart';
import 'package:game_base/componets/CarPlayer.dart';

const SPEED = 25.0;

class Fuel extends SpriteComponent {

  CarPlayer carPlayer;

  Fuel(this.carPlayer) : super.square(30.0, 'fuel.png');

  Random random = new Random(100);

  bool destroyFuel = false;
  @override
  void update(double t) {
    super.update(t);
    this.y += t * SPEED;

    if( this.y >= 700 ) {
     destroyFuel = true;
    }

    if ( carPlayer != null ) {
      if (!carPlayer.gameOver) {
        bool remove = this.toRect().contains(carPlayer.toRect().bottomCenter) ||
            this.toRect().contains(carPlayer.toRect().bottomLeft) ||
            this.toRect().contains(carPlayer.toRect().bottomRight) || this.toRect().contains(carPlayer.toRect().topCenter);
        if (remove) {
          destroyFuel = true;
          carPlayer.fuelCar += 20;
        }
      }
    }
  }

  @override
  bool destroy() {
    return destroyFuel;
  }

  @override
  void resize(Size size) {
    this.x = 120;
    this.y = 0;
  }
}
