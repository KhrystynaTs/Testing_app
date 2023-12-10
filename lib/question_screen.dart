import 'package:flutter/material.dart';
import 'package:project_2/answer_button.dart';
import 'package:project_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectAnswer});

  final void Function(String answer) onselectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onselectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      //tells dart:
      currentQuestionIndex++;
    }); //increments the value by 1;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        // this value means use as much width as you can,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
            /* AnswerButton(
            answerText: currentQuestion.answers[0],
            onTap: () {},
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: currentQuestion.answers[1],
            onTap: () {},
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: currentQuestion.answers[2],
            onTap: () {},
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: currentQuestion.answers[3],
            onTap: () {},
          ), */
          ],
        ),
      ),
    );
  }
}
