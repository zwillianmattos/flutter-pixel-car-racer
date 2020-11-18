import 'package:flutter/material.dart';
import 'package:game_base/componets/CarPlayer.dart';
import 'package:game_base/screens/game_screen.dart';

class GameOverScreen extends StatefulWidget {

  final CarPlayer carPlayer;

  const GameOverScreen({Key key, this.carPlayer}) : super(key: key);

  @override
  _GameOverScreenState createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/bg.png',
            scale: 0.2,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,),
          Container(
            padding: EdgeInsets.all(15.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text('Score: ${widget.carPlayer.score}', style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () {



                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameScreen()));
                      },
                      child: Text('Restart'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
