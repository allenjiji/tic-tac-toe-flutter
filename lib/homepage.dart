import 'package:flutter/material.dart';
import './landing_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body:Center(child: LandingPage()),
      
    );
  }
}