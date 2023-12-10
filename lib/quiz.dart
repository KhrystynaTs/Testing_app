import 'package:flutter/material.dart';
import 'package:project_2/data/questions.dart';
import 'package:project_2/start_screen.dart';
import 'package:project_2/question_screen.dart';
import 'package:project_2/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  /* We can use ternary expressions or initState functions.
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(swithScreen);
    super.initState();
  }
*/
  void swithScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(swithScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onselectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 31, 14, 59),
                Color.fromARGB(255, 232, 230, 236)
              ],
            )),
            child: screenWidget
            /*child: activeScreen == 'start-screen'
              ? StartScreen(swithScreen)
              : const QuestionsScreen(), */ //Ternary expressions
            ),
      ),
    );
  }
}
