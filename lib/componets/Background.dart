import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';

class BackgroundGame extends SpriteComponent {

  Sprite bgSprite;
  Size dimensions;
  BackgroundGame(this.dimensions) :super.fromSprite( dimensions.width, dimensions.height, new Sprite('bg.png'));

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  bool destroy() {
    super.destroy();

    return false;
  }

  @override
  void resize(Size size) {
  }
}