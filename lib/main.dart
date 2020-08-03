import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// import './question.dart'; // this is a relative import
// import './answer.dart';

void main() {
  runApp(MyApp());
}

/* This is how we create a stateful widget
It must return instance from state class below */
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// class for state, State<MyApp> is a pointer to stateful widget
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "questions": "What is your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 8},
        {"text": "Snake", "score": 6},
        {"text": "Insects", "score": 4}
      ],
    },
    {
      "questions": "What is your favorite food?",
      "answers": [
        {"text": "Kebab", "score": 10},
        {"text": "Pilaf", "score": 8},
        {"text": "Manti", "score": 6},
        {"text": "Burger", "score": 4}
      ],
    },
    {
      "questions": "What is your favorite sitcom?",
      "answers": [
        {"text": "Frasier", "score": 10},
        {"text": "Seinfeld", "score": 8},
        {"text": "Cheers", "score": 6},
        {"text": "Big Bang Theory", "score": 4}
      ],
    }
  ];

  void _buttonPressed(int score) {
    _totalScore += score;
    /* setState is needed for forcing Flutter to re-render the page
    when the question index (state) increments. It returns nothing */
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    // this is a dummy if from the Flutter tutorial
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("We do not have any more questions");
    }
  }

  void _resetScore() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Application"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                buttonPressed: _buttonPressed,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetScore),
      ),
    );
  }
}
