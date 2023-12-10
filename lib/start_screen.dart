import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuize, {super.key});
  final void Function() startQuize;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(height: 50),

          Container(
            height: 30,
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Hello!',
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                RotateAnimatedText('Learn Flutter the fun way!',
                    textStyle: const TextStyle(
                        letterSpacing: 3,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10,
              pause: const Duration(milliseconds: 1500),
            ),
          ),
          // const Text(
          // 'Learn Flutter the fun way!',
          //style: TextStyle(
          //  color: Colors.white,
          //fontSize: 24,
          //),
          //),

          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuize,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
