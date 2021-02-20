import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  GameScreen({this.players});

  static String id = 'GameScreen';

  List<String> players;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController _textEditingController;
  List<String> players = [];

  List<String> games = [
    'Act like a Cat'
  ];

  int gameChooser() {
    return Random().nextInt(games.length);
  }

  int playerChooser() {
    return Random().nextInt(widget.players.length);
  }

  @override
  void initState() {
    super.initState();
    if(widget.players.isEmpty){
      Navigator.of(context).pop();
//      SnackBar(content: Text('No players found'));
    }
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.teal,
        title: Text(
          'Pictionary',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 14.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Current player',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFF1717),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Center(
                child: Text(
                  widget.players[playerChooser()],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 36.0,
                    shadows: <Shadow> [
                      Shadow(color: Colors.black, offset: Offset.fromDirection(0.8), blurRadius: 4.0)
                    ],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                height: 150,
                minWidth: 150,
                shape: CircleBorder(),
                color: Colors.teal,
                onPressed: () {
                  setState(
                    () {
                      showDialog<void>(
                          context: context,
                          barrierDismissible:
                              false, // false = user must tap button, true = tap outside dialog
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    games[gameChooser()],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 48.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: Color(0xFF751217),
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                    },
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  );
                },
                child: Text(
                  'Go',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
//              MaterialButton(
//                minWidth: 150,
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(
//                    20.0,
//                  ),
//                ),
//                color: Colors.teal,
//                onPressed: () {
//                  setState(() {});
//                },
//                child: Text(
//                  'Random player',
//                  style: TextStyle(color: Colors.white, fontSize: 24.0),
//                ),
//              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
