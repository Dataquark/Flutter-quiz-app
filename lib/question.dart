import "package:flutter/material.dart";

class Question extends StatelessWidget {
  /* we put final because it is a StatelessWidget
  we should make the internal state immutable */
  final String questionText;

  /*this is a constructor similar to def __init__ method in Python
  and this is a short form of constructor */
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // it centers the text according to Container
      margin: EdgeInsets.all(10), // take 10px of space from all 4 directions
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28), // Text has named arguments for styling
        textAlign: TextAlign.center, // This is an Enum - predefined variables
      ),
    );
  }
}
