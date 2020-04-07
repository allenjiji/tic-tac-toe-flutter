import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dialoque_box.dart';
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
      home: HomePage(),
      
    );
  }
}

