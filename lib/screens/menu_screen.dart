import 'package:flutter/material.dart';
import 'package:game_base/screens/game_screen.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
                Image.asset('assets/images/logo.png',
                  scale: 1,
                  fit: BoxFit.scaleDown,
                  width: MediaQuery.of(context).size.width,),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                      },
                      child: Text('Jogar'),
                    ),
                    RaisedButton(
                      onPressed: () {

                      },
                      child: Text('Sair'),
                    )
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
