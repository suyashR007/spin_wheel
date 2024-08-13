import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:spin_wheel/constants/list.dart';

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel> {
  late final StreamController<int> selected;
  int randomIndex = 0;

  @override
  void initState() {
    super.initState();
    selected = StreamController<int>();
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _spinWheel() {
    final random = Random();
    randomIndex = random.nextInt(questions.length);
    selected.add(randomIndex);
  }

  showSheet() async {
    String questionAsk = questions[randomIndex];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Selected Question'),
        content: Text(questionAsk),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: FortuneWheel(
              selected: selected.stream,
              animateFirst: false,
              hapticImpact: HapticImpact.medium,
              onAnimationEnd: () => showSheet(),
              items: [
                for (int i = 0; i < questions.length; i++)
                  FortuneItem(
                    style: FortuneItemStyle(
                        color: segmentColors[i], borderWidth: 0),
                    child: Text(
                      questions[i],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
              indicators: const <FortuneIndicator>[
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(
                    color: Colors.black,
                  ),
                ),
              ],
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
}
