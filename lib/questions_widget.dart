import 'package:flutter/material.dart';
import 'question_option_widget.dart';

class Questions extends StatelessWidget {
  final String questionStatement;
  final List<Widget> answersOptionsWidgetList;

  const Questions({
    Key? key,
    required this.questionStatement,
    required this.answersOptionsWidgetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        QuestionOptions(questionStatement),
        ...answersOptionsWidgetList,
      ],
    );
  }
}
