import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spin_wheel/screens/spinning_wheel_widget.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class SpinningWheel extends StatefulWidget {
  final List<String> questions;

  const SpinningWheel({super.key, required this.questions});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random _random = Random();
  double _angle = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          _angle = _animation.value * 2 * pi;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _showSelectedQuestion();
        }
      });
  }

  void _spinWheel() {
    _controller.forward(from: 0.0);
  }

  void _showSelectedQuestion() {
    int index = (_angle ~/ (2 * pi / widget.questions.length)) %
        widget.questions.length;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Selected Question"),
        content: Text(widget.questions[index]),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: _angle,
            child: SizedBox(
              height: 400,
              width: 400,
              child: CustomPaint(
                painter: WheelPainter(widget.questions),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _spinWheel,
            child: const Text('Spin the Wheel!'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
