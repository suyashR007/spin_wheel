import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spin_wheel/constants/list.dart';
import 'package:spin_wheel/widgets/primary_textfield.dart';

class SpinnerController extends GetxController {
  SpinnerController() {
    selected = StreamController<int>();
    answerController = TextEditingController();
  }
  late final StreamController<int> selected;
  late final TextEditingController answerController;
  int randomIndex = 0;

  void spinWheel() {
    final random = Random();
    randomIndex = random.nextInt(questions.length);
    selected.add(randomIndex);
  }

  showSheet() async {
    String questionAsk = questions[randomIndex];

    Get.dialog(
      AlertDialog(
        title: const Text(
          'Selected Question',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              questionAsk,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            PrimaryTextField(
              controller: answerController,
              hintText: 'Type your Answer here',
              onChanged: (p0) {},
              keyboard: TextInputType.text,
              maxlines: 4,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }
}
