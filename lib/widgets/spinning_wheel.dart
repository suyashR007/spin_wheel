import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spin_wheel/constants/list.dart';
import 'package:spin_wheel/controllers/spinner_controller.dart';

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpinnerController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: FortuneWheel(
                selected: controller.selected.stream,
                animateFirst: false,
                hapticImpact: HapticImpact.medium,
                onAnimationEnd: () => controller.showSheet(),
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
              onPressed: controller.spinWheel,
              child: const Text('Spin the Wheel!'),
            ),
          ],
        ),
      ),
    );
  }
}
