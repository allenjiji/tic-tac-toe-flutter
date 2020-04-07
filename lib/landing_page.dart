import 'package:flutter/material.dart';
import './gamepage.dart';

class LandingPage extends StatelessWidget {
  void gotoGame(BuildContext context, int n) {
    Navigator.of(context)
        .pushNamed(GamePage.routename, arguments: {'gamesstyle': n});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(alignment:Alignment.center,
        child: Image.asset('tic.png',),),
        Padding(
          padding: const EdgeInsets.all(100.0),
          child: Text(
            'TIC TAC TOE',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          onPressed: () => gotoGame(context, 1),
          child: Text(
            '1 Player (Man v/s Computer)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        RaisedButton(
          onPressed: () => gotoGame(context, 2),
          child: Text(
            '2 Player (Man v/s Man)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
