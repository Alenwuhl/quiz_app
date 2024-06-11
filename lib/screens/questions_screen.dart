import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentQuestionIndex = 0;
  List<int> _selectedAnswers = [];
  final List<Question> _questions = [
    Question(
      text: 'Which is the capital of Israel?',
      answers: ['Jerusalem', 'Tel Aviv', 'Haifa', 'Eilat'],
      correctAnswerIndex: 0,
    ),
    Question(
      text: 'Which is the official language of Israel?',
      answers: ['Arabic', 'English', 'Hebrew', 'French'],
      correctAnswerIndex: 2,
    ),
    Question(
      text: 'Which is the currency of Israel?',
      answers: ['Dollar', 'Shekel', 'Euro', 'Pound'],
      correctAnswerIndex: 1,
    ),
  ];

  void _answerQuestion(int selectedIndex) {
    setState(() {
      _selectedAnswers.add(selectedIndex);
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              questions: _questions,
              selectedAnswers: _selectedAnswers,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 112, 207, 236),
      appBar: AppBar(
        title: const Text('Quiz Questions'),
        backgroundColor: const Color.fromARGB(255, 112, 207, 236),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.answers.asMap().entries.map((entry) {
              int idx = entry.key;
              String answer = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SizedBox(
                  width: 300, 
                  child: ElevatedButton(
                    onPressed: () => _answerQuestion(idx),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, 
                    ),
                    child: Text(
                      answer,
                      style: const TextStyle(color: Colors.black), 
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({
    required this.text,
    required this.answers,
    required this.correctAnswerIndex,
  });
}
