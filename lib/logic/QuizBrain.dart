import 'package:start_quiz_app/logic/question.dart';

class Quizbrain {
  int questionNumber = 0;
  int userScore = 0;
  List<Question> _questionBank = [
    Question('In Flutter, everything is a widget.', true),
    Question(
      'The "StatelessWidget" can hold state that changes during runtime.',
      false,
    ),
    Question(
      'The "hot reload" feature allows developers to see code changes instantly without losing the app state.',
      true,
    ),
    Question(
      'In Flutter, the main function must always return a Widget.',
      false,
    ),
    Question('Flutter uses the Dart programming language.', true),
  ];

  void nextQuestion() {
    if (questionNumber == _questionBank.length - 1) {
      questionNumber = 0;
    } else
      ++questionNumber;
  }

  String getQuestionText() {
    return _questionBank[questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return false;
  }

  bool isFinish() {
    return false;
  }

  bool checkAnswer(userAnswer) {
    return _questionBank[questionNumber].questionAnswer == userAnswer;
  }
}
