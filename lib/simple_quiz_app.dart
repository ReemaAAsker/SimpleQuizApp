import 'package:flutter/material.dart';
import 'package:start_quiz_app/logic/QuizBrain.dart';

class SimpleQuizAPP extends StatefulWidget {
  SimpleQuizAPP({super.key});

  @override
  State<SimpleQuizAPP> createState() => _SimpleQuizAPPState();
}

class _SimpleQuizAPPState extends State<SimpleQuizAPP> {
  Quizbrain quizBrain = Quizbrain();
  List<Icon> scorekeeper = [];
  void addUserScore(userAnswer) {
    setState(() {
      quizBrain.checkAnswer(true)
          ? scorekeeper.add(Icon(Icons.check, color: Colors.green))
          : scorekeeper.add(Icon(Icons.close, color: Colors.red));
      quizBrain.nextQuestion();
    });
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