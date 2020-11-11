import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetQuiz;

  Result(this.finalScore, this.resetQuiz);

  String get phrase {
    if (finalScore <= 3) {
      return "We wouldn't get along. Your score was " + finalScore.toString();
    } else if (finalScore > 3 && finalScore <= 6) {
      return "We could be acquaintances! Your score was " +
          finalScore.toString();
    } else if (finalScore > 6) {
      return "We could be best friends! Your score was " +
          finalScore.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            phrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
              onPressed: resetQuiz,
              color: Colors.blue,
              child: Text(
                'Try again?',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
