import 'package:flutter/material.dart';
import 'questions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 112, 207, 236), 
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image.asset('assets/images/question_mark.png',
            color: const Color.fromARGB(255, 255, 247, 247),),
            const SizedBox(height: 20), 
            const Text(
              'Learn about Israel in a fun way!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsScreen(key: UniqueKey()),
                  ),
                );
              },
              child: const Text('Start Quiz', style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
