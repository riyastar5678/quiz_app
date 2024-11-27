import 'package:flutter/material.dart';
import 'package:quiz_app/screen/welcomescreen.dart';


void main()
{
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: Welcomescreen(),
    );
  }
}