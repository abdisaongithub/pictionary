import 'package:flutter/material.dart';
import 'package:pictionary/game_screen.dart';
import 'package:pictionary/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        '/' : (context) => WelcomeScreen(),
        GameScreen.id : (context) => GameScreen(),
      },
    );
  }
}

