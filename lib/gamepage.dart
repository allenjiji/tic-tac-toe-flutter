import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/score_board.dart';
import './models/game_button.dart';
import './dialoque_box.dart';

class GamePage extends StatefulWidget {
  static const routename = '/GamePage';
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  List<Game_Button> buttonlist;
  int game_style;
  var player1;
  var player2;
  var currentPlayer;
  var score1 = 0, score2 = 0;

  void initState() {
    super.initState();
    buttonlist = doInit();
  }

  List<Game_Button> doInit() {
    player1 = List();
    player2 = List();
    currentPlayer = 1;
    var gamebuttons = <Game_Button>[
      Game_Button(id: 1),
      Game_Button(id: 2),
      Game_Button(id: 3),
      Game_Button(id: 4),
      Game_Button(id: 5),
      Game_Button(id: 6),
      Game_Button(id: 7),
      Game_Button(id: 8),
      Game_Button(id: 9),
    ];
    return gamebuttons;
  }

  int winner = -1;
  int tie = 0;

  void resetGame() {
    //if (Navigator.canPop(context)) {
    if (winner == 1 || winner == 2 || tie == 1) {
      Navigator.pop(context);
      winner = -1;
    }
    setState(() {
      buttonlist = doInit();
    });
    buttonlist = doInit();
  }

  void checkwinner() {
    bool won_1, won_2;
    print(won_1);

    if ((player1.contains(1) && player1.contains(2) && player1.contains(3)) ||
        (player1.contains(4) && player1.contains(5) && player1.contains(6)) ||
        (player1.contains(7) && player1.contains(8) && player1.contains(9)) ||
        (player1.contains(1) && player1.contains(4) && player1.contains(7)) ||
        (player1.contains(2) && player1.contains(5) && player1.contains(8)) ||
        (player1.contains(3) && player1.contains(6) && player1.contains(9)) ||
        (player1.contains(1) && player1.contains(5) && player1.contains(9)) ||
        (player1.contains(3) && player1.contains(5) && player1.contains(7))) {
      print(won_1);
      winner = 1;
      setState(() {
        score1++;
      });
      showDialog(
          context: context,
          builder: (_) => DialogueBoxes(
                'Player 1 Won',
                'Reset to start the game again',
                resetGame,
              ));
    } else if ((player2.contains(1) &&
            player2.contains(2) &&
            player2.contains(3)) ||
        (player2.contains(4) && player2.contains(5) && player2.contains(6)) ||
        (player2.contains(7) && player2.contains(8) && player2.contains(9)) ||
        (player2.contains(1) && player2.contains(4) && player2.contains(7)) ||
        (player2.contains(2) && player2.contains(5) && player2.contains(8)) ||
        (player2.contains(3) && player2.contains(6) && player2.contains(9)) ||
        (player2.contains(1) && player2.contains(5) && player2.contains(9)) ||
        (player2.contains(3) && player2.contains(5) && player2.contains(7))) {
      print(won_2);
      winner = 2;
      setState(() {
        score2++;
      });
      showDialog(
          context: context,
          builder: (_) => DialogueBoxes(
                'Player 2 Won',
                'Reset to start the game again',
                resetGame,
              ));
    } else if (winner == -1) {
      if (buttonlist.every((p) => p.text != '')) {
        tie = 1;
        showDialog(
            context: context,
            builder: (_) => DialogueBoxes('Tie', 'The Game is Tie', resetGame));
      } else {
        (currentPlayer == 2 && game_style == 1) ? autoplay() : null;
      }
    }
  }

  void autoplay() {
    var emptyCells = List();
    var simpleList = List.generate(9, (i) => i + 1);
    for (var cell_no in simpleList) {
      if (!(player1.contains(cell_no) || player2.contains(cell_no))) {
        emptyCells.add(cell_no);
      }
    }
    var r = Random();
    var randIndex = r.nextInt((emptyCells.length - 1));
    var cell_no = emptyCells[randIndex];
    int i = buttonlist.indexWhere((p) => p.id == cell_no);
    button_pressed(buttonlist[i]);
  }

  void button_pressed(Game_Button gb) {
    setState(() {
      if (gb.enabled == true) {
        if (currentPlayer == 1) {
          gb.text = 'X';
          gb.bg = Theme.of(context).primaryColor;
          currentPlayer = 2;
          player1.add(gb.id);
        } else {
          gb.text = 'O';
          gb.bg = Theme.of(context).accentColor;
          currentPlayer = 1;
          player2.add(gb.id);
        }
        gb.enabled = false;
        checkwinner();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, int>;
    game_style = routeArgs['gamesstyle'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              padding: const EdgeInsets.all(10),
              itemCount: buttonlist.length,
              itemBuilder: (context, index) => SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  onPressed: buttonlist[index].enabled
                      ? () => button_pressed(buttonlist[index])
                      : null,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      buttonlist[index].text,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: buttonlist[index].bg,
                  disabledColor: buttonlist[index].bg,
                ),
              ),
            ),
          ),
          ScoreBoard(score1, score2),
          Container(
            child: RaisedButton(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    'RESET THE GAME',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: resetGame,
              hoverColor: Colors.blue,
              elevation: 2,
            ),
          )
        ],
      ),
    );
  }
}
