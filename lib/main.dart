import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

main() => runApp(const QuizApp());

// Dentro dessa classe, eu extendo State e uso a notação Generics dizendo que ela é do tipo E, sendo este tipo E, a classe com estado que eu quero gerenciar. Nesse caso, quero gerenciar a classe QuizApp, que é uma classe com estado, visto que ela extende StatefulWidget.
class QuizAppState extends State<QuizApp> {
  // esse é o meu estado que quero controlar
  var _currentQuestionIndex = 0;

  /// List of `questions` as a Map, which each represents a question and its
  /// corresponding answers (two key-value pairs): 'question' and 'answers'. The value of
  /// 'question' is a string representing the question, and the value of 'answers' is a list of
  /// strings representing the possible answers to the question.
  final List<Map<String, Object>> _questions = const [
    {
      'question': 'What is your favorite color?',
      'answers': ['Red', 'Blue', 'Green', 'Yellow'],
    },
    {
      'question': 'What is your first pet\'s name?',
      'answers': ['Yoshi', 'Pakito', 'Bethoven', 'Hulk'],
    },
    {
      'question': 'Where is your hometown?',
      'answers': ['Recife', 'Salvador', 'Aracaju', 'Rio de Janeiro'],
    }
  ];

  // Esse método é o que manipulará a mudança do valor de `_selectedQuestion` e, por isso, ele precisa vir para dentro dessa classe que vai gerenciar o estado.
  // Precisaremos criar um método que será chamado nos onPressure dos botões.
  // Ideal criar o método dentro da própria classe, encapsulado nela.
  void _answer() {
    // Preciso colocar esse trecho que está alterando a variável dentro de um setState, para ele ficar monitorando que houve a mudança e reagir modificando a interface.
    if (isCurrentQuestionIndexValid) {
      setState(() {
        _currentQuestionIndex++;
        // print(_selectedQuestion);
      });
    }
  }

  bool get isCurrentQuestionIndexValid {
    return _currentQuestionIndex < _questions.length;
  }

  // Este método build(BuildContext context) precisa vir para cá pois ela é uma árvore de widgets que dependerá do estado para ser renderizada.
  @override
  Widget build(BuildContext context) {
    List<String> answersList = isCurrentQuestionIndexValid
        ? _questions[_currentQuestionIndex].cast()['answers']
        : [];

    // Abordagem mais declaraiva (ou funcional)
    List<Widget> answersWidgetsList = answersList
        .map((eachAnswerText) => Answer(eachAnswerText, _answer))
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
            ? Column(
                children: <Widget>[
                  // Question(questions[elementNumberFromList][Key].toString())
                  Question(
                      _questions[_currentQuestionIndex]['question'].toString()),
                  ...answersWidgetsList,
                ],
              )
            : const Center(
                child: Text(
                  'Good job!',
                  style: TextStyle(fontSize: 28),
                ),
              ),
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
