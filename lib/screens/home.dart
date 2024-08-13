import 'package:flutter/material.dart';
import 'package:spin_wheel/screens/spinning_wheel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spinning Wheel App'),
      ),
      body: const SpinningWheel(),
    );
  }
}
