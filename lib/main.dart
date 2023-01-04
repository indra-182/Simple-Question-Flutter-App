import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionsIndex = 0;
  static const questions = [
    {
      "questionText": "What\'s your favorite color?",
      "answers": ["Black", "Red", "Green"]
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": ["Horse", "Tiger", "Lion"]
    },
    {
      "questionText": "What\'s your favorite food?",
      "answers": ["Kebab", "Hamburger", "Pizza"]
    },
  ];

  void answerQuestions() {
    setState(() {
      questionsIndex += 1;
      print(questionsIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Question Aps"),
        ),
        body: questionsIndex < questions.length
            ? Column(
                children: [
                  Question(questions[questionsIndex]["questionText"]),
                  ...(questions[questionsIndex]['answers'] as List<String>)
                      .map((e) => Answer(answerQuestions, e))
                      .toList()
                ],
              )
            : Center(
                child: Text("U did it!"),
              ),
      ),
    );
  }
}
