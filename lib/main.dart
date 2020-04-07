import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/gamepage.dart';
import './homepage.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    return MaterialApp(

      title: 'TicTacToe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,accentColor: Colors.orange),
      //home: HomePage(),
      routes: {
        '/': (context)=>HomePage(),
        GamePage.routename :(context)=>GamePage(),
      },
    );
  }
}

