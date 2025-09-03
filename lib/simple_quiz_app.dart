import 'dart:async';

import 'package:flutter/material.dart';
import 'package:start_quiz_app/logic/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SimpleQuizAPP extends StatefulWidget {
  SimpleQuizAPP({super.key});

  @override
  State<SimpleQuizAPP> createState() => _SimpleQuizAPPState();
}

class _SimpleQuizAPPState extends State<SimpleQuizAPP> {
  Quizbrain quizBrain = Quizbrain();
  List<Icon> scorekeeper = [];
  bool isFinish = false;
  void addUserScore(userAnswer) {
    if (quizBrain.isFinish()) {
      print("finish");

      Timer(Duration(seconds: 1), () {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Done",
          desc: "Will Done",
        ).show();
        setState(() {
          quizBrain.reset();
          scorekeeper.clear();
        });
      });

      // Future.delayed(Duration(seconds: 3), () {
      //   Alert(
      //     context: context,
      //     type: AlertType.success,
      //     title: "Done",
      //     desc: "Will Done",
      //   ).show();
      // });
    } else {
      setState(() {
        quizBrain.checkAnswer(true)
            ? scorekeeper.add(Icon(Icons.check, color: Colors.green))
            : scorekeeper.add(Icon(Icons.close, color: Colors.red));
        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  quizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => addUserScore(true),

                  child: Text('True', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => addUserScore(false),
                  child: Text('false', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: scorekeeper),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Questions >> list question
each question has a text and an answer


QuizBrain >> next , check , finsih 

OOP


*/