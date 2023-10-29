import 'package:flutter/material.dart';
import 'questions_widget.dart';
import 'result_widget.dart';
import 'answer_widget.dart';

main() => runApp(const QuizApp());

// Dentro dessa classe, eu extendo State e uso a notação Generics dizendo que ela é do tipo E, sendo este tipo E, a classe com estado que eu quero gerenciar. Nesse caso, quero gerenciar a classe QuizApp, que é uma classe com estado, visto que ela extende StatefulWidget.
class QuizAppState extends State<QuizApp> {
  // esse é o meu estado que quero controlar
  var _currentQuestionIndex = 0;

  var _totalScore = 0;

  /// List of `questions` as a Map, which each represents a question and its
  /// corresponding answers (two key-value pairs): 'question' and 'answers'. The value of
  /// 'question' is a string representing the question, and the value of 'answers' is a list of
  /// strings representing the possible answers to the question.
  final List<Map<String, Object>> _questions = const [
    {
      'question': 'Who discovered the electricity?',
      'answers': [
        {'text': 'Thomas Edison', 'score': 5},
        {'text': 'Benjamin Franklin', 'score': 10},
        {'text': 'Nikola Tesla', 'score': 3},
        {'text': 'Alexander Graham Bell', 'score': 1},
      ],
    },
    {
      'question':
          'Which economic system was in place in soviet nation during the URSS?',
      'answers': [
        {'text': 'Communism', 'score': 10},
        {'text': 'Socialism', 'score': 1},
        {'text': 'Capitalism', 'score': 3},
        {'text': 'Republic of Social Communism', 'score': 5},
      ],
    },
    {
      'question': 'Is it possible to travel back in time and change the past?',
      'answers': [
        {
          'text':
              'Yes, but it depends on which time branch you would interfere.',
          'score': 5
        },
        {'text': 'It\'s not possible travel back in time.', 'score': 3},
        {'text': 'Yes, theoretically.', 'score': 10},
        {'text': 'If you change the past you\'ll change the past.', 'score': 1},
      ],
    }
  ];

  // Esse método é o que manipulará a mudança do valor de [_currentQuestionIndex] e, por isso, ele precisa vir para dentro dessa classe que vai gerenciar o estado.
  // Precisaremos criar um método que será chamado nos onPressure dos botões.
  // Ideal criar o método dentro da própria classe, encapsulado nela.
  void _onAnswer(int partialScore) {
    // Preciso colocar esse trecho que está alterando a variável dentro de um setState, para ele ficar monitorando que houve a mudança e reagir modificando a interface.
    if (isCurrentQuestionIndexValid) {
      setState(() {
        _currentQuestionIndex++;
        _totalScore += partialScore;
        // print(_selectedQuestion);
      });
    }
  }

  /// The `isCurrentQuestionIndexValid` method is checking if the current question index is valid. It
  /// returns a boolean value indicating whether the current question index is less than the length of
  /// the `_questions` list.
  bool get isCurrentQuestionIndexValid {
    return _currentQuestionIndex < _questions.length;
  }

  // Este método build(BuildContext context) precisa vir para cá pois ela é uma árvore de widgets que dependerá do estado para ser renderizada.
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answersOptionsList = isCurrentQuestionIndexValid
        ? _questions[_currentQuestionIndex].cast()['answers']
        : [];

    // Abordagem mais declarativa (ou funcional)
    List<Widget> answersOptionsWidgetList = answersOptionsList
        .map(
          (eachAnswerText) => Answer(
            eachAnswerText['text'] as String,
            () => _onAnswer(
              int.parse(eachAnswerText['score'].toString()),
            ),
          ),
        )
        .toList();

    // Abordagem mais imperativa
    // /// Iterating over the list of answers for the current question and adding each answer as an `Answer` Widget to the `answersList`.
    // for (String answerText in answers) {
    //   answersList.add(Answer(answerText, _answer));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QUESTIONS'),
        ),
        body: isCurrentQuestionIndexValid
            ? Questions(
                questionStatement:
                    _questions[_currentQuestionIndex]['question'].toString(),
                answersOptionsWidgetList: answersOptionsWidgetList,
              )
            : Result(score: _totalScore),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  // O que conecta o componente Stateful com o meu estado são dois pontos: a herança lá na classe que gerencia o estado (State<QuizApp>) e o componente Stateful com o método create().
  @override
  QuizAppState createState() {
    return QuizAppState();
  }
}
