import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result({
    super.key,
    required this.score,
  });

  // Preciso de um getter para definir a exibição em função da pontuação
  String get resultMessage {
    String message;
    switch (score) {
      case 10:
        message = 'Only one question right, bro?';
        break;
      case 20:
        message = 'Almost there!';
        break;
      case 30:
        message = 'Great job, Jedi!';
        break;
      default:
        message = 'Your knowledge is the same as anyone\'s.';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultMessage,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
