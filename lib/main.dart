import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Orange', 'Purple', 'Green', 'Blue'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Tiger', 'Elephant', 'Giraffe']
      },
      {
        'questionText': 'What\'s your favorite team?',
        'answers': ['Clemson', 'Clemson', 'Clemson', 'Clemson']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]["questionText"]),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
