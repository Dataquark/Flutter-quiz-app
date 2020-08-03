import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  // this is a getter
  String get resultText {
    String resultPhrase;

    if (resultScore <= 12) {
      resultPhrase = "You got fairly low score";
    } else if (resultScore <= 18) {
      resultPhrase = "You got a medium score";
    } else {
      resultPhrase = "You achieved great things";
    }

    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Reset the quiz"),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
