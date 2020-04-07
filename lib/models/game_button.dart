import 'package:flutter/material.dart';

class Game_Button{
  final id;
  String text;
  Color bg;
  bool enabled;

  Game_Button({this.id,this.text='',this.bg=Colors.grey,this.enabled= true});
}