import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Orange', 'score': 10},
        {'text': 'Purple', 'score': 10},
        {'text': 'Green', 'score': 6},
        {'text': 'Red', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 8},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Giraffe', 'score': 6}
      ],
    },
    {
      'questionText': 'What\'s your favorite team?',
      'answers': [
        {'text': 'Clemson', 'score': 10},
        {'text': 'Michigan', 'score': 7},
        {'text': 'Ohio State', 'score': 3},
        {'text': 'Alabama', 'score': 2}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore),
      ),
    );
  }
}
