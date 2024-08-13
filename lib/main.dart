import 'package:flutter/material.dart';
import 'package:spin_wheel/screens/spin_wheel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> questions = [
      'What is Dart?',
      'Explain Null Safety',
      'What is Flutter?',
      'What is Widget Tree?',
      'What is Tree Shaking',
      'What is GetX?',
    ];

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Spinning Wheel App'),
          ),
          body: const SpinningWheel(questions: questions),
        ));
  }
}
