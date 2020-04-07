import 'package:flutter/material.dart';

class DialogueBoxes extends StatelessWidget {
  final title;
  final content;
  final Function callback;
  final actionText;
  DialogueBoxes(this.title, this.content, this.callback,
      [this.actionText = 'Reset Game']);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          child: Text(actionText),
        )
      ],
    );
  }
}
