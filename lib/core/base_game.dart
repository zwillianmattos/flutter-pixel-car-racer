import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componets/Background.dart';
import 'package:game_base/componets/Fuel.dart';
import 'package:game_base/componets/CarEnemy2.dart';
import 'package:game_base/componets/CarEnemy.dart';
import 'package:game_base/componets/CarPlayer.dart';
import 'package:sensors/sensors.dart';
import 'package:flame/anchor.dart';
import 'package:flame/text_config.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/gestures.dart';

CarEnemy carEnemy;
CarEnemy2 carEnemy2;
BackgroundGame background;

bool backgroundExist = false;
bool isSpaceCraftExist = false;
bool generateFuel = false;

TextComponent textScore;
TextComponent textFuel;

double creationTimer = 0.0;
double scoreTimer = 0.0;
double fuelSpawnTimer = 0.0;

bool isDragon = false;

class GameBase extends BaseGame with TapDetector {
  Size dimensions;
  CarPlayer carPlayer = new CarPlayer();
  Fuel fuel;

  bool mostraCabecalho = false;



  GameBase(this.dimensions) {
    backgroundExist = false;
    isSpaceCraftExist = false;
    background = new BackgroundGame(this.dimensions);

    carPlayer.score = 0;
    carPlayer.gameOver = false;
    carPlayer.fuelCar = 100;

    creationTimer = 0.0;
    scoreTimer = 0.0;
    fuelSpawnTimer = 0.0;

    gyroscopeEvents.listen((GyroscopeEvent event) {
      if (!carPlayer.gameOver) {
        if (event.y >= 0.4033850121498108) {
          carPlayer.isLeft = false;
          carPlayer.isRight = true;
        } else if (event.y <= -0.4033850121498108) {
          carPlayer.isLeft = true;
          carPlayer.isRight = false;
        }
      } else {
        carPlayer.isLeft = false;
        carPlayer.isRight = false;
      }
    });


  }

  @override
  void update(double t) {

    if (!backgroundExist) {
      add(background);
      backgroundExist = true;
    }

    if (!mostraCabecalho) {


      textScore = TextComponent('Score: ${carPlayer.score}',
          config: TextConfig(color: Colors.white))
        ..anchor = Anchor.topCenter
        ..x = dimensions.width - 100
        ..y = 32.0;

      textFuel =
          TextComponent('Fuel: ${carPlayer.fuelCar.toStringAsFixed(2)}', config: TextConfig(color: Colors.white))
            ..anchor = Anchor.topCenter
            ..x = dimensions.width - 100
            ..y = 84.0;

      add(textScore);
      add(textFuel);

      mostraCabecalho = true;
    }

    if (!carPlayer.gameOver) {
      if (carPlayer.fuelCar <= 0) {
        carPlayer.fuelCar = 0;
        carPlayer.gameOver = true;
      } else {
        carPlayer.fuelCar -= 2 * t;
      }
    }

    textFuel.text = "Fuel: ${carPlayer.fuelCar.toStringAsFixed(2)}";

    scoreTimer += t;
    if (scoreTimer > 2 && !carPlayer.gameOver) {
      scoreTimer = 0;
      carPlayer.score += 1;
      textScore.text = 'Score: ${carPlayer.score}';
    }

    fuelSpawnTimer += t;
    if (fuelSpawnTimer >= 15) {
      fuelSpawnTimer = 0.0;
      if (generateFuel) {
        generateFuel = false;
      } else {
        fuel = new Fuel(carPlayer);
        add(fuel);
        generateFuel = true;
      }
    }

    if (!isSpaceCraftExist) {
      add(carPlayer);
      isSpaceCraftExist = true;
    }

    creationTimer += t;

    if (creationTimer >= 5) {
      creationTimer = 0.0;

      if (isDragon) {
        isDragon = false;
        carEnemy = new CarEnemy(dimensions, carPlayer);
        add(carEnemy);
      } else {
        carEnemy2 = new CarEnemy2(dimensions, carPlayer);
        add(carEnemy2);
        isDragon = true;
      }
    }

    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownDetails details) {
    // print(
    //     "Tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    // spacecraft.position = details.globalPosition.dx;
    // disparo(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    // print(
    //     "Tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }
}
