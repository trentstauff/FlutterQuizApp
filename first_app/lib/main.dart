import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _score = 0;
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Green', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Monkey', 'score': 2},
        {'text': 'Dog', 'score': 3}
      ],
    },
    {
      'questionText': "What\'s your favourite car?",
      'answers': [
        {'text': 'Ford', 'score': 1},
        {'text': 'Mercedes', 'score': 2},
        {'text': 'Ferrari', 'score': 3}
      ],
    },
  ];

  void _answerQuestion(int answerScore) {
    _score += answerScore;
    setState(() {
      _questionIndex++;
    });
    print(_score);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('New Friend Quiz!'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(_questions, _questionIndex, _answerQuestion)
          : Result(_score, _resetQuiz)
    ));
  }
}
