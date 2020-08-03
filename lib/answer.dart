import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function stateHandler; // property, type=func, must have a pointer func
  final String answerText;
  Answer(this.stateHandler, this.answerText); // constructor
  // answerText is coming from the step 20-21 in the Workflow

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // take the full width of our screen
      child: RaisedButton(
        color: Colors.lightBlue, // Colors has static properties with colours
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: stateHandler, // function itself, not the result
      ),
    );
  }
}
