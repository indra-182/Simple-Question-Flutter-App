import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "Apa ibukota dari negara Indonesia?",
      "answers": [
        {"text": "Jakarta", "score": 25},
        {"text": "Bandung", "score": 0},
        {"text": "Makassar", "score": 0},
        {"text": "Medan", "score": 0},
      ]
    },
    {
      "questionText": "Siapa presiden Republik Indonesia yang pertama?",
      "answers": [
        {"text": "Jokowi", "score": 0},
        {"text": "SBY", "score": 0},
        {"text": "Gusdur", "score": 0},
        {"text": "Soekarno", "score": 25},
      ]
    },
    {
      "questionText": "Hari ulang tahun Pancasila pada tanggal?",
      "answers": [
        {"text": "2 Juni", "score": 0},
        {"text": "1 Juni", "score": 25},
        {"text": "2 Juli", "score": 0},
        {"text": "1 Juli", "score": 0},
      ]
    },
    {
      "questionText": "Hari kemerdekaan Republik Indonesia pada tanggal?",
      "answers": [
        {"text": "17 Agustus 1945", "score": 25},
        {"text": "18 Agustus 1945", "score": 0},
        {"text": "17 Agustus 1946", "score": 0},
        {"text": "18 Agustus 1946", "score": 0},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Simple Quiz Apps'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
