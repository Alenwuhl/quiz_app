import 'package:flutter/material.dart';
import 'questions_screen.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<int> selectedAnswers;

  const ResultScreen({super.key, 
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final int correctAnswers = selectedAnswers
        .asMap()
        .entries
        .where((entry) => entry.value == questions[entry.key].correctAnswerIndex)
        .length;
    final double percentage = (correctAnswers / questions.length) * 100;

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 112, 207, 236),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 50),
            ),
            const Text(
              'Quiz Results',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'You got $correctAnswers out of ${questions.length} correct (${percentage.toStringAsFixed(0)}%)',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final selectedAnswer = selectedAnswers[index];
                  final isCorrect = selectedAnswer == question.correctAnswerIndex;
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.text,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Your answer: ${question.answers[selectedAnswer]}',
                            style: TextStyle(
                              color: isCorrect ? Colors.black : Colors.red,
                            ),
                          ),
                          if (!isCorrect)
                            Text(
                              'Correct answer: ${question.answers[question.correctAnswerIndex]}',
                              style: const TextStyle(color: Colors.green),
                            ),
                          const SizedBox(height: 10),
                          Icon(
                            isCorrect ? Icons.check : Icons.close,
                            color: isCorrect
                                ? const Color.fromARGB(255, 47, 222, 53)
                                : const Color.fromARGB(255, 238, 49, 36),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(key: UniqueKey())),
                  );
                },
                child: const Text('Start Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
