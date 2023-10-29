import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onSelectedAnswer;

  // Construtor
  const Answer(this.text, this.onSelectedAnswer, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelectedAnswer,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
          textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
        ),
        child: Text(text),
      ),
    );
  }
}
